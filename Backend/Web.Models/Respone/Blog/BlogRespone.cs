using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Respone
{
    public class BlogRespone : Blog
    {
        public List<string> images { get; set; }
    }
}
