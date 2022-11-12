using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class Avatar : BaseEntity
    {
        public string user_id { get; set; }
        /// <summary>
        /// Đường dẫn lưu trữ ảnh 
        /// </summary>
        public string path { get; set; }
        /// <summary>
        /// Trạng thái hoạt động của avatar
        /// </summary>
        public bool active { get; set; }
    }
}
