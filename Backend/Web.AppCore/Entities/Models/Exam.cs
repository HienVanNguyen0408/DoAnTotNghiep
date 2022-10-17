using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{
    public class EnglishExam
    {
        public string ExamId { get; set; }
        public string LevelName { get; set; }
        public LevelNumber LevelNumber { get; set; } = LevelNumber.Beginner;
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    } 
    public class ExamRespone : EnglishExam
    {
        public List<QuestionRespone> QuestionListens { get; set; }
        public List<QuestionRespone> QuestionReads { get; set; }
        public List<PartListenResponse> PartListens { get; set; }
    }

    public class ExamListen
    {
        public string ExamListenId { get; set; }
        public string ExamId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
    public class ExamRead
    {
        public string ExamReadId { get; set; }
        public string ExamId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
    public class PartListen
    {
        public string PartListenId { get; set; }
        public string PathImage { get; set; }
        public string PathAudio { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
    public class QuestionListen
    {
        public string QuestionListenId { get; set; }
        public string ExamListenId { get; set; }
        public string QuestionId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
    public class QuestionRead
    {
        public string QuestionReadId { get; set; }
        public string ExamReadId { get; set; }
        public string QuestionId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }

    public class DataId
    {
        public string ExamReadId { get; set; }
        public string ExamListenId { get; set; }
    }

}
