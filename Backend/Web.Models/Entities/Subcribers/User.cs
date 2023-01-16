using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;
using Web.Models.Enums;

namespace Web.Models.Entities
{
    public class User : BaseEntity
    {
        /// <summary>
        /// Tên tài khoản , đăng nhập
        /// </summary>
        public string user_name { get; set; }

        /// <summary>
        /// Mật khẩu
        /// </summary>
        /// 
        public string password { get; set; }

        /// <summary>
        /// Họ tên đầy đủ
        /// </summary>
        public string full_name { get; set; }

        /// <summary>
        /// Địa chỉ
        /// </summary>
        public string address { get; set; }

        /// <summary>
        /// Số điện thoại
        /// </summary>
        public string phone_number { get; set; }
        /// <summary>
        /// Tỉnh thành phố
        /// </summary>
        public string province { get; set; }
        /// <summary>
        /// Quận huyện
        /// </summary>
        public string district { get; set; }
        /// <summary>
        /// Xã phường
        /// </summary>
        public string ward { get; set; }

        /// <summary>
        /// Email đăng nhập
        /// </summary>
        public string email { get; set; }
        /// <summary>
        /// Ngày sinh
        /// </summary>
        public DateTime? date_of_birth { get; set; }

        public string address_info
        {
            get
            {
                if (string.IsNullOrEmpty(ward) || string.IsNullOrEmpty(district) || string.IsNullOrEmpty(province) || string.IsNullOrEmpty(address)) return string.Empty;
                return $"{address}, {ward}, {district}, {province}";
            }
        }
    }
}
