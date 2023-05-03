using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Moq;
using NUnit.Framework;
using PostgresDBData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Services;
using Web.Caching;
using Web.Models.Settings;

namespace Web.Test.Services
{
    public class BaseServiceTest<TService> where TService : class
    {
        protected PostgresSettings _postgresSettings;
        protected AppSettings _appSettings;
        protected IMock<IRedisCached> _redisCached;
        protected DbFunctions _dbFunctions;
        protected Mock<IServiceProvider> _serviceProvider;
        protected Mock<BaseDomainService<TService>> _domainService;
        protected Mock<BaseServiceTest<TService>> _targeMock;
        protected Mock<ILogger<TService>> _logger;

        [SetUp]
        public virtual void SetUp()
        {
            _domainService = new Mock<BaseDomainService<TService>>();
            _redisCached = new Mock<IRedisCached>();
            _logger = new Mock<ILogger<TService>>();
            _serviceProvider = new Mock<IServiceProvider>();
            // Đăng ký dịch vụ IRedisCached với mock object
            _serviceProvider.Setup(x => x.GetService(typeof(IRedisCached))).Returns(_redisCached.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(ILogger<TService>)))
                .Returns(_logger.Object);


            var baseService = new BaseDomainService<TService>(_serviceProvider.Object);
        }
    }
}
