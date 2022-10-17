using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Enums
{
    public enum PaymentMethod
    {
        /// <summary>
        /// Mặc định
        /// </summary>
        None = 1,

        /// Tiền mặt
        /// </summary>
        Cash = 2,

        /// <summary>
        /// Ck ngân hàng
        /// </summary>
        TransferBank = 3,

        /// <summary>
        /// Thanh toán Momo
        /// </summary>
        TransferMomo = 4,

        /// <summary>
        /// Thanh toán VNPay
        /// </summary>
        TransferVNPay = 5,
        
        /// <summary>
        /// Thanh toán tiền ảo
        /// </summary>
        TransferCoin = 6,

        /// <summary>
        /// Thanh toán quốc tế
        /// </summary>
        InternationalTransfer = 7
    }
}
