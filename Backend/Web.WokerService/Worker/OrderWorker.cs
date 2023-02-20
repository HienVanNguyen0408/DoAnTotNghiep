using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Threading;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.Utils.BackgroundServices;

namespace Web.WokerService
{
    public class OrderWorker : BackgroundService
    {
        #region Declaration
        private readonly IConsumerQueue _consumer;
        //private readonly IOrderService _orderService;
        #endregion
        #region Contructor
        public OrderWorker(IConsumerQueue consumer)
        {
            _consumer = consumer;
            //_orderService = orderService;
        }
        #endregion
        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                Console.WriteLine("Tao đang chạy");
                ////Đợi 100 s
                //// Đợi thời gian chạy
                //TimeSpan timeWaitting = BackgroundServiceUtility.GetWaiting(100);
                ////delay
                //await Task.Delay(timeWaitting, stoppingToken);

                ////Call đến service cần chạy
                //await _orderService.UpdateOrderAsync();
            }
        }
    }
}
