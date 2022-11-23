using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Request
{
    public class OrderRequest : Order
    {
        public List<OrderItemRequest> order_items { get; set; }
    }
}
