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
        #endregion
        #region Contructor
        public CustomerService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
        }


        #endregion
        #region Properties

        #endregion
        #region Methods
        #endregion
    }
}
