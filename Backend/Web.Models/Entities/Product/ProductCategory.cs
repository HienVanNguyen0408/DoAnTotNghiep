using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class ProductCategory : BaseEntity
    {
        public string name { get; set; }
        public string description { get; set; }
    }
}
