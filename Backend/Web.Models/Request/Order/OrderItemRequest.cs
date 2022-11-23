using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Request
{
    public class OrderItemRequest : OrderItem
    {
        public Product product { get; set; }
    }
}
