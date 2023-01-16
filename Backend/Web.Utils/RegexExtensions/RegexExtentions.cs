using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Web.Utils.RegexExtensions
{
    public static class RegexExtentions
    {
        public static Match RegexMatch(this string content, string pattern)
        {
            if (content.IsNullOrEmptyOrWhiteSpace()) return null;
            return Regex.Match(content, pattern);
        }
        public static string GroupText(this Match match, int index)
        {
            if (match == null) return string.Empty;
            var groups = match.Groups;
            if (groups == null || groups.Count <= 0 || groups[index] == null || string.IsNullOrEmpty(groups[index].Value)) return string.Empty;
            return groups[index].Value;
        }
    }
}
