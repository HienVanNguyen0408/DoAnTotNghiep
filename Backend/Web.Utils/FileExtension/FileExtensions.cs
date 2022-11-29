using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Enums;

namespace Web.Utils
{
    public static class FileExtensions
    {
        public static string GetFileExtention(FileType fileType)
        {
            var extension = string.Empty;
            switch (fileType)
            {
                case FileType.Image:
                    extension = ".png";
                    break;
                default:
                    extension = ".png";
                    break;
            }
            return extension;
        }

    }
}
