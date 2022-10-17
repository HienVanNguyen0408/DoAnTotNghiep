using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Entities;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Interfaces.Services.MessageQueue;

namespace Web.AppCore.Services
{
    public class OrderService : BaseDomainService<OrderService>, IOrderService
    {
        private readonly IPublisherQueue _publisherQueue;
        public OrderService(IPublisherQueue publisherQueue,IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _publisherQueue = publisherQueue;
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
