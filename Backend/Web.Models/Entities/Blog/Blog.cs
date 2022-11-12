using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    /// <summary>
    /// Bài viết
    /// </summary>
    public class Blog : BaseEntity
    {
        /// <summary>
        /// Id của loại bài viết
        /// </summary>
        public string blog_category_id { get; set; }

        /// <summary>
        /// Người tạo bài viết
        /// </summary>
        public string user_id { get; set; }

        /// <summary>
        /// Id của ảnh trên bài viết
        /// </summary>
        public string image_id { get; set; }

        /// <summary>
        /// Tiêu đề của bài viết
        /// </summary>
        public string title { get; set; }

        /// <summary>
        /// Tóm tắt của bài viết
        /// </summary>
        public string summary { get; set; }

        /// <summary>
        /// Nội dung của bài viết
        /// </summary>
        public string content { get; set; }
    }
}
