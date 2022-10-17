﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;
using Web.Models.Enums;

namespace Web.Models.Entities
{
    public class User : BaseEntity
    {
        /// <summary>
        /// User Id
        /// </summary>
        /// 
        [JsonIgnore]
        public string UserId { get; set; } = GenerateNewId();

        /// <summary>
        /// Tên tài khoản , đăng nhập
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// Mật khẩu
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// Họ tên đầy đủ
        /// </summary>
        public string FullName { get; set; }

        /// <summary>
        /// Địa chỉ
        /// </summary>
        public string Address { get; set; }

        /// <summary>
        /// Số điện thoại
        /// </summary>
        public string PhoneNumber { get; set; }

        /// <summary>
        /// Email đăng nhập
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// Email Id
        /// </summary>
        public string EmailId { get; set; }

        /// <summary>
        /// Loại quyền của User
        /// </summary>
        public RoleType RoleType { get; set; } = RoleType.User;
    }
}
