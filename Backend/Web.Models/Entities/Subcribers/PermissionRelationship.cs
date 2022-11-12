using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class PermissionRelationship : BaseEntity
    {
        /// <summary>
        /// id của người dùng
        /// </summary>
        public string user_id { get; set; }

        /// <summary>
        /// id của quyền
        /// </summary>
        public string permission_id { get; set; }

        /// <summary>
        /// quyền đã bỏ hay chưa
        /// </summary>
        public bool suspend { get; set; }
    }
}
