using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Entities;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.Models.Entities;
using Web.Models.Request;

namespace Web.AppCore.Services
{
    public class OrderService : BaseDomainService<OrderService>, IOrderService
    {
        private readonly IPublisherQueue _publisherQueue;
        private readonly IOrderUoW _orderUoW;
        private readonly IOrderItemUoW _orderItemUoW;


        public OrderService(IPublisherQueue publisherQueue, IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _publisherQueue = publisherQueue;
            _orderUoW = serviceProvider.GetRequiredService<IOrderUoW>();
            _orderItemUoW = serviceProvider.GetRequiredService<IOrderItemUoW>();
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
                return false;
            }
        }

        public async Task<Order> GetOrderAsync(string orderId)
        {
            return await _orderUoW.Orders.GetByIdAsync(orderId);
        }

        public async Task<Pagging<Order>> GetOrderPageAsync(Pagination pagination)
        {
            return await _orderUoW.Orders.GetPaggingAsync(pagination);
        }

        /// <summary>
        /// Thêm đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public async Task<bool> InsertOrderAsync(OrderRequest orderRequest)
        {
            try
            {
                var orderInsert = await _orderUoW.Orders.InsertOneAsync(orderRequest);
                if (orderInsert == null) return false;

                //Thêm chi tiết đơn hàng
                if (orderRequest.order_items != null && orderRequest.order_items.Count > 0)
                {
                    await _orderItemUoW.OrderItems.InsertManyAsync(orderRequest.order_items);
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
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
    }
}
