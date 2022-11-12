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
        /// Email đăng nhập
        /// </summary>
        public string email { get; set; }

        /// <summary>
        /// Ngày sinh
        /// </summary>
        public DateTime? date_of_birth { get; set; }

        /// <summary>
        /// Loại quyền của User
        /// </summary>
        //public RoleType role_type { get; set; } = RoleType.User;
    }
}
