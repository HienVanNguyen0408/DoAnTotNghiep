using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Utils
{
    public static class StringExtension
    {
        public static bool IsNullOrEmptyOrWhiteSpace(this string value) => string.IsNullOrEmpty(value) || string.IsNullOrWhiteSpace(value);
        public static string TrimText(this string value) => value?.Trim() ?? string.Empty;

        /// <summary>
        /// Compare Two Text
        /// </summary>
        /// <param name="textOne">text one</param>
        /// <param name="textTwo">text true</param>
        /// <returns></returns>
        public static bool EqualText(this string textOne, string textTwo) => textOne.Equals(textTwo, StringComparison.OrdinalIgnoreCase);

        public static string ReplaceText(this string value, string oldText, string textReplace, StringComparison comparison = StringComparison.OrdinalIgnoreCase)
        {
            if (value.IsNullOrEmptyOrWhiteSpace() || oldText.IsNullOrEmptyOrWhiteSpace()) return value ?? string.Empty;
            return value?.Replace(oldText, textReplace, comparison);
        }

        public static bool ContainsText(this string text, string value) =>
            (string.IsNullOrEmpty(text) && string.IsNullOrEmpty(value))
            || (!text.IsNullOrEmptyOrWhiteSpace() && text.Contains(value, StringComparison.OrdinalIgnoreCase));
    }
}
