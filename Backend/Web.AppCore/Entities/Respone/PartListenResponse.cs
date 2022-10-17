using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Ultility;

namespace Web.AppCore.Entities
{
    public class PartListenResponse : PartListen
    {
        public string DataImage
        {
            get
            {
                return PathImage.GetDataFileAsync();
            }
        }
        public string DataAudio
        {
            get
            {
                return PathAudio.GetDataFileAsync();
            }
        }
        public List<QuestionRespone> Questions { get; set; }
    }
}
