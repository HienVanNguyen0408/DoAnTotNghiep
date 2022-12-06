using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Respone
{
    public class BlogRespone : Blog
    {
        /// <summary>
        /// Data base64
        /// </summary>
        public List<string> files { get; set; }
    }
}
