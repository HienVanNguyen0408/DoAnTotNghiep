using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Request.Download
{
    public class ImportRequest
    {
        public byte[] FileData { get; set; }
        public string FileName { get; set; }
    }
}
