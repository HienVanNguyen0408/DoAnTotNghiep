using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.MessageQ.Consumer;
using Web.Models.Entities;

namespace Web.AppCore.Services.MessageQueue
{
    public class ConsumerQueue : IConsumerQueue
    {
        #region Declaration
        private const string _queueNameOrder = "OrderDataQueueName";

        private MessageQ.QueueSettings _queueSettings;
        private IConsumer<Order> _orderConsumer;
        private QueueNameSettings _queueName;
        #endregion


        #region Properties
        private IConsumer<Order> OrderConsumer => _orderConsumer ??= new Consumer<Order>(_queueSettings);
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

        private async Task<bool> CheckDataQueue()
        {
            await Task.CompletedTask;
            return true;
        }

        public async Task StartConsumeAsync(Func<Order, IDictionary<string, object>, Task<bool>> onMessageHandle)
        {
            await OrderConsumer.StartConsumeAsync(_queueName.QueueNameOrder, onMessageHandle);
        }
        #endregion
    }
}
