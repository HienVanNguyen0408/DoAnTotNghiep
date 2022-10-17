using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{
    public class ContentQuestion
    {
        public string ContentQuestionId { get; set; }
        public string QuestionId { get; set; }
        public string PathImage { get; set; }
        public string PathAudio { get; set; }
        public string TextContent { get; set; }
        public int NumberContent { get; set; }
        /// <summary>
        /// Thời gian tạo
        /// </summary>
        public DateTime? CreatedDate { get; set; }

        /// <summary>
        /// Thời gian sửa
        /// </summary>
        public DateTime? ModifiedDate { get; set; }
    }
}
