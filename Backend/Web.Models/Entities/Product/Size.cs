using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class Size : BaseEntity
    {
        /// <summary>
        /// Tên size
        /// </summary>
        public string size_name { get; set; }
        /// <summary>
        /// Id của sản phẩm
        /// </summary>
        public string product_id { get; set; }
    }
}
