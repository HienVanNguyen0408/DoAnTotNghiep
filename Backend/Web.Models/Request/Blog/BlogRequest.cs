using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Request
{
    public class BlogRequest : Blog
    {
        public byte[] data { get; set; }
        public string file_name { get; set; }
        public string content_type { get; set; }
    }

}
