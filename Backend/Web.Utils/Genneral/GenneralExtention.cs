using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Utils
{
    public static class GenneralExtention
    {
        #region Where
        public static IEnumerable<TSource> WhereExt<TSource>(this ICollection<TSource> sources, Func<TSource, bool> predicate) => sources?.Where(n => predicate(n)) ?? null;
        #endregion

        #region Select
        public static IEnumerable<TResult> SelectExt<TSource, TResult>(this IEnumerable<TSource> sources, Func<TSource, TResult> selector) => sources?.Select(n => selector(n)) ?? null;
        #endregion


        #region Count
        public static int CountExt<TSource>(this IEnumerable<TSource> sources, Func<TSource, bool> predicate) => sources?.Count(n => predicate(n)) ?? 0;
        public static int CountExt<TSource>(this IEnumerable<TSource> sources) => sources?.Count() ?? 0;
        #endregion

        #region Any
        public static bool AnyExt<TSource>(this IEnumerable<TSource> sources) => sources?.Any() ?? false;
        public static bool AnyExt<TSource>(this IEnumerable<TSource> sources, Func<TSource, bool> predicate) => sources?.Any(n => predicate(n)) ?? false;
        #endregion


        #region Sum 
        public static float SumExt<TSource>(this IEnumerable<TSource> sources, Func<TSource, float> selector) => sources?.Sum(n => selector(n)) ?? 0;
        public static int SumExt<TSource>(this IEnumerable<TSource> sources, Func<TSource, int> selector) => sources?.Sum(n => selector(n)) ?? 0;
        public static decimal SumExt(this IEnumerable<decimal> sources) => sources?.Sum() ?? 0;
        public static double SumExt(this IEnumerable<double> sources) => sources?.Sum() ?? 0;
        public static int SumExt(this IEnumerable<int> sources) => sources?.Sum() ?? 0;
        public static float SumExt(this IEnumerable<float> sources) => sources?.Sum() ?? 0;
        public static long SumExt(this IEnumerable<long> sources) => sources?.Sum() ?? 0;
        #endregion

        #region ThenBy
        public static IOrderedEnumerable<TSource> ThenByExt<TSource, TKey>(this IOrderedEnumerable<TSource> sources, Func<TSource, TKey> keySelector) => sources?.ThenBy(n => keySelector(n)) ?? default;
        #endregion
    }
}
