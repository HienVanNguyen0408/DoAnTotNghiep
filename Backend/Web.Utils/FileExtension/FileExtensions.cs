using System;
using System.Collections.Generic;
using System.IO;
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
        public static void CreateFolder(string path) => Directory.CreateDirectory(path);
        public static byte[] GetDataFile(string path) => File.ReadAllBytes(path);
        public static bool CheckFolderExist(string path) => Directory.Exists(path);

        public static string GetFileNameByPathProduct(string path) => path.ReplaceText("product/","");
        public static string GetFileNameByPathBlog(string path) => path.ReplaceText("blog/","");
        public static string GetPathDirtoryCurrent() => Directory.GetCurrentDirectory();
        public static string GetPathProductLocal() => $"{Directory.GetCurrentDirectory()}\\LocalStorage\\Product";
        public static string GetPathBlogLocal() => $"{Directory.GetCurrentDirectory()}\\LocalStorage\\Blog";

    }
}
