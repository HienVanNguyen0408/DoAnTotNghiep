using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;
using Web.AppCore.Entities;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.Models.Entities;
using Web.Models.Enums;
using Web.Models.Enums.Order;
using Web.Models.Request;
using Web.Models.Respone;

namespace Web.Api.Controllers
{
    [Authorize]
    public class OrderController : BaseAuthController<OrderController>
    {
        private const string TAG = "OrderController";
        private readonly IOrderService _orderService;
        private readonly IPublisherQueue _publisher;
        public OrderController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _orderService = serviceProvider.GetRequiredService<IOrderService>();
            _publisher = serviceProvider.GetRequiredService<IPublisherQueue>();
        }

        #region Methods
        #region Product

        /// <summary>
        /// Thêm đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        [HttpPost("insert")]
        public async Task<ServiceResult<bool>> InsertOrderAsync([FromBody] OrderRequest order)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                //Validate số lượng sản phẩm
                var checkAmountProduct = await _orderService.ValidateProductOrderAsync(order.order_items);
                if (checkAmountProduct)
                {
                    return new ServiceResult<bool>
                    {
                        Data = false,
                        Success = false,
                        Status = ServiceResultStatus.Ok,
                        Message = "Có sản phẩm không đủ số lượng.Vui lòng về giỏ hàng kiểm tra"
                    };
                }
                var res = await _publisher.PublishInsertOrderAsync(order, null);
                svcResult = new ServiceResult<bool>
                {
                    Data = res,
                    Success = res,
                    Status = ServiceResultStatus.Ok,
                    Message = "Đặt hàng thành công"
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertOrderAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        /// <summary>
        /// Cập nhật đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        [HttpPost("update")]
        public async Task<ServiceResult<bool>> UpdateOrderAsync([FromBody] Order order)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var res = await _orderService.UpdateOrderAsync(order);
                svcResult = new ServiceResult<bool>
                {
                    Data = res,
                    Success = res,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateOrderAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        /// <summary>
        /// Xóa đơn hàng
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        [HttpGet("delete/{orderId}")]
        public async Task<ServiceResult<bool>> DeleteOrderAsync(string orderId)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var deleteRes = await _orderService.DeleteOrderAsync(orderId);
                svcResult = new ServiceResult<bool>
                {
                    Data = deleteRes,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };

                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteOrderAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Xóa nhiều đơn hàng
        /// </summary>
        /// <param name="products"></param>
        /// <returns></returns>
        [HttpPost("delete-many")]
        public async Task<ServiceResult<Boolean>> DeleteOrdersAsync([FromBody] OrderRequest request)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var deleteRes = await _orderService.DeleteOrdersAsync(request.order_ids);
                svcResult = new ServiceResult<Boolean>
                {
                    Data = deleteRes,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };

                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteOrdersAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }
        /// <summary>
        /// Lấy danh sách sản phẩm phân trang
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        [HttpPost("pagging")]
        public async Task<ServiceResult<Pagging<Order>>> GetPageOrderAsync([FromBody] Pagination pagination)
        {
            var svcResult = new ServiceResult<Pagging<Order>>();
            try
            {
                var orderPage = await _orderService.GetOrderPageAsync(pagination);
                svcResult = new ServiceResult<Pagging<Order>>
                {
                    Data = orderPage,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetPageOrderAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Lấy thông tin đơn hàng
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        [HttpGet("{orderId}")]
        public async Task<ServiceResult<Order>> GetOrderAsync(string orderId)
        {
            var svcResult = new ServiceResult<Order>();
            try
            {
                var order = await _orderService.GetOrderAsync(orderId);
                svcResult = new ServiceResult<Order>
                {
                    Data = order,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetOrderAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        [AllowAnonymous]
        [HttpPost("testorrder")]
        public async Task<ServiceResult<bool>> TestOrderAsync([FromBody] Order order)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var res = await _publisher.PublishUpdateOrderAsync(order, null);
                svcResult = new ServiceResult<bool>
                {
                    Data = res,
                    Success = res,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm TestOrderAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        [HttpPost("orderuser/{userId}/{orderStatus}")]
        public async Task<ServiceResult<Pagging<Order>>> GetPageOrderByUserAsync([FromBody] Pagination pagination, string userId, OrderStatus orderStatus)
        {
            var svcResult = new ServiceResult<Pagging<Order>>();
            try
            {
                if (orderStatus == OrderStatus.All)
                {
                    svcResult.Data = await _orderService.GetOrderPageAsync(pagination, x => x.user_id == userId);
                }
                else
                {
                    svcResult.Data = await _orderService.GetOrderPageAsync(pagination, x => x.user_id == userId && x.order_status == orderStatus);
                }

                svcResult = new ServiceResult<Pagging<Order>>
                {
                    Data = svcResult.Data,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetPageOrderByUserAsync::Exception::{ex.Message}");
            }
            return svcResult;
        }

        [HttpGet("salesstatistics")]
        public async Task<ServiceResult<SaleStatistic>> GetSaleSTatisticAsync([FromQuery] PeriodType periodType)
        {
            var svcResult = new ServiceResult<SaleStatistic>();
            try
            {
                var saleStatistic = await _orderService.GetSaleStatisticAsync(periodType);
                svcResult = new ServiceResult<SaleStatistic>
                {
                    Data = saleStatistic,
                    Success = true
                };
            }
            catch (Exception ex)
            {
                svcResult = new ServiceResult<SaleStatistic>
                {
                    Data = new SaleStatistic(),
                    Success = false
                };
                _logger.LogError($"{TAG}::Lỗi hàm GetSaleSTatisticAsync::Exception::{ex.Message}");
            }
            return svcResult;
        }


        #endregion
        #endregion
    }
}
