using System;
using System.Collections.Generic;
using System.Linq;

namespace Web.AppCore.Entities
{
    public class QuestionRequest : ExamQuestion
    {
        public byte[] Image { get; set; }
        public byte[] Audio { get; set; }
        public string  ImageName { get; set; }
        public string AudioName { get; set; }
        public List<Option> Options { get; set; }
        public string OptionSelect
        {
            get
            {
                if (Options == null && Options.Count <= 0) return "";
                if(Options.Exists(x => x.Check))
                {
                    return Options.Where(x => x.Check).ToList().FirstOrDefault().TextOption;
                }
                return "";
            }
        }
    }
    public class RequestApi
    {
        public List<string> QuestionIds { get; set; }
    }
}
