using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Services;
using Web.Models.Entities.GHN;
using Web.Utils;
using System.Net.Http;
using Microsoft.Extensions.Options;

namespace Web.Infrastructure.Services.GHN
{
    public class GHNClient : IGHNClient
    {
        #region Declaration
        protected Dictionary<string, string> _header = null;
        protected GHNSettings _ghnSettings = null;
        protected StoreInfo storeInfo = null;
        #endregion

        #region Contructor
        public GHNClient(IOptions<GHNSettings> options)
        {
            _ghnSettings = options.Value;
            _header = new Dictionary<string, string>
            {
                {"Token",_ghnSettings.Token },
            };
            storeInfo = new StoreInfo();
        }
        #endregion

        #region Methods

        /// <summary>
        /// Tạo đơn hàng
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<OrderRespone> CreateOrderAsync(OrderRequest request)
        {
            if (_header == null) _header = new Dictionary<string, string>();
            _header.Add("ShopId", $"{_ghnSettings.ShopId}");
            var jsonBody = request;
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiCreateOrder}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty())
            {
                return null;
            }
            var result = resultSvc.ContentResult.Deserialize<GHNResult<OrderRespone>>();
            return result?.data;
        }

        /// <summary>
        /// Xem trước thông tin đơn hàng cần phải thanh toán (không cần tạo đơn hàng)
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<OrderRespone> PreviewOrderAsync(OrderRequest request)
        {
            if (_header == null) _header = new Dictionary<string, string>();
            _header.Add("ShopId", $"{_ghnSettings.ShopId}");
            var jsonBody = request;
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiPreviewOrder}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty())
            {
                return null;
            }
            var result = resultSvc.ContentResult.Deserialize<GHNResult<OrderRespone>>();
            return result?.data;
        }

        /// <summary>
        /// Cập nhật thông tin đơn hàng
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<OrderRespone> UpdateOrderAsync(OrderRequest request)
        {
            if (_header == null) _header = new Dictionary<string, string>();
            _header.Add("ShopId", $"{_ghnSettings.ShopId}");
            var jsonBody = request;
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiUpdateOrder}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty())
            {
                return null;
            }
            var result = resultSvc.ContentResult.Deserialize<GHNResult<OrderRespone>>();
            return result?.data;
        }

        /// <summary>
        /// Thông tin đơn hàng
        /// </summary>
        /// <param name="orderCode">Mã đơn hàng</param>
        /// <returns></returns>
        public async Task<OrderInfo> GetOrderInfo(string orderCode)
        {
            if (_header == null) _header = new Dictionary<string, string>();
            var jsonBody = new
            {
                order_code = orderCode
            };
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiOrderInfo}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty())
            {
                return null;
            }
            var result = resultSvc.ContentResult.Deserialize<GHNResult<OrderInfo>>();
            return result?.data;
        }

        /// <summary>
        /// Hủy đơn hàng
        /// </summary>
        /// <param name="orderCodes">Các mã cần hủy</param>
        /// <returns></returns>
        public async Task<bool> CancelOrderAsync(List<string> orderCodes)
        {
            if (_header == null) _header = new Dictionary<string, string>();
            _header.Add("ShopId", $"{_ghnSettings.ShopId}");
            var jsonBody = new
            {
                order_codes = orderCodes
            };
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiCancelOrder}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty()) return false;
            var result = resultSvc.ContentResult.Deserialize<GHNResult<OrderCancelRespone>>();
            if (result?.data != null) return result.data.IsSuccess;
            return false;
        }

        /// <summary>
        /// Giao hàng lại
        /// </summary>
        /// <param name="orderCodes"></param>
        /// <returns></returns>
        public async Task<bool> DeliveryAgainOrderAsync(List<string> orderCodes)
        {
            if (_header == null) _header = new Dictionary<string, string>();
            _header.Add("ShopId", $"{_ghnSettings.ShopId}");
            var jsonBody = new
            {
                order_codes = orderCodes
            };
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiDeliveryAgain}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty()) return false;
            var result = resultSvc.ContentResult.Deserialize<GHNResult<OrderCancelRespone>>();
            if (result?.data != null) return result.data.IsSuccess;
            return false;
        }

        /// <summary>
        /// Cập nhật COD cho đơn hàng
        /// </summary>
        /// <param name="orderCode">Mã đơn hàng</param>
        /// <param name="codAmount">Số tiền COD của đơn hàng</param>
        /// codAmount max : 5.000.000
        /// <returns></returns>
        public async Task<bool> UpdateCODOrderAsync(string orderCode, int codAmount)
        {
            if (_header == null) _header = new Dictionary<string, string>();
            var jsonBody = new
            {
                order_code = orderCode,
                cod_amount = codAmount
            };
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiUpdateCOD}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty()) return false;
            var result = resultSvc.ContentResult.Deserialize<GHNResult<object>>();
            return result.IsSuccessCode;
        }

        /// <summary>
        /// Thông tin thời gian dự kiến giao hàng
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<LeadTimeRespone> GetLeadTimeInfoAsync(LeadTimeRequest request)
        {
            if (_header == null) _header = new Dictionary<string, string>();
            var jsonBody = new
            {
                from_district_id = request.FromDistrictId,
                from_ward_code = request.FromDistrictId,
                to_district_id = request.ToDistrictId,
                to_ward_code = request.ToWardCode,
                service_id = request.ServiceId,
            };
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiLeadTime}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty()) return null;
            var result = resultSvc.ContentResult.Deserialize<GHNResult<LeadTimeRespone>>();
            return result.IsSuccessCode ? result.data : null;
        }


        public Task ShippingFeeOrder()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Tỉnh/ Thành phố
        /// </summary>
        /// <returns></returns>
        public async Task<List<Province>> GetProvinces()
        {
            var resultSvc = await StandardHttpClient.GetAsync($"{_ghnSettings.ApiProvince}", headers: _header);
            if (resultSvc.IsNullOrEmpty())
            {
                return null;
            }

            var provinceResult = resultSvc.ContentResult.Deserialize<GHNResult<List<Province>>>();
            if (provinceResult?.data?.Count > 0)
            {
                return provinceResult.data;
            }
            return null;
        }

        /// <summary>
        /// Quận / Huyện
        /// </summary>
        /// <returns></returns>
        public async Task<List<District>> GetDistricts()
        {
            var resultSvc = await StandardHttpClient.GetAsync($"{_ghnSettings.ApiDistrict}", headers: _header);
            if (resultSvc.IsNullOrEmpty())
            {
                return null;
            }

            var districtResult = resultSvc.ContentResult.Deserialize<GHNResult<List<District>>>();
            if (districtResult?.data?.Count > 0)
            {
                return districtResult.data;
            }
            return null;
        }

        /// <summary>
        /// Quận/Huyện trong thành phố
        /// </summary>
        /// <param name="provinceId">Mã thành phố</param>
        /// <returns></returns>
        public async Task<List<District>> GetDistricts(int provinceId)
        {
            var jsonBody = new
            {
                province_id = provinceId
            };
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiDistrict}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty())
            {
                return null;
            }

            var districtResult = resultSvc.ContentResult.Deserialize<GHNResult<List<District>>>();
            if (districtResult?.data?.Count > 0)
            {
                return districtResult.data;
            }
            return null;
        }


        /// <summary>
        /// Phường/Xã trong Quận/Huyện
        /// </summary>
        /// <param name="districtId">Mã Quận/Huyện</param>
        /// <returns></returns>
        public async Task<List<Ward>> GetWards(int districtId)
        {
            var jsonBody = new
            {
                district_id = districtId
            };
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiWard}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty())
            {
                return null;
            }

            var wardResult = resultSvc.ContentResult.Deserialize<GHNResult<List<Ward>>>();
            if (wardResult?.data?.Count > 0)
            {
                return wardResult.data;
            }
            return null;
        }

        public async Task<bool> PrintOrderAsync()
        {
            return false;
        }

        public async Task<FeeInfo> GetFeeInfoAsync(FeeInfoRequest request)
        {
            var jsonBody = new
            {
                shop_id = storeInfo.shop_id,
                service_type_id = 2,
                from_district_id = storeInfo.district_id,
                to_ward_code = request.to_ward_code,
                to_district_id = request.to_district_id,
                weight = request.weight,
                length = request.length,
                width = request.width,
                height = request.height,
                cod_value = request.cod_value
            };
            var resultSvc = await StandardHttpClient.DoPostOrPutJsonAsync($"{_ghnSettings.ApiFee}", HttpMethod.Post, jsonBody, headers: _header);
            if (resultSvc.IsNullOrEmpty()) return null;

            var feeResult = resultSvc.ContentResult.Deserialize<GHNResult<FeeInfo>>();
            if (feeResult?.data != null)
            {
                return feeResult.data;
            }
            return null;
        }
        #endregion
    }
}
