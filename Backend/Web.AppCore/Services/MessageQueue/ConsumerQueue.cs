using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.MessageQ.Consumer;
using Web.Models.Entities;
using Web.Models.Request;

namespace Web.AppCore.Services.MessageQueue
{
    public class ConsumerQueue : IConsumerQueue
    {
        #region Declaration

        private MessageQ.QueueSettings _queueSettings;
        private IConsumer<Order> _orderConsumer;
        private IConsumer<OrderRequest> _orderConsumerR;
        private IConsumer<List<Product>> _productsQuantityConsumer;
        private QueueNameSettings _queueName;
        #endregion


        #region Properties
        private IConsumer<Order> OrderConsumer => _orderConsumer ??= new Consumer<Order>(_queueSettings);
        private IConsumer<OrderRequest> OrderInsertConsumer => _orderConsumerR ??= new Consumer<OrderRequest>(_queueSettings);
        private IConsumer<List<Product>> ProductsUpdateQuantityConsumer => _productsQuantityConsumer ??= new Consumer<List<Product>>(_queueSettings);
        #endregion

        #region Contructor
        public ConsumerQueue(IOptions<MessageQ.QueueSettings> optionsSettings, IOptions<QueueNameSettings> optionsName)
        {
            _queueSettings = optionsSettings.Value;
            _queueName = optionsName.Value;
        }
        #endregion

        #region Properties

        #endregion
        #region Methods
        public async Task<bool> PublishUpdateOrderAsync(object data, IDictionary<string, object> headers = null)
        {
            await Task.CompletedTask;
            return false;
        }

        public async Task StartConsumeAsync(Func<Order, IDictionary<string, object>, Task<bool>> onMessageHandle)
        {
            await OrderConsumer.StartConsumeAsync(_queueName.QueueNameOrder, onMessageHandle);
        }

        public async Task StartConsumeAsync(Func<OrderRequest, IDictionary<string, object>, Task<bool>> onMessageHandle)
        {
            await OrderInsertConsumer.StartConsumeAsync(_queueName.QueueNameInsertOrder, onMessageHandle);
        }

        public async Task StartConsumeAsync(Func<List<Product>, IDictionary<string, object>, Task<bool>> onMessageHandle)
        {
            await ProductsUpdateQuantityConsumer.StartConsumeAsync(_queueName.QueueNameUpdateQuantityProduct, onMessageHandle);
        }
        #endregion
    }
}
