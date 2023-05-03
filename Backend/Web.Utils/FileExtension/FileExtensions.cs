using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Web.Models.Enums;
using Web.Utils.RegexExtensions;

namespace Web.Utils
{
    public static class FileExtensions
    {
        public static string GetFileExtention(FileType fileType)
        {
            var extension = ".png";
            return extension;
        }

        public static void CreateFolder(string path) => Directory.CreateDirectory(path);

        public static byte[] GetDataFile(string path) => File.ReadAllBytes(path);

        public static bool CheckFolderExist(string path) => Directory.Exists(path);

        public static string GetFileNameByPathProduct(string path) => path.ReplaceText("product/", "");

        public static string GetFileNameByPathBlog(string path) => path.ReplaceText("blog/", "");

        public static string GetPathDirtoryCurrent() => Directory.GetCurrentDirectory();

        public static string GetPathProductLocalClient()
        {
            var path = $"{Directory.GetCurrentDirectory()}";
            var pathClient = path.RegexMatch("(\\S+DoAnTotNghiep)").GroupText(1);
            return $"{pathClient}\\Fontend\\LocalStorage\\Product";
        }

        public static string GetPathBlogLocalClient()
        {
            var path = $"{Directory.GetCurrentDirectory()}";
            var pathClient = path.RegexMatch("(\\S+DoAnTotNghiep)").GroupText(1);
            return $"{pathClient}\\Fontend\\LocalStorage\\Blog";
        }

        public static string GetPathProductLocal() => $"{Directory.GetCurrentDirectory()}\\LocalStorage\\Product";

        public static string GetPathBlogLocal() => $"{Directory.GetCurrentDirectory()}\\LocalStorage\\Blog";

    }
}
