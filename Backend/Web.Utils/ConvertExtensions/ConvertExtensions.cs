using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Utils
{
    public static class ConvertExtensions
    {
        public static byte[] ConvertFromBase64(string base64String)
        {
            if (base64String.IsNullOrEmptyOrWhiteSpace()) return null;
            return Convert.FromBase64String(FormatStandardBase64(base64String));
        }

        public static string FormatStandardBase64(string base64String) => base64String
                                                                        .ReplaceText("data:image/jpeg;base64,", "")
                                                                        .ReplaceText("data:image/png;base64,", "");
    }
}
