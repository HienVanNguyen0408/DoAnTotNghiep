using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class OrderItem : BaseEntity
    {
        /// <summary>
        /// Id của sản phẩm
        /// </summary>
        public string product_id { get; set; }

        /// <summary>
        /// Id của đơn hàng
        /// </summary>
        public string order_id { get; set; }

        /// <summary>
        /// Số lượng
        /// </summary>
        public int quantity { get; set; }
        
        /// <summary>
        /// Đơn giá
        /// </summary>
        public decimal unit_price { get; set; }

        /// <summary>
        /// Thuế suất
        /// </summary>
        public decimal? vat_rate { get; set; }

        /// <summary>
        /// Tổng thuế 
        /// </summary>
        public decimal? vat_amount { get; set; }

        /// <summary>
        /// tỷ lệ ck
        /// </summary>
        public decimal? discount_rate { get; set; }

        /// <summary>
        /// Tiền ck
        /// </summary>
        public decimal? discount_amount { get; set; }
    }
}
