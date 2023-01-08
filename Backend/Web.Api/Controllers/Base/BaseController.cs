using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;
using Web.Api.Auth;
using Microsoft.Extensions.Primitives;
using System.Linq;
using System.Net;

namespace Web.Api.Controllers
{
    public class BaseController<T> : ControllerBase
    {
        #region Declaration
        protected IHttpContextAccessor _httpContextAccessor;
        protected readonly IServiceProvider _serviceProvider;
        protected readonly ILogger<T> _logger;

        public const string NullIPAddress = "::1";
        #endregion

        #region Contructor
        public BaseController(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
            _logger = _serviceProvider.GetService<ILogger<T>>();
            _httpContextAccessor = _serviceProvider.GetService<IHttpContextAccessor>();
        }
        #endregion

        public virtual S GetService<S>()
        {
            return _serviceProvider.GetService<S>();
        }

        public virtual S GetRequiredService<S>()
        {
            return _serviceProvider.GetRequiredService<S>();
        }

        /// <summary>
        /// Lấy thông tin user-agent ở header
        /// </summary>
        public virtual string UserAgent => Request.Headers[HeaderKey.UserAgent].ToString();

        public virtual string ClientId => Request.Headers[HeaderKey.ClientId].ToString();

        //[HttpGet("ip-current")]
        ///// <summary>
        ///// Lấy địa chỉ IP Htpp Request
        ///// </summary>
        ///// <returns></returns>
        //public virtual string GetCurrentIPAddress()
        //{
        //    try
        //    {
        //        var result = string.Empty;
        //        if (!IsRequestAvailable()) return result;

        //        if (_httpContextAccessor.HttpContext.Request.Headers != null)
        //        {
        //            var forwaredHeader = _httpContextAccessor.HttpContext.Request.Headers[HeaderKey.ForwardedHeader];
        //            // Lấy giá trị key trên
        //            if (!StringValues.IsNullOrEmpty(forwaredHeader)) { result = forwaredHeader.FirstOrDefault(); }
        //        }

        //        if (string.IsNullOrEmpty(result) && _httpContextAccessor.HttpContext.Connection.RemoteIpAddress != null)
        //        {
        //            result = _httpContextAccessor.HttpContext.Connection.RemoteIpAddress.ToString();
        //        }

        //        if (IPAddress.TryParse(result ?? string.Empty, out IPAddress ip))
        //        {
        //            result = ip.ToString();
        //        }
        //        else if (!string.IsNullOrEmpty(result))
        //        {
        //            result = result.Split(":").FirstOrDefault();
        //        }

        //        if (result != null && result.Equals(NullIPAddress, StringComparison.OrdinalIgnoreCase))
        //        {
        //            result = "127.0.0.1";
        //        }

        //        //Tách dấu phẩu lấy IP đầu tiên nếu có nhiều IP
        //        if (result.Contains(","))
        //        {
        //            result = result.Split(",").FirstOrDefault();
        //        }
        //        return result;
        //    }
        //    catch (Exception ex)
        //    {
        //        _logger.LogError(ex.Message);
        //    }

        //    return string.Empty;
        //}

        /// <summary>
        /// Kiểm tra request có hợp lệ hay không
        /// </summary>
        /// <returns>
        /// true: Request hợp lệ
        /// false : Request không hợp lệ
        /// </returns>
        protected virtual bool IsRequestAvailable()
        {
            if (_httpContextAccessor == null || _httpContextAccessor.HttpContext == null) return false;
            try
            {
                if(_httpContextAccessor.HttpContext.Request == null) return false;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return false;
            }
            return true;    
        }

        protected void WrapFuncAuditLog(string functionCall, Action callback)
        {
            try
            {
                callback.Invoke();
            }
            catch (Exception ex)
            {
                _logger?.LogError($"{nameof(T)}::Lỗi hàm::{functionCall}::Exception::{ex.Message}");
            }
        }

        protected virtual ObjectResult GetPermissionError()
        {
            return Unauthorized(ErrorCode.NotPermission);
        }

    }
}
