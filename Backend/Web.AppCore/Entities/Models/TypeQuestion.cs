using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{
    /// <summary>
    /// Loại câu hỏi
    /// Loại thi lớp 1, 2....12
    /// Loại câu hỏi thi toiec
    /// Loại câu hỏi luyện từ vựng
    /// Loại câu hỏi luyện ngữ pháp.....
    /// </summary>
    public class TypeQuestion
    {
        /// <summary>
        /// Id
        /// </summary>
        public string TypeQuestionId { get; set; }

        /// <summary>
        /// Tên loại câu hỏi
        /// </summary>
        public string TypeQuestionName { get; set; }

        /// <summary>
        /// Mô tả loại câu hỏi
        /// </summary>
        public string TypeDescription { get; set; }

        /// <summary>
        /// Thời gian tạo
        /// </summary>
        public DateTime? CreatedDate { get; set; }

        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        public DateTime? ModifiedDate { get; set; }
        public NumberType Number { get; set; } = NumberType.KnowBasic;

    }
    public enum NumberType
    {
        /// <summary>
        /// Nhận biết
        /// </summary>
        KnowBasic = 1,
        /// <summary>
        /// Phân trăm câu thông hiểu
        /// </summary>
        Understanding = 2,

        /// <summary>
        /// Vận dụng
        /// </summary>
        Manipulate = 3,

        /// <summary>
        /// Vận dụng cao
        /// </summary>
        HighManipulate = 4
    }
}
