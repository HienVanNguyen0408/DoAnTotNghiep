using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Entities;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Interfaces.Services.MessageQueue;

namespace Web.AppCore.Services
{
    public class OrderItemService : BaseDomainService<OrderItemService>, IOrderItemService
    {
        public OrderItemService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
        }
    }
}
