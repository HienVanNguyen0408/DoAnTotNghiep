using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Enums;

namespace Web.Models.Entities
{
    public class Order : BaseEntity
    {
        public string OrderId { get; set; } = GenerateNewId();
        /// <summary>
        /// Id người dùng
        /// </summary>
        public string UserId { get; set; }
        /// <summary>
        /// Id khách hàng
        /// </summary>
        public string UserName { get; set; }
        public List<OrderDetail> OrderDetails { get; set; }

        /// <summary>
        /// Trạng thái của đơn hàng
        /// </summary>
        public OrderStatus OrderStatus { get; set; } = OrderStatus.None;

        /// <summary>
        /// Tổng tiền hàng của đơn
        /// </summary>
        public decimal? TotalAmount { get; set; }

        /// <summary>
        /// Phương thức thanh toán 
        /// </summary>
        public PaymentMethod PaymentMethod { get; set; } = PaymentMethod.Cash;

        /// <summary>
        /// Thời gian dự tính giao hàng
        /// </summary>
        public DateTime? EstimatedDate{ get; set; }

        /// <summary>
        /// Thời gian cập nhật quá trình vận chuyển
        /// </summary>
        public DateTime? DeliveryUpdateDate{ get; set; }


        #region Thông tin của người nhận hàng
        /// <summary>
        /// Địa chỉ nhận hàng
        /// </summary>
        public string Address { get; set; }
        /// <summary>
        /// SDT người  nhận
        /// </summary>
        public string PhoneNumber { get; set; }
        /// <summary>
        /// Người nhận
        /// </summary>
        public string ReceiverName { get; set; }

        /// <summary>
        /// Nội dung, ghi chú của đơn hàng
        /// </summary>
        public string Content { get; set; }
        #endregion


        #region Thông tin người giao hàng
        public string ShiperName { get; set; }
        public string ShiperPhoneNumber { get; set; }
        public string ShiperAddress { get; set; }
        #endregion


        #region Thông tin kho nhận hàng
        #endregion
    }
}
