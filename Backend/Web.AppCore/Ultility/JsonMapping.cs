using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Ultility
{
    public static class JsonMapping
    {
        /// <summary>
        /// Convert data 
        /// </summary>
        /// <typeparam name="T">Kiểu dữ liệu tra về</typeparam>
        /// <param name="data">Dữ liệu trã về</param>
        /// <param name="data2">Dữ liệu cần convert</param>
        /// NVHIEN Created
        /// <returns></returns>
        public static T? ConvertData<T>(this T data, object data2)
        {
            return JsonConvert.DeserializeObject<T>(JsonConvert.SerializeObject(data2));
        }
    }
}
