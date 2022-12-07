using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Respone
{
    public class ProductRespone : Product
    {
        /// <summary>
        /// Data base64
        /// </summary>
        public List<string> files { get; set; }

        /// <summary>
        /// Thông tin chi tiết màu sắc
        /// </summary>
        public List<Color> colors { get; set; }
    }
}
