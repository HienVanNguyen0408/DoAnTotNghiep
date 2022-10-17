using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities.GHN
{
    public class OrderRequest
    {
        /// <summary>
        /// Chọn người trả phí vận chuyển.
        /// 1: shop (người bán trả)
        /// 2: người mua, người nhận hàng
        /// </summary>
        public int payment_type_id { get; set; }
        /// <summary>
        /// Lưu ý của khách hàng cho người giao hàng.
        /// </summary>
        public string note { get; set; }
        /// <summary>
        /// SDT liên hệ bưu điện trả lại
        /// </summary>
        public string return_phone { get; set; }
        /// <summary>
        /// Ghi chú , trả lại
        /// </summary>
        public string required_note { get; set; }
        /// <summary>
        /// Địa chỉ trả lại bưu điện
        /// </summary>
        public string return_address { get; set; }
        /// <summary>
        /// Id quận bưu điện trả lại
        /// </summary>
        public int? return_district_id { get; set; }
        /// <summary>
        /// Mã phường trả lại
        /// </summary>
        public string return_ward_code { get; set; }
        /// <summary>
        /// Mã đơn đặt hàng bên ngoài được quản lý bởi khách hàng đã ghi [Trường duy nhất].
        /// </summary>
        public string client_order_code { get; set; }
        /// <summary>
        /// Tên khách hàng(tên người mua)
        /// </summary>
        public string to_name { get; set; }
        /// <summary>
        /// SDT khách hàng
        /// </summary>
        public string to_phone { get; set; }
        /// <summary>
        /// Địa chỉ người mua
        /// </summary>
        public string to_address { get; set; }
        public string to_ward_code { get; set; }

        /// <summary>
        /// Số tiền mặt cần thu
        /// </summary>
        public int cod_amount { get; set; }
        /// <summary>
        /// Nội dung đặt hàng
        /// </summary>
        public string content { get; set; }
        /// <summary>
        /// Trọng lượng : đơn vị tính gram
        /// Maximum : 30000gram
        /// </summary>
        public int weight { get; set; }
        /// <summary>
        /// Chiều dài: cm
        /// Maximum : 150cm
        /// </summary>
        public int length { get; set; }
        /// <summary>
        /// Chiều rộng: cm
        /// Maximum : 150cm
        /// </summary>
        public int width { get; set; }
        /// <summary>
        /// Chiều cao :cm
        /// Maximum : 150cm
        /// </summary>
        public int height { get; set; }
        /// <summary>
        /// Người gửi hàng không nhận bưu kiện tại địa chỉ của cửa hàng
        /// </summary>
        public int pick_station_id { get; set; }
        public int? deliver_station_id { get; set; }
        /// <summary>
        /// Dùng để khai báo giá trị thửa đất. GHN sẽ căn cứ vào giá trị này để bồi thường nếu có bất kỳ điều gì không mong muốn xảy ra (mất, hỏng ...).
        /// Maximum 5.000.000, Default value: 0
        /// </summary>
        public decimal? insurance_value { get; set; }
        public int service_id { get; set; }
        /// <summary>
        /// Gọi API SERVICE để hiển thị dịch vụ.
        /// Giá trị mặc định: 1: Express, 2: Standard .Nếu không nhập service_id.
        /// </summary>
        public int service_type_id { get; set; }
        public int? coupon { get; set; }
        public List<int> pick_shift { get; set; }
        public List<OrderItemRequest> items { get; set; }
    }

    public class OrderItemRequest
    {
        /// <summary>
        /// Tên sản phẩm
        /// </summary>
        public string name { get; set; }
        /// <summary>
        /// Mã của sản phẩm
        /// </summary>
        public string code { get; set; }
        /// <summary>
        /// Số lượng sản phẩm
        /// </summary>
        public int quantity { get; set; }
        /// <summary>
        /// giá sản phẩm
        /// </summary>
        public decimal price { get; set; }
        /// <summary>
        /// Chiều rộng sp
        /// </summary>
        public int width { get; set; }
        /// <summary>
        /// chiều cao sp
        /// </summary>
        public int height { get; set; }
        /// <summary>
        /// Loại sp
        /// </summary>
        public object category { get; set; }
    }

    public class LeadTimeRequest
    {
        /// <summary>
        /// ID Quận/Huyện nhận bưu kiện
        /// </summary>
        public int FromDistrictId { get; set; }

        /// <summary>
        /// Mã Phường/Xã nhận bưu kiện
        /// </summary>
        public string FromWardCode { get; set; }

        /// <summary>
        /// ID Quận/Huyện bưu điện gửi đến
        /// </summary>
        public int ToDistrictId { get; set; }
        /// <summary>
        /// Mã Phường/Xã đến
        /// </summary>
        public string ToWardCode { get; set; }
        /// <summary>
        /// Chọn ID thiết bị phù hợp với gói vận chuyển của bạn (Nhanh, Tiêu chuẩn hoặc Tiết kiệm). Mỗi ID dịch vụ có phí và thời gian thực hiện khác nhau.
        /// </summary>
        public string ServiceId { get; set; }
    }
}
