using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Web.Caching
{
    public interface IRedisCached
    {
        /// <summary>
        /// Thêm đối tượng cần lưu vào cached
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key">Key lưu cached</param>
        /// <param name="value">Giá trị lưu</param>
        /// <param name="absoluteExpiration">Thời gian lưu cached: tính bằng giây</param>
        /// <returns></returns>
        bool Set<T>(string key, T value, double? absoluteExpiration = null);

        /// <summary>
        /// Lấy giá trị lưu từ cached theo key
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key">key lưu cached</param>
        /// <returns></returns>
        T Get<T>(string key);

        /// <summary>
        /// Thêm đối tượng cần lưu vào cached
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key">Key lưu cached</param>
        /// <param name="value">Giá trị lưu</param>
        /// <param name="absoluteExpiration">Thời gian lưu cached: tính bằng giây</param>
        /// <returns></returns>
        Task<bool> SetAsync<T>(string key, T value, double? absoluteExpiration = null);


        /// <summary>
        /// Lấy giá trị lưu từ cached theo key
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key">key lưu cached</param>
        /// <returns></returns>
        Task<T> GetAsync<T>(string key);

        void Remove(string key);
    }
}
