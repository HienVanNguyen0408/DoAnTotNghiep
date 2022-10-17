using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EasyNetQ;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Web.Utils;

namespace Web.MessageQ.Consumer
{
    public class Consumer<T> : IConsumer<T>
    {
        #region Declaration
        private readonly IAdvancedBus _advancedBus;
        private readonly QueueSettings _queueSettings;

        Func<T, IDictionary<string, object>, Task<bool>> _onMessageHandleAsync;
        #endregion

        #region Contructor
        public Consumer(IOptions<QueueSettings> options)
        {
            _queueSettings = options.Value;
            _advancedBus = RabbitHutch.CreateBus(_queueSettings.ConnectionString).Advanced;
        }

        public Consumer(QueueSettings queueSettings)
        {
            _queueSettings = queueSettings;
            _advancedBus = RabbitHutch.CreateBus(_queueSettings.ConnectionString).Advanced;
        }

        #endregion

        #region Properties

        #endregion
        #region Methods

        public Task StartConsumeAsync(string queueName, Func<T, IDictionary<string, object>, Task<bool>> onMessageHandle)
        {
            return Task.Run(() => StartConsume(queueName, onMessageHandle));
        }

        private void StartConsume(string queueName, Func<T, IDictionary<string, object>, Task<bool>> onMessageHandle)
        {
            _onMessageHandleAsync = onMessageHandle;
            var consumeQueue = _advancedBus.QueueDeclare(queueName);
            _advancedBus.Consume(consumeQueue, MessageHandleAsync, config =>
            {
                config.WithPrefetchCount(_queueSettings.WithPrefecthCount);
            });
        }
        private async Task<bool> MessageHandleAsync(byte[] body, MessageProperties properties, MessageReceivedInfo messInfo)
        {
            string message = body != null && body.Length > 0 ? Encoding.UTF8.GetString(body) : null;
            T queueObject = JsonUtils.Deserialize<T>(message);

            var headers = properties.Headers;
            bool consumeResult = false;
            try
            {
                consumeResult = await _onMessageHandleAsync(queueObject, headers);
            }
            catch (Exception ex)
            {
                consumeResult = false;
            }

            return consumeResult;
        }
        #endregion
    }
}
