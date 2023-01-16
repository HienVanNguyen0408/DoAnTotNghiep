using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Models.Entities.GHN
{
    public class GHNSettings
    {
        public const string CONFIG_NAME = "GHNSettings";
        public int ShopId { get; set; }
        /// <summary>
        /// Token người dùng
        /// </summary>
        public string Token { get; set; } = "de651497-3234-11ed-b608-8a2909007fb0";

        public string APIEnpoint { get; set; } = "https://dev-online-gateway.ghn.vn";
        /// <summary>
        /// Đầu API lấy thông tin các tỉnh thành phố
        /// </summary>
        public string UrlProvince { get; set; } = "shiip/public-api/master-data/province";

        public string ApiProvince => $"{APIEnpoint}/{UrlProvince}";
        /// <summary>
        /// Đầu API lấy thông tin các quận huyện
        /// </summary>
        public string UrlDistrict { get; set; } = "shiip/public-api/master-data/district";
        public string ApiDistrict => $"{APIEnpoint}/{UrlDistrict}";

        /// <summary>
        /// Đầu API lấy thông tin các Xã phường
        /// </summary>
        public string UrlWard { get; set; } = "shiip/public-api/master-data/ward?district_id";
        public string ApiWard =>  $"{APIEnpoint}/{UrlWard}";

        /// <summary>
        /// Đầu API tính cước phí vận chuyển
        /// </summary>
        public string UrlFee { get; set; } = "shiip/public-api/v2/shipping-order/fee";
        public string ApiFee => $"{APIEnpoint}/{UrlFee}";

        /// <summary>
        /// UPdate đơn hàng
        /// </summary>
        public string UrlUpdateOrder { get; set; } = "shiip/public-api/v2/shipping-order/update";
        public string ApiUpdateOrder => $"{APIEnpoint}/{UrlUpdateOrder}";

        /// <summary>
        /// Cập nhật đơn hàng
        /// </summary>
        public string UrlCancelOrder { get; set; } = "shiip/public-api/v2/switch-status/cancel";
        public string ApiCancelOrder => $"{APIEnpoint}/{UrlCancelOrder}";

        /// <summary>
        /// Trả đơn hàng
        /// </summary>
        public string UrlReturnOrder { get; set; } = "shiip/public-api/v2/switch-status/return";
        public string ApiReturnOrder => $"{APIEnpoint}/{UrlReturnOrder}";

        /// <summary>
        /// Tạo đơn hàng
        /// </summary>
        public string UrlCreateOrder { get; set; } = "shiip/public-api/v2/shipping-order/create";
        public string ApiCreateOrder => $"{APIEnpoint}/{UrlCreateOrder}";

        /// <summary>
        /// Thông tin đơn hàng
        /// </summary>
        public string UrlOrderInfo { get; set; } = "shiip/public-api/v2/shipping-order/detail";
        public string ApiOrderInfo => $"{APIEnpoint}/{UrlOrderInfo}";

        /// <summary>
        /// Cập nhật COD cho đơn hàng
        /// </summary>
        public string UrlUpdateCOD { get; set; } = "shiip/public-api/v2/shipping-order/updateCOD";
        public string ApiUpdateCOD => $"{APIEnpoint}/{UrlUpdateCOD}";

        /// <summary>
        /// Tính toán thời gian dự kiến
        /// </summary>
        public string UrlLeadTime { get; set; } = "shiip/public-api/v2/shipping-order/leadtime";
        public string ApiLeadTime => $"{APIEnpoint}/{UrlLeadTime}";

        /// <summary>
        /// Xem trước dự tính của đơn hàng
        /// </summary>
        public string UrlPreviewOrder { get; set; } = "shiip/public-api/v2/shipping-order/preview";
        public string ApiPreviewOrder => $"{APIEnpoint}/{UrlPreviewOrder}";


        /// <summary>
        /// Vận chuyển hàng lại
        /// </summary>
        public string UrlDeliveryAgain { get; set; } = "shiip/public-api/v2/switch-status/storing";
        public string ApiDeliveryAgain => $"{APIEnpoint}/{UrlDeliveryAgain}";

        /// <summary>
        /// In đơn hàng
        /// </summary>
        public string UrlPrintOrder { get; set; } = "shiip/public-api/v2/a5/gen-token";
        public string ApiPrintOrder => $"{APIEnpoint}/{UrlPrintOrder}";

    }
}
