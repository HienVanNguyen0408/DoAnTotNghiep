using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities.Subcribers
{
    /// <summary>
    /// Đánh giá cửa hàng
    /// </summary>
    public class Feedback : BaseEntity
    {
        /// <summary>
        /// Tiêu đề
        /// </summary>
        public string title { get; set; }

        /// <summary>
        /// Số điểm
        /// </summary>
        public int score { get; set; }

        /// <summary>
        /// Nội dung đánh giá
        /// </summary>
        public string content { get; set; }
    }
}
