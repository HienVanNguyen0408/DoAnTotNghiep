using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Entities
{
    public static class QueryExtention
    {
        /// <summary>
        /// Custom OrderBy
        /// Created By NVHIEN
        /// </summary>
        /// <typeparam name="T">Đối tượng</typeparam>
        /// <param name="source">Danh sách đối tượng</param>
        /// <param name="property">Tên trường</param>
        /// <returns></returns>
        public static IOrderedQueryable<T> OrderByCustom<T>(this IQueryable<T> source,string property)
        {
            return ApplyOrder<T>(source, property, "OrderBy");
        }

        /// <summary>
        /// Custom OrderByDescending
        /// Created By NVHIEN
        /// </summary>
        /// <typeparam name="T">Đối tượng</typeparam>
        /// <param name="source">Danh sách đối tượng</param>
        /// <param name="property">Tên trường</param>
        /// <returns></returns>
        public static IOrderedQueryable<T> OrderByDescendingCustom<T>(this IQueryable<T> source,string property)
        {
            return ApplyOrder<T>(source, property, "OrderByDescending");
        }

        /// <summary>
        /// Custom ThenBy
        /// Created By NVHIEN
        /// </summary>
        /// <typeparam name="T">Đối tượng</typeparam>
        /// <param name="source">Danh sách đối tượng</param>
        /// <param name="property">Tên trường</param>
        /// <returns></returns>
        public static IOrderedQueryable<T> ThenByCustom<T>(this IOrderedQueryable<T> source, string property)
        {
            return ApplyOrder<T>(source, property, "ThenBy");
        }

        /// <summary>
        /// Custom then By Descending
        /// Created By NVHIEN
        /// </summary>
        /// <typeparam name="T">Đối tượng</typeparam>
        /// <param name="source">Danh sách đối tượng</param>
        /// <param name="property">Tên trường</param>
        /// <returns></returns>
        public static IOrderedQueryable<T> ThenByDescendingCustom<T>(this IOrderedQueryable<T> source,string property)
        {
            return ApplyOrder<T>(source, property, "ThenByDescending");
        }

        /// <summary>
        /// Custom 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="source"></param>
        /// <param name="property"></param>
        /// <param name="methodName"></param>
        /// <returns></returns>
        static IOrderedQueryable<T> ApplyOrder<T>(IQueryable<T> source,string property,string methodName)
        {
            string[] props = property.Split('.');
            Type type = typeof(T);
            ParameterExpression arg = Expression.Parameter(type, "x");
            Expression expr = arg;
            foreach (string prop in props)
            {
                // use reflection (not ComponentModel) to mirror LINQ
                PropertyInfo pi = type.GetProperty(prop);
                expr = Expression.Property(expr, pi);
                type = pi.PropertyType;
            }
            Type delegateType = typeof(Func<,>).MakeGenericType(typeof(T), type);
            LambdaExpression lambda = Expression.Lambda(delegateType, expr, arg);

            object result = typeof(Queryable).GetMethods().Single(
                    method => method.Name == methodName
                            && method.IsGenericMethodDefinition
                            && method.GetGenericArguments().Length == 2
                            && method.GetParameters().Length == 2)
                    .MakeGenericMethod(typeof(T), type)
                    .Invoke(null, new object[] { source, lambda });
            return (IOrderedQueryable<T>)result;
        }

        /// <summary>
        /// Custom filter
        /// </summary>
        /// <typeparam name="T">Đối tượng</typeparam>
        /// <param name="source">List đối tượng cần filter</param>
        /// <param name="columnName">Tên field</param>
        /// <param name="compValue">Giá trị của field</param>
        /// <returns></returns>
        public static List<T> Filter<T>(this List<T> source, string columnName, string compValue)
        {
            ParameterExpression parameter = Expression.Parameter(typeof(T), "x");
            Expression property = Expression.Property(parameter, columnName);
            Expression constant = Expression.Constant(compValue);
            Expression equality = Expression.Equal(property, constant);
            Expression<Func<T, bool>> predicate =
                Expression.Lambda<Func<T, bool>>(equality, parameter);

            Func<T, bool> compiled = predicate.Compile();
            return source.Where(compiled).ToList();
        }
        /// <summary>
        /// Select
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="source"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public static List<T> PickRandom<T>(this List<T> source, int count)
        {
            return source.Shuffle().Take(count).ToList();
        }

        /// <summary>
        /// Sắp xếp
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="source"></param>
        /// <returns></returns>
        public static List<T> Shuffle<T>(this List<T> source)
        {
            return source.OrderBy(x => Guid.NewGuid()).ToList();
        }
    }
}
