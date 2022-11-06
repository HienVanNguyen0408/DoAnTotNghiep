using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Request.Download
{
    public class ExcelRequest
    {
        public byte[] FileData { get; set; }
        public string FileName { get; set; }
        public List<string> CustomerIds { get; set; }
    }
}
