using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{
    public class PartListenRequest  : PartListen
    {
        public List<ExamQuestion> Questions { get; set; }
        public byte[] Image { get; set; }
        public byte[] Audio { get; set; }
        public string ImageName { get; set; }
        public string AudioName { get; set; }

        public List<string> PartListenIds { get; set; }
    }
}
