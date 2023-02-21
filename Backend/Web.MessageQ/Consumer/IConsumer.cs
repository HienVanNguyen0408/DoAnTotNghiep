using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.MessageQ.Consumer
{
    public interface IConsumer<T>
    {
        Task StartConsumeAsync(string queueName, Func<T, IDictionary<string, object>?, Task<bool>> onMessageHandle);
    }
}
