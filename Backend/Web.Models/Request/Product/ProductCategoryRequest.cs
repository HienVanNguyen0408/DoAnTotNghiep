using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Request
{
    public class ProductCategoryRequest : ProductCategory
    {
        public IEnumerable<Product> products { get; set; }
    }
}
