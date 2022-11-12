using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Enums;

namespace Web.Models.Entities
{
    public class Order : BaseEntity
    {
        /// <summary>
        /// Id người dùng
        /// </summary>
        public string user_id { get; set; }

        /// <summary>
        /// Trạng thái của đơn hàng
        /// </summary>
        public OrderStatus order_status { get; set; } = OrderStatus.None;

        /// <summary>
        /// Tổng tiền hàng của đơn
        /// </summary>
        public decimal? total_amount { get; set; }

        /// <summary>
        /// Tổng tiền thuế
        /// </summary>
        public decimal? vat_amount { get; set; }

        /// <summary>
        /// Thuế suất đơn hàng
        /// </summary>
        public decimal? vat_rate { get; set; }

        /// <summary>
        /// Tỷ lệ chiết khấu
        /// </summary>
        public decimal? discount_rate { get; set; }
        /// <summary>
        /// Tổng tiền chiết khấu
        /// </summary>
        public decimal? discount_amount { get; set; }

        /// <summary>
        /// Phương thức thanh toán 
        /// </summary>
        public PaymentMethod payment_method { get; set; } = PaymentMethod.Cash;

        /// <summary>
        /// Thời gian dự tính giao hàng
        /// </summary>
        public DateTime? estimated_date{ get; set; }

        /// <summary>
        /// Thời gian cập nhật quá trình vận chuyển
        /// </summary>
        public DateTime? delivery_update_date{ get; set; }

        #region Thông tin của người nhận hàng
        /// <summary>
        /// Địa chỉ nhận hàng
        /// </summary>
        public string address { get; set; }
        /// <summary>
        /// SDT người  nhận
        /// </summary>
        public string phone_number { get; set; }
        /// <summary>
        /// Người nhận
        /// </summary>
        public string receiver_name { get; set; }

        /// <summary>
        /// Nội dung, ghi chú của đơn hàng
        /// </summary>
        public string content { get; set; }
        #endregion


        #region Thông tin người giao hàng
        public string shiper_name { get; set; }
        public string shiper_phone_number { get; set; }
        public string shiper_address { get; set; }
        #endregion


        #region Thông tin của bên vận chuyển
        /// <summary>
        /// Đơn vị vận chuyển
        /// </summary>
        public UnitTransport unit_transport { get; set; }
        #endregion
    }
}
