using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{

    /// <summary>
    /// Trình độ câu hỏi
    /// Mức độ của câu hỏi
    /// </summary>
    public class LevelQuestion
    {
        /// <summary>
        /// Id
        /// </summary>
        public string LevelQuestionId { get; set; }

        /// <summary>
        /// Tên mức độ
        /// </summary>
        public string LevelName { get; set; }

        /// <summary>
        /// Số mức độ
        /// </summary>
        public LevelNumber LevelNumber { get; set; } = LevelNumber.Beginner;

        /// <summary>
        /// Thời gian tạo
        /// </summary>
        public DateTime? CreatedDate { get; set; }

        /// <summary>
        /// Thời gian sửa
        /// </summary>
        public DateTime? ModifiedDate { get; set; }
    }

    public enum LevelNumber
    {
        // Người mới bắt đầu
        Beginner = 0,
        HighBeginner = 200,
        LowIntermediate = 350,
        Intermediate = 400,
        HighIntermediate = 550,
        LowAdvanced = 650,
        Advanced = 800,
    }
}
