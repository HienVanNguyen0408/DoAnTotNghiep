using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Moq;
using NUnit.Framework;
using PostgresDBData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Api.Controllers;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Services;
using Web.Caching;
using Web.Models.Settings;
using Web.Test.Services;

namespace Web.Test.Controllers
{
    public class BaseControllerTest<TController> where TController : class
    {
        protected BaseAuthController<TController> _targetMock;
        protected Mock<AppSettings> _appSettings;
        protected Mock<IServiceProvider> _serviceProvider;

        protected Mock<BaseControllerTest<TController>> _baseAuth;
        protected Mock<BaseServiceTest<TController>> _targeMock;
        protected Mock<ILogger<TController>> _logger;

        protected Mock<IRoleAccessService> _roleService;
        protected Mock<IHttpContextAccessor> _httpContext;
        protected Mock<HttpRequest> _httpRequest;


        [SetUp]
        public virtual void SetUp()
        {
            _baseAuth = new Mock<BaseControllerTest<TController>>();
            _roleService = new Mock<IRoleAccessService>();
            _httpContext = new Mock<IHttpContextAccessor>();
            _httpRequest = new Mock<HttpRequest>();

            _logger = new Mock<ILogger<TController>>();
            _serviceProvider = new Mock<IServiceProvider>();


            // Đăng ký dịch vụ IRedisCached với mock object
            _serviceProvider.Setup(x => x.GetService(typeof(IRoleAccessService))).Returns(_roleService.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IHttpContextAccessor))).Returns(_httpContext.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(HttpRequest))).Returns(_httpRequest.Object);

            _serviceProvider.Setup(x => x.GetService(typeof(ILogger<TController>)))
                .Returns(_logger.Object);

            _targetMock = new BaseAuthController<TController>(_serviceProvider.Object);
        }
    }
}
