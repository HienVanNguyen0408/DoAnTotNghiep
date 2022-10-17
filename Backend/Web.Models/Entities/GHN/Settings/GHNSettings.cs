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
        public string Token { get; set; } = "8c426b82-d5fb-11ec-987f-ea8994b0d064";

        public string APIEnpoint { get; set; } = "https://online-gateway.ghn.vn";
        /// <summary>
        /// Đầu API lấy thông tin các tỉnh thành phố
        /// </summary>
        public string UrlProvince { get; set; } = "shiip/public-api/master-data/province";

        public string ApiProvince
        {
            get
            {
                return $"{APIEnpoint}/{UrlProvince}";

            }
        }
        /// <summary>
        /// Đầu API lấy thông tin các quận huyện
        /// </summary>
        public string UrlDistrict { get; set; } = "shiip/public-api/master-data/district";
        public string ApiDistrict
        {
            get
            {
                return $"{APIEnpoint}/{UrlDistrict}";

            }
        }

        /// <summary>
        /// Đầu API lấy thông tin các Xã phường
        /// </summary>
        public string UrlWard { get; set; } = "shiip/public-api/master-data/ward?district_id";
        public string ApiWard
        {
            get
            {
                return $"{APIEnpoint}/{UrlWard}";

            }
        }

        /// <summary>
        /// Đầu API tính cước phí vận chuyển
        /// </summary>
        public string UrlFee { get; set; } = "shiip/public-api/v2/shipping-order/fee";
        public string ApiFee
        {
            get
            {
                return $"{APIEnpoint}/{UrlFee}";

            }
        }

        /// <summary>
        /// UPdate đơn hàng
        /// </summary>
        public string UrlUpdateOrder { get; set; } = "shiip/public-api/v2/shipping-order/update";
        public string ApiUpdateOrder
        {
            get
            {
                return $"{APIEnpoint}/{UrlUpdateOrder}";

            }
        }

        /// <summary>
        /// Cập nhật đơn hàng
        /// </summary>
        public string UrlCancelOrder { get; set; } = "shiip/public-api/v2/switch-status/cancel";
        public string ApiCancelOrder
        {
            get
            {
                return $"{APIEnpoint}/{UrlCancelOrder}";

            }
        }

        /// <summary>
        /// Trả đơn hàng
        /// </summary>
        public string UrlReturnOrder { get; set; } = "shiip/public-api/v2/switch-status/return";
        public string ApiReturnOrder
        {
            get
            {
                return $"{APIEnpoint}/{UrlReturnOrder}";

            }
        }

        /// <summary>
        /// Tạo đơn hàng
        /// </summary>
        public string UrlCreateOrder { get; set; } = "shiip/public-api/v2/shipping-order/create";
        public string ApiCreateOrder
        {
            get
            {
                return $"{APIEnpoint}/{UrlCreateOrder}";

            }
        }

        /// <summary>
        /// Thông tin đơn hàng
        /// </summary>
        public string UrlOrderInfo { get; set; } = "shiip/public-api/v2/shipping-order/detail";
        public string ApiOrderInfo
        {
            get
            {
                return $"{APIEnpoint}/{UrlOrderInfo}";

            }
        }

        /// <summary>
        /// Cập nhật COD cho đơn hàng
        /// </summary>
        public string UrlUpdateCOD { get; set; } = "shiip/public-api/v2/shipping-order/updateCOD";
        public string ApiUpdateCOD
        {
            get
            {
                return $"{APIEnpoint}/{UrlUpdateCOD}";

            }
        }

        /// <summary>
        /// Tính toán thời gian dự kiến
        /// </summary>
        public string UrlLeadTime { get; set; } = "shiip/public-api/v2/shipping-order/leadtime";
        public string ApiLeadTime
        {
            get
            {
                return $"{APIEnpoint}/{UrlLeadTime}";

            }
        }

        /// <summary>
        /// Xem trước dự tính của đơn hàng
        /// </summary>
        public string UrlPreviewOrder { get; set; } = "shiip/public-api/v2/shipping-order/preview";
        public string ApiPreviewOrder
        {
            get
            {
                return $"{APIEnpoint}/{UrlPreviewOrder}";

            }
        }

        /// <summary>
        /// Vận chuyển hàng lại
        /// </summary>
        public string UrlDeliveryAgain { get; set; } = "shiip/public-api/v2/switch-status/storing";
        public string ApiDeliveryAgain
        {
            get
            {
                return $"{APIEnpoint}/{UrlDeliveryAgain}";

            }
        }

        /// <summary>
        /// In đơn hàng
        /// </summary>
        public string UrlPrintOrder { get; set; } = "shiip/public-api/v2/a5/gen-token";
        public string ApiPrintOrder
        {
            get
            {
                return $"{APIEnpoint}/{ApiPrintOrder}";

            }
        }
    }
}
