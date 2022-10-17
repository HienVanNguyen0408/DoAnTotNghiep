using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{
    public class ExamCheckResult
    {
        public string UserId { get; set; }
        public List<QuestionRequest> Questions { get; set; }
    }

    public class QuestionCheckResult{
        public QuestionRespone Question { get; set; }
        public string Result { get; set; }
        public string OptionSelect { get; set; }
        public bool Yes { get; set; }
        public bool  IsListen { get; set; }
    }

    public class ExamResult
    {
        
        public List<QuestionCheckResult> Questions { get; set; }
        public int NumberSelectRead{
            get
            {
                if (Questions == null || Questions.Count <= 0) return 0;
                return Questions.Count(x => !x.IsListen && !string.IsNullOrEmpty(x.OptionSelect));
            }
        }
        /// <summary>
        /// Số câu đọc
        /// </summary>
        public int NumberRead {
            get
            {
                if (Questions == null || Questions.Count <= 0) return 0;
                return Questions.Count(x => !x.IsListen);
            }
        }
        /// <summary>
        /// Số câu đọc đúng
        /// </summary>
        public int NumberReadYes {
            get
            {
                if (Questions == null || Questions.Count <= 0) return 0;
                return Questions.Count(x => !x.IsListen && x.Yes);
            }
        }
        public int NumberReadNo
        {
            get
            {
                if (Questions == null || Questions.Count <= 0) return 0;
                return Questions.Count(x => !x.IsListen && !x.Yes);
            }
        }

        /// <summary>
        /// Số câu nghe
        /// </summary>
        public int NumberListen {
            get
            {
                if (Questions == null || Questions.Count <= 0) return 0;
                return Questions.Count(x => x.IsListen);
            }
        }
        /// <summary>
        /// Số câu nghe đúng
        /// </summary>
        public int NumberListenYes {
            get
            {
                if (Questions == null || Questions.Count <= 0) return 0;
                return Questions.Count(x => x.IsListen && x.Yes);
            }
        }
        public int NumberListenNo
        {
            get
            {
                if (Questions == null || Questions.Count <= 0) return 0;
                return Questions.Count(x => x.IsListen && !x.Yes);
            }
        }
        public int NumberSelectListen
        {
            get
            {
                if (Questions == null || Questions.Count <= 0) return 0;
                return Questions.Count(x => x.IsListen && !string.IsNullOrEmpty(x.OptionSelect));
            }
        }
    }


    public class ExamHistory
    {
        public List<QuestionRespone> Questions{ get; set; }
        public int ScoreListen { get; set; }
        public int ScoreRead { get; set; }
        public LevelNumber LevelNumber { get; set; }
        public string ExamId { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}
