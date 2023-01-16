using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class Cart
    {
        /// <summary>
        /// Id của đơn hàng trong giỏ
        /// </summary>
        public string id { get; set; }

        /// <summary>
        /// Id của user
        /// </summary>
        public string user_id { get; set; }

        /// <summary>
        /// Id sản phẩm
        /// </summary>
        public string product_id { get; set; }

        /// <summary>
        /// Tên sản phẩm
        /// </summary>
        public string product_name { get; set; }

        /// <summary>
        /// Màu sắc
        /// </summary>
        public string color_name { get; set; }

        /// <summary>
        /// Kích thước
        /// </summary>
        public string size_name { get; set; }

        /// <summary>
        /// Số lượng
        /// </summary>

        public int amount { get; set; }

        /// <summary>
        /// Ảnh sản phẩm
        /// </summary>

        public string path { get; set; }
    }
}
