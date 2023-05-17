using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Enums.Order;

namespace Web.Models.Respone
{
    public class SaleStatistic
    {
        public PeriodType PeriodType { get; set; }
        public List<OrderInfo> OrderInfos { get; set; } = new List<OrderInfo>();
        public List<string> SaleStatisticText { get; set; }
    }
    public class OrderInfo
    {
        public decimal Sales { get; set; }
        public int NumberOrder { get; set; }
    }
}
