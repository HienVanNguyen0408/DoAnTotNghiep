using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.MessageQ.Publisher
{
    public interface IPublisher
    {
        bool Publish(string queueName, object data, IDictionary<string, object> headers = null);
        void PublishAsync(string queueName, object data, IDictionary<string, object> headers = null);
    }
}
