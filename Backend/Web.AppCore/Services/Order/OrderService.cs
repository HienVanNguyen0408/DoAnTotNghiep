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

namespace Web.AppCore.Services
{
    public class OrderService : BaseDomainService<OrderService>, IOrderService
    {
        private readonly IPublisherQueue _publisherQueue;
        private readonly IOrderUoW _orderUoW;
        public OrderService(IPublisherQueue publisherQueue, IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _publisherQueue = publisherQueue;
            _orderUoW = serviceProvider.GetRequiredService<IOrderUoW>();
        }

        /// <summary>
        /// Xóa đơn hàng
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        public async Task<bool> DeleteOrderAsync(string orderId)
        {
            return await _orderUoW.Orders.DeleteOneAsync(orderId);
        }

        /// <summary>
        /// Thêm đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public async Task<bool> InsertOrderAsync(Order order)
        {
            return await _orderUoW.Orders.InsertOneAsync(order);
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
