
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Web.Utils;

namespace Web.AppCore.Services
{
    public static class StandardHttpClient
    {
        #region "Variable"
        private static readonly string TAG = "StandardHttpClient";

        /// <summary>
        /// Thời gian hết hạn gọi dịch vụ
        /// </summary>
        private const int TIMEOUT = 120;
        #endregion

        #region "Private Method"
        /// <summary>
        /// Hàm này dùng để bỏ qua tất cả SSL
        /// </summary>
        /// <param name="cookieContainer"></param>
        /// <returns></returns>
        private static HttpMessageHandler GetHttpMessageHandler(CookieContainer cookieContainer)
        {
            var httpMessageHandler = new HttpClientHandler()
            {
                AllowAutoRedirect = false,
                CookieContainer = cookieContainer,
                AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate
            };
            httpMessageHandler.ClientCertificateOptions = ClientCertificateOption.Manual;
            httpMessageHandler.ServerCertificateCustomValidationCallback += (sender, certificate, chain, ssl) => true;
            return httpMessageHandler;
        }

        /// <summary>
        /// Cập nhật header cho HttpClient
        /// </summary>
        /// <param name="httpClient"></param>
        /// <param name="headers"></param>
        private static void SetHeaderHttpClient(HttpClient httpClient, Dictionary<string, string> headers)
        {
            try
            {
                if (headers == null || headers.Count <= 0) return;
                httpClient.DefaultRequestHeaders.Accept.Clear();
                foreach (var header in headers) { httpClient.DefaultRequestHeaders.TryAddWithoutValidation(header.Key, header.Value); }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Cập nhật thời gian timeout khi gọi dịch vụ
        /// </summary>
        /// <param name="httpClient"></param>
        /// <param name="timeout"></param>
        private static void SetTimeoutHttpClient(HttpClient httpClient, int timeout)
        {
            try
            {
                httpClient.Timeout = TimeSpan.FromSeconds(timeout);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Chuyển đổi tham số từ Dictionary thành Query của Url
        /// </summary>
        /// <param name="paramQueries"></param>
        /// <returns></returns>
        private static async Task<string> GetQueryFromParamsAsync(Dictionary<string, string> paramQueries)
        {
            try
            {
                if (paramQueries == null || paramQueries.Count <= 0) return string.Empty;
                using var formUrlEncodedContent = new FormUrlEncodedContent(paramQueries);
                return await formUrlEncodedContent.ReadAsStringAsync();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Tạo Uri từ Url và tham số Query
        /// </summary>
        /// <param name="url"></param>
        /// <param name="paramQueries"></param>
        /// <returns></returns>
        private static async Task<Uri> GetUriAsync(string url, Dictionary<string, string> paramQueries = null)
        {
            //Chuyển đổi tham số dạng Dictionary thành Query trên Url
            var queries = await GetQueryFromParamsAsync(paramQueries);
            //Uri
            return new Uri($"{url}{(string.IsNullOrEmpty(queries) ? string.Empty : $"?{queries}")}");
        }
        #endregion

        #region "Public Method"
        /// <summary>
        /// Hàm này dùng để gửi dữ liệu lên Server dạng Json
        /// </summary>
        /// <param name="url"></param>
        /// <param name="httpMethod"></param>
        /// <param name="data"></param>
        /// <param name="headers"></param>
        /// <param name="timeOut"></param>
        /// <returns></returns>
        public static async Task<HttpClientResponse> DoPostOrPutJsonAsync(string url, HttpMethod httpMethod, object data, Dictionary<string, string> headers = null, Dictionary<string, string> paramQueries = null, int timeOut = TIMEOUT)
        {
            return await DoPostOrPutAsync(url, httpMethod, new StringContent(JsonUtils.Serialize(data) ?? string.Empty, Encoding.UTF8, "application/json"), headers, paramQueries, timeOut);
        }

        /// <summary>
        /// Hàm này gửi dữ liệu lên Server dạng FormUrlEncoded
        /// </summary>
        /// <param name="url"></param>
        /// <param name="httpMethod"></param>
        /// <param name="data"></param>
        /// <param name="headers"></param>
        /// <param name="timeOut"></param>
        /// <returns></returns>
        public static async Task<HttpClientResponse> DoPostOrPutEncodedAsync(string url, HttpMethod httpMethod, Dictionary<string, string> data, Dictionary<string, string> headers = null, Dictionary<string, string> paramQueries = null, int timeOut = TIMEOUT)
        {
            return await DoPostOrPutAsync(url, httpMethod, new FormUrlEncodedContent(data), headers, paramQueries, timeOut);
        }

        /// <summary>
        /// Hàm này dùng để gửi dữ liệu lên Server
        /// </summary>
        /// <param name="url"></param>
        /// <param name="httpMethod"></param>
        /// <param name="httpContent"></param>
        /// <param name="headers"></param>
        /// <param name="timeOut"></param>
        /// <returns></returns>
        public static async Task<HttpClientResponse> DoPostOrPutAsync(string url, HttpMethod httpMethod, HttpContent httpContent, Dictionary<string, string> headers = null, Dictionary<string, string> paramQueries = null, int timeOut = TIMEOUT)
        {
            var result = new HttpClientResponse();

            try
            {
                var cookieContainer = new CookieContainer();
                using var client = new HttpClient(GetHttpMessageHandler(cookieContainer));

                //Uri
                var uri = await GetUriAsync(url, paramQueries);

                //Thiết lập header cho request
                SetHeaderHttpClient(client, headers);

                //Thiết lập TimeOut cho dịch vụ
                SetTimeoutHttpClient(client, timeOut);

                //Gửi yêu cầu tới máy chủ
                using var httpResponseMessage = await client.SendAsync(new HttpRequestMessage { RequestUri = uri, Method = httpMethod, Content = httpContent });

                //Đọc kết quả và cookie trả về từ Server
                if (httpResponseMessage.IsSuccessStatusCode)
                {
                    result.ByteResult = await httpResponseMessage.Content.ReadAsByteArrayAsync();
                }
                else
                {

                }

                //Cập nhật Cookies
                //Cập nhật Cookies
                result.IsSuccessStatusCode = httpResponseMessage.IsSuccessStatusCode;
                result.StatusCode = httpResponseMessage.StatusCode;
                result.ReasonPhrase = httpResponseMessage.ReasonPhrase;
                result.Cookies = cookieContainer.GetCookies(uri);
                result.Headers = httpResponseMessage.Headers;
            }
            catch (Exception ex)
            {
                result.Exception = ex;
            }

            return result;
        }

        /// <summary>
        /// Hàm dùng để lấy dữ liệu từ Server
        /// </summary>
        /// <param name="url"></param>
        /// <param name="paramQueries"></param>
        /// <param name="headers"></param>
        /// <param name="timeOut"></param>
        /// <returns></returns>
        public static async Task<HttpClientResponse> GetAsync(string url, Dictionary<string, string> paramQueries = null, Dictionary<string, string> headers = null, int timeOut = TIMEOUT)
        {
            var result = new HttpClientResponse();

            try
            {
                var cookieContainer = new CookieContainer();
                using var client = new HttpClient(GetHttpMessageHandler(cookieContainer));

                //Uri
                var uri = await GetUriAsync(url, paramQueries);

                //Thiết lập header cho request
                SetHeaderHttpClient(client, headers);

                //Thiết lập TimeOut cho dịch vụ
                SetTimeoutHttpClient(client, timeOut);

                //Gửi yêu cầu tới máy chủ
                using var httpResponseMessage = await client.GetAsync(uri);

                //Đọc kết quả và cookie trả về từ Server
                if (httpResponseMessage.IsSuccessStatusCode)
                {
                    result.ByteResult = await httpResponseMessage.Content.ReadAsByteArrayAsync();
                }
                else
                {
                }

                //Cập nhật Cookies
                result.IsSuccessStatusCode = httpResponseMessage.IsSuccessStatusCode;
                result.StatusCode = httpResponseMessage.StatusCode;
                result.ReasonPhrase = httpResponseMessage.ReasonPhrase;
                result.Cookies = cookieContainer.GetCookies(uri);
                result.Headers = httpResponseMessage.Headers;
            }
            catch (Exception ex)
            {
                result.Exception = ex;
            }

            return result;
        }

        /// <summary>
        /// Hàm dùng để xóa dữ liệu từ Server
        /// </summary>
        /// <param name="url"></param>
        /// <param name="paramDeletes"></param>
        /// <param name="headers"></param>
        /// <param name="timeOut"></param>
        /// <returns></returns>
        public static async Task<HttpClientResponse> DeleteAsync(string url, Dictionary<string, string> paramDeletes = null, Dictionary<string, string> headers = null, int timeOut = TIMEOUT)
        {
            var result = new HttpClientResponse();

            try
            {
                var cookieContainer = new CookieContainer();
                using var client = new HttpClient(GetHttpMessageHandler(cookieContainer));

                //Uri
                var uri = await GetUriAsync(url, paramDeletes);

                //Thiết lập header cho request
                SetHeaderHttpClient(client, headers);

                //Thiết lập TimeOut cho dịch vụ
                SetTimeoutHttpClient(client, timeOut);

                //Gửi yêu cầu tới máy chủ
                using var httpResponseMessage = await client.DeleteAsync(uri);

                //Đọc kết quả và cookie trả về từ Server
                if (httpResponseMessage.IsSuccessStatusCode)
                {
                    result.ByteResult = await httpResponseMessage.Content.ReadAsByteArrayAsync();
                }
                else
                {
                }

                //Cập nhật Cookies
                //Cập nhật Cookies
                result.IsSuccessStatusCode = httpResponseMessage.IsSuccessStatusCode;
                result.StatusCode = httpResponseMessage.StatusCode;
                result.ReasonPhrase = httpResponseMessage.ReasonPhrase;
                result.Cookies = cookieContainer.GetCookies(uri);
                result.Headers = httpResponseMessage.Headers;
            }
            catch (Exception ex)
            {
                result.Exception = ex;
            }

            return result;
        }
        #endregion
    }
}
