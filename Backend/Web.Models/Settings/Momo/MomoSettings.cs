using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Settings.Momo
{
    public class MomoSettings
    {
        public string MomoEnpoint { get; set; } = "https://test-payment.momo.vn/v2/gateway/api/create";
        public string PartnerCode { get; set; } = "MOMOQQJ320220908";
        public string AccessKey { get; set; } = "GF2RTsAg8BCkWMSe";
        public string SecretKey { get; set; } = "UkiIyWSXrZRCjMqQDlve7QcysZdCdlUi";
        public string ApiEnpoint { get; set; } = "https://test-payment.momo.vn/v2/gateway/api/create";
        public string RedirectUrl { get; set; } = "http://192.168.0.100:8080/payment-order";
        public string IpnUrl { get; set; } = "http://192.168.0.100:8080/payment-order";
    }
}
