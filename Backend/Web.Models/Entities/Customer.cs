using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Enums;

namespace Web.Models.Entities
{
    public class Customer : BaseEntity
    {
        /// <summary>
        /// Id khách hàng
        /// </summary>
        public string CustomerId { get; set; }
        /// <summary>
        /// Mã khách hàng
        /// </summary>
        public string CustomerCode { get; set; }
        /// <summary>
        /// Giới tính của khách hàng
        /// </summary>
        public string Gender { get; set; }
        /// <summary>
        /// Khách hàng có phải người cao tuổi hay không
        /// lưu trữ dạng 0,1
        /// </summary>
        public int SeniorCitizen { get; set; }
        /// <summary>
        /// Khách hàng có phải đối tác hay không
        /// </summary>
        public string Partner { get; set; }
        /// <summary>
        /// Khách hàng có người phụ thuộc hay không
        /// </summary>
        public string Dependents { get; set; }
        /// <summary>
        /// Số tháng khashc hàng đã ở lại công ty
        /// </summary>
        public int Tenure { get; set; }
        /// <summary>
        /// Khách hàng có sử dụng dịch vụ điện thoại hay không
        /// </summary>
        public string PhoneService { get; set; }
        /// <summary>
        /// Khách hàng có nhiều đường dây hay không
        /// </summary>
        public string MultipleLines { get; set; }
        /// <summary>
        /// Nhà cung cấp dịch vụ internet của khách hàng (DSL, Fiber optic, No)
        /// </summary>
        public string InternetService { get; set; }
        /// <summary>
        /// Khách hàng có bảo mật trực tuyến hay không
        /// </summary>
        public string OnlineSecurity { get; set; }
        /// <summary>
        /// Khách hàng có sao lưu trực tuyến hay không
        /// </summary>
        public string OnlineBackup { get; set; }
        /// <summary>
        /// Khách hàng có bảo vệ thiết bị hay không
        /// </summary>
        public string DeviceProtection { get; set; }
        /// <summary>
        /// Khách hàng có hỗ trợ kỹ thuật hay không
        /// </summary>
        public string TechSupport { get; set; }
        /// <summary>
        /// Khách hàng có sử dụng truyền hình trực tuyến hay không
        /// </summary>
        public string StreamingTV { get; set; }
        /// <summary>
        /// Khách hàng có xem phim trực tuyến hay không
        /// </summary>
        public string StreamingMovies { get; set; }
        /// <summary>
        /// Thời hạn hợp đồng của khách hàng
        /// </summary>
        public string Contract { get; set; }
        /// <summary>
        /// Khách hàng có thanh toán không cần giấy tờ hay không
        /// </summary>
        public string PaperlessBilling { get; set; }
        /// <summary>
        /// Phương thức thanh toán của khách hàng
        /// </summary>
        public string PaymentMethod { get; set; }
        /// <summary>
        /// Số tiền tính cho khách hàng hàng tháng
        /// </summary>
        public string MonthlyCharges { get; set; }
        /// <summary>
        /// Tổng tiền tính cho khách hàng
        /// </summary>
        public string TotalCharges { get; set; }
        /// <summary>
        /// Khách hàng có rời bỏ hay không
        /// </summary>
        public string Churn { get; set; }
    }
}
