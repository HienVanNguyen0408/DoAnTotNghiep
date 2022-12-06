using Microsoft.Extensions.Caching.Distributed;
using System;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace Web.Caching
{
    public class RedisCahed : IRedisCached
    {
        #region Properties
        IDistributedCache _cached;
        #endregion

        #region Contructor
        public RedisCahed(IDistributedCache cached)
        {
            _cached = cached;
        }
        #endregion

        #region Methods
        /// <summary>
        /// Lấy dữ liệu từ cached
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key"></param>
        /// <returns></returns>
        public T Get<T>(string key)
        {
            T result = default(T);

            try
            {
                //Lấy giá trị lưu cached
                byte[] cachedBytes = _cached.Get(key);
                if(cachedBytes != null)
                {
                    string jsonText = Encoding.UTF8.GetString(cachedBytes);
                    result = JsonSerializer.Deserialize<T>(jsonText);
                }
            }
            catch (Exception ex)
            {

                throw(ex);
            }
            return result;
        }

        public async Task<T> GetAsync<T>(string key)
        {
            T result = default(T);

            try
            {
                //Lấy giá trị lưu cached
                byte[] cachedBytes = await _cached.GetAsync(key);
                if (cachedBytes != null)
                {
                    string jsonText = Encoding.UTF8.GetString(cachedBytes);
                    result = JsonSerializer.Deserialize<T>(jsonText);
                }
            }
            catch (Exception ex)
            {

                throw (ex);
            }
            return result;
        }

        /// <summary>
        /// Xóa cached 
        /// </summary>
        /// <param name="key"></param>
        public void Remove(string key)
        {
            try
            {
                _cached.Remove(key);
            }
            catch (Exception ex)
            {

                throw(ex);
            }
        }

        public async Task RemoveAsync(string key)
        {
            try
            {
                await _cached.RemoveAsync(key);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Lưu cached 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="absoluteExpiration"></param>
        /// <returns></returns>
        public bool Set<T>(string key, T value, double? absoluteExpiration = null)
        {
            bool result = false;
            try
            {
                //convert value thành json text 
                string jsonText = JsonSerializer.Serialize(value);
                byte[] cacheBytes = Encoding.UTF8.GetBytes(jsonText);
                if(absoluteExpiration  != null && absoluteExpiration.HasValue && absoluteExpiration.Value > 0)
                {
                    DistributedCacheEntryOptions options = new DistributedCacheEntryOptions()
                    {
                        AbsoluteExpirationRelativeToNow = TimeSpan.FromSeconds(absoluteExpiration.Value)
                    };
                    _cached.Set(key, cacheBytes,options);
                }
                else
                {
                    _cached.Set(key, cacheBytes);
                }

                //Không văng exception => lưu cached thành công
                result = true;
            }
            catch (Exception ex)
            {
                throw(ex);
            }
            return result;
        }

        public async Task<bool> SetAsync<T>(string key, T value, double? absoluteExpiration = null)
        {
            bool result = false;
            try
            {
                //convert value thành json text 
                string jsonText = JsonSerializer.Serialize(value);
                byte[] cacheBytes = Encoding.UTF8.GetBytes(jsonText);
                if (absoluteExpiration != null && absoluteExpiration.HasValue && absoluteExpiration.Value > 0)
                {
                    DistributedCacheEntryOptions options = new DistributedCacheEntryOptions()
                    {
                        AbsoluteExpirationRelativeToNow = TimeSpan.FromSeconds(absoluteExpiration.Value)
                    };
                    await _cached.SetAsync(key, cacheBytes, options);
                }
                else
                {
                    await _cached.SetAsync(key, cacheBytes);
                }

                //Không văng exception => lưu cached thành công
                result = true;
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return result;
        }
        #endregion
    }
}
