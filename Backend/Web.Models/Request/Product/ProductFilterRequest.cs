using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Request
{
    public class ProductFilterRequest : Pagination
    {
        public string Sort { get; set; }
        public string CategoryId { get; set; }
        public decimal? SalePrice { get; set; }
    }
}
