using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web.AppCore.Entities;
using Web.Infrastructure.Services.GHN;
using Web.Models.Entities.GHN;

namespace Web.Api.Controllers.GHNEnpoint
{
    public class GhnController : BaseAuthController<GhnController>
    {
        #region Declaration
        private const string TAG = "GHNController";
        protected readonly IGHNClient _ghn;

        #endregion

        #region Contructor
        public GhnController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _ghn = GetRequiredService<IGHNClient>();
        }
        #endregion

        /// <summary>
        /// Các Tỉnh/TP
        /// </summary>
        /// <returns></returns>
        [HttpGet("provinces")]
        public async Task<ServiceResult<List<Province>>> GetProvincesAsync()
        {
            var svcResult = new ServiceResult<List<Province>>();
            try
            {
                var provinces = await _ghn.GetProvinces();
                if (provinces != null)
                {
                    svcResult.Data = provinces;
                    svcResult.Success = true;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Exception::{ex.Message}");
            }
            return svcResult;
        }

        /// <summary>
        /// Các Quận Huyện của cả nước
        /// </summary>
        /// <returns></returns>
        [HttpGet("district")]
        public async Task<ServiceResult<List<District>>> GetDistrictsAsync()
        {
            var svcResult = new ServiceResult<List<District>>();
            try
            {
                var districts = await _ghn.GetDistricts();
                if (districts != null)
                {
                    svcResult.Data = districts;
                    svcResult.Success = true;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Exception::{ex.Message}");
            }
            return svcResult;
        }

        /// <summary>
        /// Các Quận/Huyện theo Tỉnh/TP
        /// </summary>
        /// <param name="provinceId">Id Tỉnh/TP</param>
        /// <returns></returns>
        [HttpGet("district/{provinceId}")]
        public async Task<ServiceResult<List<District>>> GetDistrictsAsync(int provinceId)
        {
            var svcResult = new ServiceResult<List<District>>();
            try
            {
                var districts = await _ghn.GetDistricts(provinceId);
                if (districts != null)
                {
                    svcResult.Data = districts;
                    svcResult.Success = true;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Exception::{ex.Message}");
            }
            return svcResult;
        }

        /// <summary>
        /// Các Xã/Phường theo Quận/Huyện
        /// </summary>
        /// <param name="districtId">Id quận huyện</param>
        /// <returns></returns>
        [HttpGet("ward/{districtId}")]
        public async Task<ServiceResult<List<Ward>>> GetWardsAsync(int districtId)
        {
            var svcResult = new ServiceResult<List<Ward>>();
            try
            {
                var districts = await _ghn.GetWards(districtId);
                if (districts != null)
                {
                    svcResult.Data = districts;
                    svcResult.Success = true;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Exception::{ex.Message}");
            }
            return svcResult;
        }

        /// <summary>
        /// Tính phí đơn hàng
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("calculatorfee")]
        public async Task<ServiceResult<FeeInfo>> GetFeeOrderAsync([FromBody] FeeInfoRequest request)
        {
            var svcResult = new ServiceResult<FeeInfo>();
            try
            {
                var feeInfo = await _ghn.GetFeeInfoAsync(request);
                if (feeInfo != null)
                {
                    svcResult.Data = feeInfo;
                    svcResult.Success = true;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Exception::{ex.Message}");
            }
            return svcResult;
        }

        /// <summary>
        /// Thời gian dự kiến đơn hàng
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("calculatorleadtime")]
        public async Task<ServiceResult<LeadTimeInfo>> GetLeadTimeOrderAsync([FromBody] LeadTimeOrderRequest request)
        {
            var svcResult = new ServiceResult<LeadTimeInfo>();
            try
            {
                var feeInfo = await _ghn.GetLeadTimeOrderAsync(request);
                if (feeInfo != null)
                {
                    svcResult.Data = feeInfo;
                    svcResult.Success = true;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"{TAG}::Lỗi GetLeadTimeOrderAsync::Exception::{ex.Message}");
            }
            return svcResult;
        }
    }
}
