using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EasyNetQ;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Web.Utils;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace Web.MessageQ.Consumer
{
    public class Consumer<T> : IConsumer<T>
    {
        #region Declaration
        ConnectionFactory _advancedBus;
        private readonly QueueSettings _queueSettings;
        IConnection _connection;
        IModel _channel;
        IBasicProperties _properties;
        private EventingBasicConsumer _consumer;
        Func<T, IDictionary<string, object>, Task<bool>> _onMessageHandleAsync;
        #endregion

        #region Contructor
        public Consumer(IOptions<QueueSettings> options)
        {
            _queueSettings = options.Value;
        }

        public Consumer(QueueSettings queueSettings)
        {
            _queueSettings = queueSettings;
            InitQueue(queueSettings);
        }

        private void InitQueue(QueueSettings queueSettings)
        {
            _advancedBus = new ConnectionFactory()
            {
                HostName = queueSettings.Host,
                RequestedHeartbeat = TimeSpan.FromSeconds(queueSettings.RequestedHeartbeat),
                ContinuationTimeout = TimeSpan.FromSeconds(queueSettings.Timeout),
                Port = queueSettings.Port,
                UserName = queueSettings.UserName,
                Password = queueSettings.Password
            };
            var con = _advancedBus.CreateConnection();
            _connection = _advancedBus.CreateConnection();
            _channel = _connection.CreateModel();
            _properties = _channel.CreateBasicProperties();
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
            _channel.QueueDeclare(queueName, false, false, false, null);
            _consumer = new EventingBasicConsumer(_channel);
            _consumer.Received += async (model, result) =>
            {
                var body = result.Body.ToArray();
                var message = Encoding.UTF8.GetString(body);
                T queueObject = JsonUtils.Deserialize<T>(message);
                var headers = result.BasicProperties.Headers;
                if (!result.Redelivered)
                {
                    bool consumeResult = false;
                    try
                    {
                        consumeResult = await onMessageHandle(queueObject, headers);
                    }
                    catch (Exception ex)
                    {
                        consumeResult = false;
                    }
                    Console.WriteLine($" [x] Received {message}");
                }
            };
            _channel.BasicConsume(queueName, false, _consumer);
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
