using System;
using System.Collections.Generic;
using Web.AppCore.Enum;
using Web.AppCore.Ultility;

namespace Web.AppCore.Entities
{
    public class QuestionRespone
    {
        /// <summary>
        /// Id
        /// </summary>
        public string QuestionId { get; set; }

        /// <summary>
        /// Nội dung của câu hỏi
        /// </summary>
        public string TextQuestion { get; set; }

        /// <summary>
        /// Path lưu trữ hình ảnh câu hỏi
        /// </summary>
        public string PathImage { get; set; }

        /// <summary>
        /// Path lưu trữ audio
        /// </summary>
        public string PathAudio { get; set; }

        /// <summary>
        /// Path lưu trữ video
        /// </summary>
        public string PathVideo { get; set; }

        public ExamForm ExamForm { get; set; } = ExamForm.SelectOne;

        /// <summary>
        /// Trình độ câu hỏi
        /// mức độ câu hỏi
        /// </summary>
        public string LevelQuestionId { get; set; }
        public string LevelName { get; set; }
        public string Result { get; set; }
        public bool IsListen { get; set; }
        public int NumberListen { get; set; }
        public string TypeQuestionId { get; set; }
        public string TypeQuestionName { get; set; }

        public LevelNumber LevelNumber { get; set; } = LevelNumber.Beginner;
        public NumberType Number { get; set; } = NumberType.KnowBasic;

        public int? SerialQuestion { get; set; }
        public string PartListenId { get; set; }
        /// <summary>
        /// Thời gian tạo ra câu hỏi
        /// </summary>
        public DateTime? CreatedDate { get; set; }

        /// <summary>
        /// Thời gian sửa đổi câu hỏi
        /// </summary>
        public DateTime? ModifiedDate { get; set; }
        public List<ImageQuestion> Images { get; set; }
        public List<ContentQuestion> Contents { get; set; }
        public List<Option> Options { get; set; }

        public string DataImage { 
            get {
                return PathImage.GetDataFileAsync();
            } 
        }
        public string DataAudio { 
            get
            {
                return PathAudio.GetDataFileAsync();
            }
        }

        public string ExamFormText
        {
            get
            {
                switch (ExamForm)
                {
                    case ExamForm.SelectOne:
                        return "Chọn 1 đáp án";
                    case ExamForm.SelectMany:
                        return "Chọn nhiều đáp án";
                    case ExamForm.TrueFalse:
                        return "Chọn đúng sai";
                }
                return "";
            }
        }
    }
}
