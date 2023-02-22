using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Enums
{
    /// <summary>
    /// Trạng thái của đơn hàng
    /// </summary>
    public enum OrderStatus
    {
        /// <summary>
        /// Trạng thái mặc định của đơn hàng
        /// </summary>
        Order = 0,
        /// <summary>
        /// Đặt hàng
        /// </summary>
        ConfirmOrder = 1,
        /// <summary>
        /// Đang vẩn chuyên
        /// </summary>
        Transfering = 2,
        /// <summary>
        /// Thành công
        /// </summary>
        Success = 3,
        /// <summary>
        /// Thất bại
        /// </summary>
        Fail = 4,
        /// <summary>
        /// Hủy
        /// </summary>
        Cancel = 5,

        All = 100
    }
}
