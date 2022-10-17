using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Web.Utils
{

    public static class JsonUtils
    {
        private static readonly string TAG = "JsonUtility";

        public static readonly DateFormatHandling JsonDateFormatHandling = DateFormatHandling.IsoDateFormat;
        public static readonly DateTimeZoneHandling JsonDateTimeZoneHandling = DateTimeZoneHandling.Local;
        public static readonly string JsonDateFormatString = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.fffFFFFK";
        public static readonly NullValueHandling JsonNullValueHandling = NullValueHandling.Ignore;
        public static readonly ReferenceLoopHandling JsonReferenceLoopHandling = ReferenceLoopHandling.Ignore;

        /// <summary>
        /// Cấu hình định dạng của NewtionJson
        /// </summary>
        private static JsonSerializerSettings _jsonSerializerSetting = null;

        /// <summary>
        /// Hàm này dùng để gán lại định dạng dữ liệu khi convert từ Json sang Object
        /// </summary>
        /// <returns></returns>
        public static JsonSerializerSettings GetJsonSerializerSettings()
        {
            if (_jsonSerializerSetting == null)
            {
                _jsonSerializerSetting = new JsonSerializerSettings()
                {
                    DateFormatHandling = JsonDateFormatHandling,
                    DateTimeZoneHandling = JsonDateTimeZoneHandling,
                    DateFormatString = JsonDateFormatString,
                    NullValueHandling = JsonNullValueHandling,
                    ReferenceLoopHandling = JsonReferenceLoopHandling
                };
            }
            return _jsonSerializerSetting;
        }

        /// <summary>
        /// Convert Object thành chuỗi Json
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="settings"></param>
        /// <returns></returns>
        public static string Serialize(object obj, JsonSerializerSettings settings = null)
        {
            try
            {
                if (settings == null) { settings = GetJsonSerializerSettings(); }
                return JsonConvert.SerializeObject(obj, settings);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Convert chuỗi Json thành Object
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="json"></param>
        /// <param name="settings"></param>
        /// <returns></returns>
        public static T Deserialize<T>(this string json, JsonSerializerSettings settings = null)
        {
            try
            {
                if (settings == null) { settings = GetJsonSerializerSettings(); }
                return JsonConvert.DeserializeObject<T>(json, settings);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Convert chuỗi Json thành Object
        /// </summary>
        /// <param name="json"></param>
        /// <param name="type"></param>
        /// <param name="settings"></param>
        /// <returns></returns>
        public static object Deserialize(string json, Type type, JsonSerializerSettings settings = null)
        {
            try
            {
                if (settings == null) { settings = GetJsonSerializerSettings(); }
                return JsonConvert.DeserializeObject(json, type, settings);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}


