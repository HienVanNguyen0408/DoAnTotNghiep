using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    /// <summary>
    /// Ảnh trong bài viết
    /// </summary>
    public class Image : BaseEntity
    {
        /// <summary>
        /// Đường dẫn lưu trữ ảnh
        /// </summary>
        public string path { get; set; }
        /// <summary>
        /// Ảnh được chọn
        /// </summary>
        public bool is_picked { get; set; }

        /// <summary>
        /// Id của sản phẩm
        /// </summary>
        public string product_id { get; set; }
    }
}
