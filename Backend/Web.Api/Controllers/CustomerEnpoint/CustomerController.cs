using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;
using Web.Caching;
using Web.Models.Entities;

namespace Web.Api.Controllers.CustomerEnpoint
{
    public class CustomerController : BaseAuthController<CustomerController>
    {

        #region Declaration
        private const string TAG = "CustomerController";
        protected readonly ICustomerService _customerService;
        protected readonly IRedisCached _redisCached;
        #endregion
        #region Contructor
        public CustomerController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _customerService = GetRequiredService<ICustomerService>();
            _redisCached = GetRequiredService<IRedisCached>();
        }
        #endregion
        #region Properties

        #endregion
        #region Methods
        /// <summary>
        /// Lấy danh sách người dùng
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<List<Customer>> GetCustomersAsync()
        {
            try
            {
                // Danh sách khách hàng
                var customers = await _customerService.GetCustomersAsync();
                return customers;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetCustomersAsync::Exception::{ex.Message}");
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpPost("pagging")]
        public async Task<Pagging<Customer>> GetPaggingCustomersAsync([FromBody] Pagination pagination)
        {
            try
            {
                // Danh sách khách hàng theo phân trang
                var customers = await _customerService.GetPaggingCustomer(pagination.PageIndex,pagination.PageSize);
                return customers;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetPaggingCustomersAsync::Exception::{ex.Message}");
                return null;
            }
        }

        /// <summary>
        /// Thêm thông tin khách hàng
        /// </summary>
        /// <returns></returns>
        [HttpPost("insert")]
        public async Task<bool> InsertCustomerAsync([FromBody] Customer customer)
        {
            try
            {
                //Thêm khách hàng
                await _customerService.InsertCustomerAsync(customer);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertCustomerAsync::Exception::{ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Xóa thông tin khách hàng
        /// </summary>
        /// <returns></returns>
        [HttpPost("delete/{customerId}")]
        public async Task<bool> DeleteCustomerAsync(string customerId)
        {
            try
            {
                //Thêm khách hàng
                await _customerService.DeleteCustomerAsync(customerId);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteCustomerAsync::Exception::{ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Sửa thông tin khách hàng
        /// </summary>
        /// <returns></returns>
        [HttpPost("update/{customerId}")]
        public async Task<bool> UpdateCustomerAsync(string customerId, [FromBody] Customer customer)
        {
            try
            {
                //Sửa 
                var updateRes = await _customerService.UpdateCustomerAsync(customerId, customer);
                return updateRes;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateCustomerAsync::Exception::{ex.Message}");
                return false;
            }
        }
        #endregion
    }
}
