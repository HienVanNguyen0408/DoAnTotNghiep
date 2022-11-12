using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class Permission : BaseEntity
    {
        /// <summary>
        /// Tên quyền
        /// </summary>
        public string permission_name { get; set; }
        /// <summary>
        /// Mô tả
        /// </summary>
        public string description { get; set; }
    }
}
