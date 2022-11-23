using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Request
{
    public class ProductRequest : Product
    {
        /// <summary>
        /// Danh sách ảnh của sản phẩm
        /// </summary>
        public IEnumerable<Image> images { get; set; }
    }
}
