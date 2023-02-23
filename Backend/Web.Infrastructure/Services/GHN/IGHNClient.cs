using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities.GHN;

namespace Web.Infrastructure.Services.GHN
{
    public interface IGHNClient
    {
        /// <summary>
        /// Tính giá cước
        /// </summary>
        /// <returns></returns>
        Task ShippingFeeOrder();

        /// <summary>
        /// Thông tin đơn hàng
        /// </summary>
        /// <returns></returns>
        Task<OrderInfo> GetOrderInfo(string orderCode);


        /// <summary>
        /// Tạo đơn hàng
        /// </summary>
        /// <param name="request">Request tạo đơn hàng</param>
        /// <returns></returns>
        Task<OrderRespone> CreateOrderAsync(OrderRequest request);

        /// <summary>
        /// Cập nhật thông tin đơn hàng
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        Task<OrderRespone> UpdateOrderAsync(OrderRequest request);

        /// <summary>
        /// Hủy đơn hàng
        /// </summary>
        /// <param name="orderCodes">Danh sách mã đơn hàng cần hủy</param>
        /// <returns></returns>
        Task<bool> CancelOrderAsync(List<string> orderCodes);
        
        /// <summary>
        /// Giao hàng lại
        /// </summary>
        /// <param name="orderCodes">Danh sách mã đơn hàng cần giao hàng lại</param>
        /// <returns></returns>
        Task<bool> DeliveryAgainOrderAsync(List<string> orderCodes);
        

        /// <summary>
        /// Cập nhật COD cho đơn hàng
        /// </summary>
        /// <param name="orderCode">Mã đơn hàng</param>
        /// <param name="codAmount">Số tiền COD</param>
        /// <returns></returns>
        Task<bool> UpdateCODOrderAsync(string orderCode, int codAmount);


        /// <summary>
        /// Thời gian dự tính vận chuyển đơn hàng
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        Task<LeadTimeRespone> GetLeadTimeInfoAsync(LeadTimeRequest request);


        /// <summary>
        /// Xem trước thông tin của đơn hàng cần phải thanh toán
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        Task<OrderRespone> PreviewOrderAsync(OrderRequest request);

        Task<FeeInfo> GetFeeInfoAsync(FeeInfoRequest request);

        /// <summary>
        /// Thời gian dự tính giao hàng
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        Task<LeadTimeInfo> GetLeadTimeOrderAsync(LeadTimeOrderRequest request);


        #region Get Info Address

        /// <summary>
        /// Lấy thông tin các Tỉnh/TP
        /// </summary>
        /// <returns></returns>
        Task<List<Province>> GetProvinces();
        /// <summary>
        /// Lấy thông tin các Quận/Huyện trên cả nước
        /// </summary>
        /// <returns></returns>
        Task<List<District>> GetDistricts();

        /// <summary>
        /// Lấy thông tin các Quận/Huyện theo Tỉnh/TP
        /// </summary>
        /// <param name="provinceId">id của Tỉnh/TP</param>
        /// <returns></returns>
        Task<List<District>> GetDistricts(int provinceId);

        /// <summary>
        /// Lấy thông tin các Phường/Xã theo Quận/Huyện
        /// </summary>
        /// <param name="districtId">Id của Quận/Huyện</param>
        /// <returns></returns>
        Task<List<Ward>> GetWards(int districtId);
        #endregion

    }
}
