using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;

namespace Web.Api.Controllers
{
    public class OrderController : BaseAuthController<OrderController>
    {
        private const string TAG = "OrderController";
        private readonly IOrderService _orderService;
        private readonly IOrderItemService _orderItemService;
        public OrderController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _orderService = serviceProvider.GetRequiredService<IOrderService>();
            _orderItemService = serviceProvider.GetRequiredService<IOrderItemService>();
        }

        [HttpGet]
        public async Task<bool> UpdateOrderAsync()
        {
            var res = await _orderService.UpdateOrderAsync();
            return res;
        }

        /// <summary>
        /// Thêm đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        [HttpGet("insert")]
        public async Task<bool> InsertOrderAsync([FromBody] Order order)
        {
            try
            {
                var res = await _orderService.InsertOrderAsync(order);
                return res;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertOrderAsync::Exception::{ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Xóa đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        [HttpGet("delete")]
        public async Task<bool> DeleteOrderAsync([FromBody] Order order)
        {
            try
            {
                var res = await _orderService.DeleteOrderAsync(order.id);
                return res;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertOrderAsync::Exception::{ex.Message}");
                return false;
            }
        }
        

        /// <summary>
        /// Cập nhật đơn hàng
        /// </summary>
        /// <returns></returns>
        [HttpGet("update")]
        public async Task<bool> UpdateOrderAsync([FromBody] Order order)
        {
            try
            {
                var res = await _orderService.UpdateOrderAsync(order);
                return res;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertOrderAsync::Exception::{ex.Message}");
                return false;
            }
        }
    }
}
