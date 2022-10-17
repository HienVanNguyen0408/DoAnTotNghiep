using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Interfaces.Services.MessageQueue
{
    public interface IPublisherQueue
    {
        Task<bool> PublishUpdateOrderAsync(object data, IDictionary<string, object> headers = null);
    }
}
