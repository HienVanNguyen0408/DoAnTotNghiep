using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Enums
{
    public enum DeleteStatus
    {
        None = 1,
        /// <summary>
        /// Thành công
        /// </summary>
        Success = 2,
        /// <summary>
        /// Thất bại
        /// </summary>
        Fail = 3,
        /// <summary>
        /// Phát sinh dữ liệu referen
        /// </summary>
        Incurred = 4
    }
}
