using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Models.Entities.GHN
{
    public class GHNCreateRespone
    {
        public int code { get; set; }
        public string message { get; set; }
        public object data { get; set; }
        public int coupon { get; set; }
        public int insurance { get; set; }
        public int main_service { get; set; }
        public string order_code { get; set; }
        public string sort_code { get; set; }
        public string total_fee { get; set; }
        public string trans_type { get; set; }
    }
}
