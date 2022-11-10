using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class Color : BaseEntity
    {
        /// <summary>
        /// id của kích thước
        /// </summary>
        public string size_id { get; set; }
        /// <summary>
        /// Mã màu red
        /// </summary>
        public int red { get; set; }
        /// <summary>
        /// Mã màu green
        /// </summary>
        public int green { get; set; }
        /// <summary>
        /// Mã màu blue
        /// </summary>
        public int blue { get; set; }
    }
}
