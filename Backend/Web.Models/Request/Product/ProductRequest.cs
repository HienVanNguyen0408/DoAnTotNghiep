using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Request
{
    public class ProductRequest : Product
    {
        public List<FileInfo> files { get; set; }
        public List<Color> colors { get; set; }
    }
}
