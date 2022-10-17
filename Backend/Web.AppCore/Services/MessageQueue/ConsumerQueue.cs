using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.MessageQ.Consumer;

namespace Web.AppCore.Services.MessageQueue
{
    public class ConsumerQueue<T> : IConsumerQueue<T>
    {
        #region Declaration
        private const string _queueNameOrder = "OrderDataQueueName";

        private readonly IConsumer<T> _consumer;
        private readonly QueueNameSettings _queueNameSettings;
        #endregion

        #region Contructor
        public ConsumerQueue(IConsumer<T> consumer, QueueNameSettings queueNameSettings)
        {
            _consumer = consumer;
            _queueNameSettings = queueNameSettings;
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
        #endregion
    }
}
