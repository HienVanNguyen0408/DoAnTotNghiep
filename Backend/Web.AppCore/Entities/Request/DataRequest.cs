using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{
    public class DataRequest
    {
        public string UserId { get; set; }
        public string TypeQuestionId { get; set; }
        public string LevelQuestionId { get; set; }
        public int ExamAmount { get; set; } = 1;
    }

    /// <summary>
    ///  Phần trăm các loại câu hỏi của từng bài thi
    /// </summary>
    public class PercentExamQuestion
    {
        /// <summary>
        /// Nhận biết
        /// </summary>
        public int KnowBasic { get; set; }
        /// <summary>
        /// Phân trăm câu thông hiểu
        /// </summary>
        public int Understanding { get; set; }

        /// <summary>
        /// Vận dụng
        /// </summary>
        public int Manipulate { get; set; }
        
        /// <summary>
        /// Vận dụng cao
        /// </summary>
        public int HighManipulate { get; set; }
    }
    public class ExamRequest
    {
        public LevelNumber LevelNumber { get; set; } = LevelNumber.Beginner;
    }

    public class SubmitResult
    {
        public string UserId { get; set; }
        public string ExamId { get; set; }
        public List<QuestionRequest> Questions { get; set; }
        public bool IsLoginGoogle { get; set; } = false;
    }

}
