using Microsoft.Extensions.Hosting;
using System.Threading;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.AppCore.Interfaces.Services;

namespace Web.Api
{
    public class UpdateAmountProductWorker : BackgroundService
    {
        #region Declaration
        private readonly IConsumerQueue _consumer;
        private readonly IProductService _productService;
        #endregion
        #region Contructor
        public UpdateAmountProductWorker(IConsumerQueue consumer, IProductService productService)
        {
            _consumer = consumer;
            _productService = productService;
        }
        #endregion
        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            await _consumer.StartConsumeAsync(_productService.UpdateQuantityProduct);
        }
    }
}
