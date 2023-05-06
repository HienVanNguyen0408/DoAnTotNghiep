using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Threading;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.AppCore.Services.MessageQueue;
using Web.Utils.BackgroundServices;

namespace Web.Api
{
    public class InsertOrderWorker : BackgroundService
    {
        #region Declaration
        private readonly IConsumerQueue _consumer;
        private readonly IOrderService _orderService;
        #endregion
        #region Contructor
        public InsertOrderWorker(IConsumerQueue consumer, IOrderService orderService)
        {
            _consumer = consumer;
            _orderService = orderService;
        }
        #endregion
        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            await _consumer.StartConsumeAsync(_orderService.InsertOrderOnQueueAsync);
        }
    }
}
