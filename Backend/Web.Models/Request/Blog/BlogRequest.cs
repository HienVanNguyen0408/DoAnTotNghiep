using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Request
{
    public class BlogRequest : Blog
    {
        public List<FileInfo> files { get; set; }
    }

}
