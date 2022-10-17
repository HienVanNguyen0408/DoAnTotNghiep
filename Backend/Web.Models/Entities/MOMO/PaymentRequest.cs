using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities.MOMO
{
    public class PaymentRequest
    {
        /// <summary>
        /// mã đối tác được momo cung cấp
        /// </summary>
        public string PartnerCode { get; set; } = "MOMOQQJ320220908";
        /// <summary>
        /// Định danh duy nhất cho mỗi yêu cầu
        /// Đối tác sử dụng requestId để xử lý idempotency
        /// </summary>
        public string RequestId { get; set; } = $"{Guid.NewGuid()}";

        /// <summary>
        /// Tiền thanh toán đơn vị VND
        /// min:1.000
        /// max 50.000.000
        /// </summary>
        public long Amount { get; set; } = 10000;

        /// <summary>
        /// Mã đơn hàng của đối tác
        /// Được momo cung cấp - Merchant ID
        /// </summary>
        public string OrderId { get; set; } = $"{Guid.NewGuid()}";

        /// <summary>
        /// Thông tin đơn hàng
        /// </summary>
        public string OrderInfo { get; set; } = "Thanh toán qua ví MoMo";
        /// <summary>
        /// Một URL của đối tác. URL này được sử dụng để chuyển trang (redirect) từ MoMo về trang mua hàng của đối tác sau khi khách hàng thanh toán.
        /// </summary>
        public string RedirectUrl { get; set; } = "http://192.168.0.100:8080/payment-order";
        /// <summary>
        /// API của đối tác. Được MoMo sử dụng để gửi kết quả thanh toán theo phương thức IPN (server-to-server)
        /// </summary>
        public string IpnUrl { get; set; } = "http://192.168.0.100:8080/payment-order";
        /// <summary>
        /// luôn luôn là captureWallet
        /// </summary>
        public string RequestType { get; set; } = "captureWallet";

        public string ExtraData { get; set; } = "";
        /// <summary>
        /// Ngôn ngữ của message được trả về (vi hoặc en)
        /// </summary>
        public string Lang { get; set; } = "vi";

        /// <summary>
        /// Chữ kí số
        /// Chữ ký để xác nhận giao dịch. Sử dụng thuật toán Hmac_SHA256 với data theo định dạng được sort từ a-z :
        /// accessKey=$accessKey&amount=$amount&extraData=$extraData&ipnUrl=$ipnUrl&orderId=$orderId&orderInfo=$orderInfo&partnerCode=$partnerCode&redirectUrl=$redirectUrl&requestId=$requestId&requestType=$requestType
        /// </summary>
        public string Signature { get; set; }
    }
}
