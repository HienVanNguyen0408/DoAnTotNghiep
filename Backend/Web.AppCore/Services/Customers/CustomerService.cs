using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.Caching;
using Web.Models.Entities;
using Web.Models.Settings;
using Web.Utils;

namespace Web.AppCore.Services
{
    public class CustomerService : BaseDomainService<CustomerService>, ICustomerService
    {
        #region Declaration
        private readonly ICustomerUoW _customerUoW;
        private readonly IRedisCached _cached;
        private readonly AppSettings _appSettings;
        #endregion
        #region Contructor
        public CustomerService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _customerUoW = serviceProvider.GetRequiredService<ICustomerUoW>();
            _cached = serviceProvider.GetRequiredService<IRedisCached>();
            _appSettings = new AppSettings();
        }


        #endregion
        #region Properties

        #endregion
        #region Methods
        #endregion
    }
}
