using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;

namespace Web.Api.Controllers
{
    public class OrderController : BaseAuthController<OrderController>
    {
        private readonly IOrderService _orderService;
        public OrderController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _orderService = serviceProvider.GetRequiredService<IOrderService>();
        }

        [HttpGet]
        public async Task<bool> UpdateOrderAsync()
        {
            var res = await _orderService.UpdateOrderAsync();
            return res;
        }
    }
}
