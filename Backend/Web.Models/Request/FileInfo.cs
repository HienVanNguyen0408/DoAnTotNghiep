using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Request
{
    public class FileInfo
    {
        public byte[] data { get; set; }
        public string file_name { get; set; }
        public string cotent_type { get; set; }
        public string path { get; set; }
    }
}
