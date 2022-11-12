using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    /// <summary>
    /// Chi tiết quyền
    /// </summary>
    public class PermissionDetail : BaseEntity 
    {
        /// <summary>
        /// id của quyền
        /// </summary>
        public string permission_id { get; set; }
        /// <summary>
        /// Tên hành động
        /// </summary>
        public string name_action { get; set; }
        /// <summary>
        /// Mã hành động
        /// </summary>
        public string code_action { get; set; }
    }
}
