using Microsoft.Extensions.DependencyInjection;
using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Services;
using Web.Caching;
using Web.Models.LibraryClass;
using Web.Models.Settings;

namespace Web.AppCore.Services
{
    public class BaseDomainService<T> : BaseClass<T>, IBaseDomainService
    {
        #region Declaration
        protected readonly PostgresSettings _postgresSettings;
        protected readonly AppSettings _appSettings;
        protected readonly IRedisCached _cached;
        #endregion

        #region Contructor
        public BaseDomainService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _postgresSettings = new PostgresSettings();
            _cached = serviceProvider.GetRequiredService<IRedisCached>();
        }
        #endregion

        #region Methods
        protected string GetKeyCached(int skip, int take) => $"GetPaggingCustomer_{take}_{skip}";
        #endregion
    }
}
