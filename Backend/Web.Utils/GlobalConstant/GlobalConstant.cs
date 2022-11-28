using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Utils
{
    public static class GlobalConstant
    {
        public static string GetFullPathTemplate(string folderName, string key) => $"{folderName}/{key}";
    }
}
