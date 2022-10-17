using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    /// <summary>
    /// Đơn vị của sản phẩm
    /// </summary>
    public class UnitProduct
    {
        public string UnitId { get; set; } = Guid.NewGuid().ToString();
        /// <summary>
        /// Đơn vị
        /// </summary>
        public string UnitName { get; set; }
        /// <summary>
        /// Mô tả đơn vị
        /// </summary>
        public string UnitDiscription { get; set; }

    }
}
