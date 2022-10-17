using EasyNetQ;
using EasyNetQ.Topology;
using Microsoft.Extensions.Options;
using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Utils;

namespace Web.MessageQ.Publisher
{
    public class Publisher : IPublisher
    {
        #region Declaration
        ConnectionFactory _advancedBus;
        IConnection _connection;
        IModel _chanel;
        IBasicProperties _properties;
        #endregion

        #region Contructor
        public Publisher(IOptions<QueueSettings> options)
        {
            InitQueue(options.Value);
        }
        public Publisher(QueueSettings queueSettings)
        {
            InitQueue(queueSettings);
        }
        #endregion

        #region Properties

        #endregion
        #region Methods
        private void InitQueue(QueueSettings queueSettings)
        {
            _advancedBus = new ConnectionFactory()
            {
                HostName = "localhost"
            };
            var con = _advancedBus.CreateConnection();
            _connection = _advancedBus.CreateConnection();
            _chanel = _connection.CreateModel();
            _properties = _chanel.CreateBasicProperties();
        }

        public bool Publish(string queueName, object data, IDictionary<string, object> headers = null)
        {
            PublishAsync(queueName, data, headers);
            return true;
        }

        public void PublishAsync(string queueName, object data, IDictionary<string, object> headers = null)
        {
            if (string.IsNullOrEmpty(queueName)) throw new ArgumentNullException(nameof(queueName));
            if (data == null) throw new ArgumentNullException(nameof(data));
            //Main entry point to the RabbitMQ .NET AMQP client
            _properties.Persistent = false;
            _properties.DeliveryMode = 2;
            if (headers != null && headers.Count > 0) _properties.Headers = headers;

            string message = JsonUtils.Serialize(data);
            var queueMessage = Encoding.UTF8.GetBytes(message);
            var exchangeName = "order_exchange";
            // Create Exchange
            //_chanel.ExchangeDeclare(exchangeName, RabbitMQ.Client.ExchangeType.Direct);
            _chanel.QueueDeclare(queue: "nvhien123", false, false, false, null);
            //_chanel.QueueBind(queueName, exchangeName, queueName);
            _chanel.BasicPublish(exchange: "", routingKey: "nvhien123", basicProperties: _properties, body: queueMessage);
            Console.WriteLine("Message Sent");
        }

        #endregion
    }
}
