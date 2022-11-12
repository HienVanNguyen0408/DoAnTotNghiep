using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class Product : BaseEntity
    {
        public string id { get; set; }
        /// <summary>
        /// Mã sản phẩm
        /// </summary>
        public string code { get; set; }

        /// <summary>
        /// Tên sản phẩm
        /// </summary>
        public string product_name { get; set; }
        /// <summary>
        /// Mô tả sản phẩm
        /// </summary>
        public string description { get; set; }

        /// <summary>
        /// Ngày hết hạn
        /// </summary>
        public DateTime expired_date { get; set; }
        /// <summary>
        /// Ngày sản xuất
        /// </summary>
        public DateTime manufacture_date { get; set; }

        /// <summary>
        /// Số lượng
        /// </summary>
        public long quantity { get; set; }

        /// <summary>
        /// Số lượng đã bán
        /// </summary>
        public long quantity_sold { get; set; }

        /// <summary>
        /// Giá gốc(giá nhập vào)
        /// </summary>
        public decimal original_price { get; set; }
        /// <summary>
        /// Giá bán
        /// </summary>
        public decimal sale_price { get; set; }
        /// <summary>
        /// Đơn vị
        /// </summary>
        public string unit_name { get; set; }
        /// <summary>
        /// Mô tả đơn vị
        /// </summary>
        public string unit_discription { get; set; }
    }
}
