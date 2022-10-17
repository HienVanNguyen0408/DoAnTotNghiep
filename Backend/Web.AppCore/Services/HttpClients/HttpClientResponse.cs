using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
namespace Web.AppCore.Services
{
    public class HttpClientResponse
    {
        private const string TAG = "HttpClientResponse";

        public bool IsSuccessStatusCode { get; set; }
        public string ReasonPhrase { get; set; }
        public HttpStatusCode StatusCode { get; set; }

        /// <summary>
        /// Gọi dịch vụ thành công hay không?
        /// </summary>
        public bool Success => Exception == null;

        /// <summary>
        /// Lấy các thông tin của header được trả về
        /// </summary>
        public HttpResponseHeaders Headers { get; set; }

        /// <summary>
        /// Cookie được trả về từ Server
        /// </summary>
        public CookieCollection Cookies { get; set; }

        /// <summary>
        /// Nội dung trả về từ Server
        /// </summary>
        public byte[] ByteResult { get; set; }

        /// <summary>
        /// Nội dung trả về từ Server
        /// </summary>
        public string ContentResult => UTF8Encoding.UTF8.GetString(ByteResult);

        /// <summary>
        /// Lỗi xảy tra trong quá trình gọi dịch vụ lên Server
        /// </summary>
        public Exception Exception { get; set; }

        /// <summary>
        /// kiểm tra xem có dữ liệu trả về không
        /// </summary>
        /// <returns></returns>
        public bool IsNullOrEmpty() => ByteResult == null || ByteResult.Length <= 0;

        /// <summary>
        /// Lấy giá trị của Cookie
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public string GetCookie(string key)
        {
            try
            {
                return Cookies[key]?.Value ?? string.Empty;
            }
            catch (Exception ex)
            {
                return String.Empty;
            }
        }

        public string GetCookieText()
        {

            var list = new List<string>();

            try
            {
                if (Cookies != null && Cookies.Count > 0)
                {

                    foreach (Cookie cookie in Cookies)
                    {
                        list.Add($"{cookie.Name}={cookie.Value}");
                    }
                }
            }
            catch (Exception ex)
            {

            }

            return string.Join(";", list);
        }

        public Dictionary<string, string> GetCookieHeaders()
        {
            var result = new Dictionary<string, string>();
            var cookieText = GetCookieText();
            if (!string.IsNullOrEmpty(cookieText))
            {
                result.Add("Cookie", cookieText);
            }
            return result;
        }
    }
}
