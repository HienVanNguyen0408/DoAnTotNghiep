using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities;

namespace Web.AppCore.Interfaces.Services.MessageQueue
{
    public interface IConsumerQueue
    {
        Task StartConsumeAsync(Func<Order, IDictionary<string, object>, Task<bool>> onMessageHandle);
    }
}
