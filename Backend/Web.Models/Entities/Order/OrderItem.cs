using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class OrderItem : BaseEntity
    {
        public string product_id { get; set; }
        public Product product { get; set; }

        /// <summary>
        /// Số lượng
        /// </summary>
        public decimal quantity { get; set; }
        
        /// <summary>
        /// Đơn giá
        /// </summary>
        public decimal price { get; set; }

        /// <summary>
        /// Tổng tiền
        /// </summary>
        public decimal total_price { get; set; }
    }
}
