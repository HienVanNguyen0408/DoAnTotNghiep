using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Ultility
{
    public static class DQLibrary
    {
        public static string GetDataFileAsync(this string pathFile)
        {
            try
            {
                // xóa file trc đó trên storage
                if (!string.IsNullOrEmpty(pathFile) && File.Exists(pathFile))
                {
                    var byteFile = File.ReadAllBytes(pathFile);
                    if (byteFile == null)
                    {
                        return "";
                    }
                    return Convert.ToBase64String(byteFile);
                }
                return "";
            }
            catch (Exception)
            {
                return "";
            }
        }
        public static bool CompareResult(this string result, string option)
        {
            if (string.IsNullOrEmpty(result) || string.IsNullOrEmpty(option)) return false;
            if (result.Trim() == option.Trim()) return true;
            return false;
        }
    }
}
