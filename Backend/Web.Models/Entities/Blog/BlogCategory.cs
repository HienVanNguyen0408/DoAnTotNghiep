using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    /// <summary>
    /// Kiểu của bài viết
    /// </summary>
    public class BlogCategory :  BaseEntity
    {
        /// <summary>
        /// Tên loại bài viết
        /// </summary>
        public string name { get; set; }

        /// <summary>
        /// Mô tả loại bài viết
        /// </summary>
        public string description { get; set; }
    }
}
