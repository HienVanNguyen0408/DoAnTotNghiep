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
        /// Email đăng nhập
        /// </summary>
        public string email { get; set; }
        /// <summary>
        /// Ngày sinh
        /// </summary>
        public DateTime? date_of_birth { get; set; }
        public RoleType role { get; set; } = RoleType.User;
    }
}
