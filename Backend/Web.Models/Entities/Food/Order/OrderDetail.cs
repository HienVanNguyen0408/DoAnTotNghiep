using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class OrderDetail
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public string ProductId { get; set; }
        public string ProductName { get; set; }

        /// <summary>
        /// Số lượng
        /// </summary>
        public decimal Quantity { get; set; }
        
        /// <summary>
        /// Đơn giá
        /// </summary>
        public decimal UnitPrice { get; set; }

        /// <summary>
        /// Tổng tiền
        /// </summary>
        public decimal TotalAmount { get; set; }
    }
}
