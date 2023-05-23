using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Twilio.TwiML.Messaging;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.Models.Entities;
using Web.Models.Enums.Order;
using Web.Models.Request;
using Web.Models.Respone;
using Web.Utils;
using Web.Utils.DateTimeExtensions;

namespace Web.AppCore.Services
{
    public class OrderService : BaseDomainService<OrderService>, IOrderService
    {
        private readonly IPublisherQueue _publisherQueue;
        private readonly IOrderUoW _orderUoW;
        private readonly IOrderItemUoW _orderItemUoW;
        private readonly IProductUoW _productUoW;


        public OrderService(IPublisherQueue publisherQueue, IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _publisherQueue = publisherQueue;
            _orderUoW = serviceProvider.GetRequiredService<IOrderUoW>();
            _orderItemUoW = serviceProvider.GetRequiredService<IOrderItemUoW>();
            _productUoW = serviceProvider.GetRequiredService<IProductUoW>();
        }

        /// <summary>
        /// Xóa đơn hàng
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        public async Task<bool> DeleteOrderAsync(string orderId)
        {
            try
            {
                if (string.IsNullOrEmpty(orderId)) return false;
                //Xóa chi tiết đơn hàng
                var orderItems = await _orderItemUoW.OrderItems.GetAllAsync(x => x.order_id == orderId);
                await _orderItemUoW.OrderItems.DeleteManyAsync(orderItems);
                //Xóa đơn hàng
                var resDelete = await _orderUoW.Orders.DeleteOneAsync(orderId);
                return resDelete;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"{ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Xóa đơn hàng
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        public async Task<bool> DeleteOrdersAsync(IEnumerable<string> orderIds)
        {
            try
            {
                if (orderIds == null && orderIds.Count() <= 0) return false;

                //Xóa chi tiết đơn hàng
                var orderItems = await _orderItemUoW.OrderItems.GetAllAsync(x => orderIds.Any(o => o == x.order_id));
                await _orderItemUoW.OrderItems.DeleteManyAsync(orderItems);
                //Xóa đơn hàng
                var resDelete = await _orderUoW.Orders.DeleteManyAsync(orderIds);
                return resDelete;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"{ex.Message}");
                return false;
            }
        }

        public async Task<Order> GetOrderAsync(string orderId)
        {
            return await _orderUoW.Orders.GetByIdAsync(orderId);
        }

        public async Task<Pagging<Order>> GetOrderPageAsync(Pagination pagination, Func<Order, bool> predicate)
        {
            return await _orderUoW.Orders.GetPaggingAsync(pagination, predicate);
        }

        /// <summary>
        /// Thêm đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public async Task<bool> InsertOrderAsync(OrderRequest order)
        {
            try
            {
                var orderInsert = await _orderUoW.Orders.InsertOneAsync(order);
                if (orderInsert == null) return false;

                //Thêm chi tiết đơn hàng
                if (order.order_items != null && order.order_items.Count > 0)
                {
                    var productsColor = await _productUoW.Colors.GetAllAsync(x => order.order_items.AnyExt(o => x.product_id == o.product_id && x.size_name == o.size_name && x.color_name == o.color_name));
                    foreach (var orderItem in order.order_items)
                    {
                        orderItem.order_id = order.id;
                        var productColor = productsColor.FirstOrDefault(x => x.product_id == orderItem.product_id && x.size_name == orderItem.size_name && x.color_name == orderItem.color_name);
                        if (productColor != null)
                        {
                            productColor.amount -= orderItem.quantity;
                        }
                    }

                    await _orderItemUoW.OrderItems.InsertManyAsync(order.order_items);
                    //Cập nhật số lượng tồn
                    await _productUoW.Colors.UpdateManyAsync(productsColor);
                    var products = await _productUoW.Products.GetAllAsync(x => order.order_items.AnyExt(o => x.id == o.product_id));
                    if (products.AnyExt())
                    {
                        await _publisherQueue.PublishUpdateAmountProductAsync(products);
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"{ex.Message}");
                return false;
            }
        }

        public async Task<bool> InsertOrderOnQueueAsync(OrderRequest order, IDictionary<string, object> headers)
        {
            return await InsertOrderAsync(order);
        }

        /// <summary>
        /// Cập nhật đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public async Task<bool> UpdateOrderAsync(Order order)
        {
            return await _orderUoW.Orders.UpdateOneAsync(order);
        }

        public async Task<bool> UpdateOrderAsync()
        {
            return await _publisherQueue.PublishUpdateOrderAsync("Hello World");
        }

        /// <summary>
        /// Cập nhật thanh toán đơn hàng vào DB
        /// </summary>
        /// <returns></returns>
        public Task<bool> UpdatePaymentOrderAsync()
        {
            throw new NotImplementedException();
        }

        public async Task<bool> UpdateOrderOnQueueAsync(Order order, IDictionary<string, object> headers)
        {
            return await _orderUoW.Orders.UpdateOneAsync(order);
        }

        public async Task<bool> ValidateProductOrderAsync(List<OrderItemRequest> orderItems)
        {
            var products = await _productUoW.Colors.GetAllAsync();
            if (!products.Any()) return true;

            var productsCheck = products.Where(x => orderItems.AnyExt(o => x.product_id == o.product_id && x.amount < o.quantity && x.color_name == o.color_name && x.size_name == o.size_name));
            return productsCheck.Any();
        }

        public async Task<SaleStatistic> GetSaleStatisticAsync(PeriodType periodType)
        {
            var salesStatistic = new SaleStatistic() { PeriodType = periodType };
            switch (periodType)
            {
                case PeriodType.Last7Days:
                    salesStatistic.SaleStatisticText = new List<string> { "Ngày 1", "Ngày 2", "Ngày 3", "Ngày 4", "Ngày 5", "Ngày 6", "Ngày 7" };
                    break;
                case PeriodType.ThisMonth:
                    salesStatistic.SaleStatisticText = new List<string> { "Tuần 1", "Tuần 2", "Tuần 3", "Tuần 4", "Tuần 5" };
                    break;
                case PeriodType.ThisYear:
                    salesStatistic.SaleStatisticText = new List<string> { "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12" };
                    break;
            }

            var rangeTime = GetRangeDateTimeOfPeriod(periodType);
            var ordersPeriod = await _orderUoW.Orders.GetAllAsync(x => x.created_date != null && (x.created_date.Value.Date >= rangeTime.Item1.Date || x.created_date.Value.Date <= rangeTime.Item2.Date));
            var orders = ordersPeriod?.ToList();
            var firstDateRange =  new DateTime(rangeTime.Item1.Year, rangeTime.Item1.Month, rangeTime.Item1.Day, 0, 0, 0);
            var lastDateRange = new DateTime(rangeTime.Item1.Year, rangeTime.Item1.Month, rangeTime.Item1.Day, 23, 59, 59);

            //Lấy thông tin thống kê
            foreach (var text in salesStatistic.SaleStatisticText)
            {
                if (periodType == PeriodType.Last7Days) lastDateRange = firstDateRange.AddDays(1);
                if (periodType == PeriodType.ThisMonth)
                {
                    lastDateRange = firstDateRange.AddDays(7);
                    if (lastDateRange.Date >= rangeTime.Item2.Date) lastDateRange = rangeTime.Item2.Date;
                }
                if (periodType == PeriodType.ThisYear) lastDateRange = firstDateRange.AddMonths(1);
                var orderWeek = orders.WhereExt(x => x.created_date.Value.Date >= firstDateRange.Date && x.created_date.Value < lastDateRange.Date);
                var orderInfoStatistic = new OrderInfo() { Sales = 0, NumberOrder = 0 };
                if (orderWeek != null)
                {
                    orderInfoStatistic.Sales = orderWeek.SumExt(x => x.total_order);
                    orderInfoStatistic.NumberOrder = orderWeek.CountExt();
                }
                salesStatistic.OrderInfos.Add(orderInfoStatistic);
                firstDateRange = lastDateRange;

            }
            return salesStatistic;
        }

        private DateTime GetFirtDateTimeOfPeriod(PeriodType periodType)
        {
            var toDay = DateTime.Now;
            var dateTime = DateTime.Now;
            switch (periodType)
            {
                case PeriodType.Last7Days:
                    dateTime = toDay.StartOfWeek(DayOfWeek.Monday);

                    break;
                case PeriodType.ThisMonth:
                    dateTime = new DateTime(toDay.Year, toDay.Month, 1);
                    break;
                case PeriodType.ThisYear:
                    dateTime = new DateTime(toDay.Year, 1, 1);
                    break;
            }
            return dateTime;
        }

        private (DateTime, DateTime) GetRangeDateTimeOfPeriod(PeriodType periodType)
        {
            var toDay = DateTime.Now;
            (DateTime, DateTime) rangeTime = (DateTime.Now, DateTime.Now);
            switch (periodType)
            {
                case PeriodType.Last7Days:
                    rangeTime.Item1 = toDay.StartOfWeek(DayOfWeek.Monday);
                    rangeTime.Item2 = toDay.StartOfWeek(DayOfWeek.Sunday).AddDays(7);
                    break;
                case PeriodType.ThisMonth:
                    rangeTime.Item1 = new DateTime(toDay.Year, toDay.Month, 1);
                    rangeTime.Item2 = rangeTime.Item1.AddMonths(1).AddDays(-1);
                    break;
                case PeriodType.ThisYear:
                    rangeTime.Item1 = new DateTime(toDay.Year, 1, 1);
                    rangeTime.Item2 = rangeTime.Item1.AddYears(1).AddDays(-1);
                    break;
            }

            rangeTime.Item1 = new DateTime(rangeTime.Item1.Year, rangeTime.Item1.Month, rangeTime.Item1.Day, 0, 0, 0);
            rangeTime.Item2 = new DateTime(rangeTime.Item2.Year, rangeTime.Item2.Month, rangeTime.Item2.Day, 23, 59, 59);
            return rangeTime;
        }

    }
}
