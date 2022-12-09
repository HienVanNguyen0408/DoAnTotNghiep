using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;
using Web.Models.Request;

namespace Web.Models.Respone
{
    public class BlogRespone : Blog
    {
        /// <summary>
        /// Data base64
        /// </summary>
        public List<FileInfo> files { get; set; }
    }
}
