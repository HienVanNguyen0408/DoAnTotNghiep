using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Enums.Subcribers
{
    public enum InsertStatus
    {
        /// <summary>
        /// Thành công
        /// </summary>
        Success = 1,
        /// <summary>
        /// Thất bại
        /// </summary>
        Fail = 2,
        /// <summary>
        /// Trùng
        /// </summary>
        Duplicate = 3,
        /// <summary>
        /// Không rõ nguyên nhân
        /// </summary>
        Unknow = 4
    }
}
