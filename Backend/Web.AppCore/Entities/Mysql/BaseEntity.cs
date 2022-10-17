using System;
using System.Collections.Generic;
using System.Text;
namespace Web.AppCore.Entities
{
    public class BaseEntity
    {
        /// <summary>
        /// Thời gian tạo
        /// </summary>
        /// 
        public DateTime CreatedDate { get; set; } = DateTime.Now;   

        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        /// 
        public DateTime ModifiedDate { get; set; } = DateTime.Now;
    }
}
