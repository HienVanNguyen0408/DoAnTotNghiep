using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{
    public class Option
    {
        public string OptionId { get; set; }
        public string TextOption { get; set; }
        public string QuestionId { get; set; }
        /// <summary>
        /// Thời gian tạo
        /// </summary>
        public DateTime? CreatedDate { get; set; }

        /// <summary>
        /// Thời gian sửa
        /// </summary>
        public DateTime? ModifiedDate { get; set; }
        public bool Check { get; set; }
    }
}
