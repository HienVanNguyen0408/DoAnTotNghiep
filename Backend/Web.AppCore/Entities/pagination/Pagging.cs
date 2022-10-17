using System;
using System.Collections.Generic;
using System.Text;

namespace Web.AppCore.Entities
{
    public class Pagging<T> where T : class
    {
        #region Property
        /// <summary>
        /// Tổng số bản ghi
        /// </summary>
        public int TotalRecord { get; set; }

        /// <summary>
        /// Tổng số trang
        /// </summary>
        public int TotalPages { get; set; }

        /// <summary>
        /// Dữ liệu phân trang
        /// </summary>
        public IEnumerable<T> Data { get; set; }

        /// <summary>
        /// Trang hiện tại
        /// </summary>
        public int PageIndex { get; set; }

        /// <summary>
        /// Kích thước trang : số đối tượng trên 1 trang
        /// </summary>
        public int PageSize { get; set; }

        #endregion
    }
}
