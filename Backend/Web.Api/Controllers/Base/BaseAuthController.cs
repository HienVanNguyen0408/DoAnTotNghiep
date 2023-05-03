using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System;
using System.Threading.Tasks;
using Web.Api.Auth;
using Web.AppCore.Interfaces.Services;
using Web.Models.Settings;

namespace Web.Api.Controllers
{
    [ApiController]
    [Route("api/v1/[Controller]")]
    public abstract class BaseAuthController<T> : BaseController<T>
    {
        #region Declaration
        protected readonly AppSettings _appSettings;

        protected readonly IRoleAccessService _roleService;
        protected readonly IHttpContextAccessor _httpContext;
        protected readonly HttpRequest _httpRequest;

        #endregion

        #region Contructor
        protected BaseAuthController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _appSettings = GetRequiredService<IOptions<AppSettings>>().Value;
            _roleService = GetRequiredService<IRoleAccessService>();
            _httpContext = GetRequiredService<IHttpContextAccessor>();
        }
        #endregion

        public virtual string UserId => Request.Headers[HeaderKey.UserId];

        public virtual string AccessToken
        {
            get
            {
                var authorizationHeader = Request.Headers[HeaderKey.Authorization].ToString();
                var token = authorizationHeader.Substring("bearer".Length);
                return token;
            }
        }
    }
}
