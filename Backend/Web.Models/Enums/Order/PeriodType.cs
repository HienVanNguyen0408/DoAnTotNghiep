using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Enums.Order
{
    public enum PeriodType
    {
        /// <summary>
        /// 7 Ngày gần nhất
        /// </summary>
        Last7Days = 7,

        /// <summary>
        /// Tháng này
        /// </summary>
        ThisMonth = 30,
        /// <summary>
        /// Năm nay
        /// </summary>
        ThisYear = 365,

    }
}
