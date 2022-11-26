using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    /// <summary>
    /// Bình luận của khách hàng về sản phẩm
    /// </summary>
    public class Comment : BaseEntity
    {
        public string user_id { get; set; }
        public string product_id { get; set; }
        public string content { get; set; }
    }
}
