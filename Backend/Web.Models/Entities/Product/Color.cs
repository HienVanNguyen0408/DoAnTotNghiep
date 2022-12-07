using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class Color : BaseEntity
    {
        public string product_id { get; set; }
        /// <summary>
        /// Tên kích thước
        /// </summary>
        public string size_name { get; set; }

        /// <summary>
        /// Màu sắc: lưu trữ dạng hex color
        /// VD: #000000
        /// </summary>
        public string color_name { get; set; }

        /// <summary>
        /// Số lượng sản phẩm
        /// </summary>
        public int amount { get; set; }
    }
}
