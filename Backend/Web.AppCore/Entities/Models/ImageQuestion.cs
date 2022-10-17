using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{
    public class ImageQuestion
    {
        public string ImageQuestionId { get; set; }
        public string PathImage { get; set; }
        public int NumberImage { get; set; }
        public string QuestionId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}
