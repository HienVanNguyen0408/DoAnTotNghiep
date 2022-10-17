using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Models.Entities
{
    public class MailContent
    {
        /// <summary>
        /// Địa chỉ gửi đến
        /// </summary>
        public string To { get; set; }            

        /// <summary>
        /// Tiêu đề của email
        /// </summary>
        public string Subject { get; set; } 

        /// <summary>
        /// Nội dung của email(chưa hỗ trợ file đính kèm)
        /// </summary>
        public string Body { get; set; } 
    }
}
