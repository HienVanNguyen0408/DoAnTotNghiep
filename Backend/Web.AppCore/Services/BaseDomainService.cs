using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;
using Web.Models.LibraryClass;
using MongoDBData;
using Microsoft.Extensions.DependencyInjection;
using Web.Models.Settings;

namespace Web.AppCore.Services
{
    public class BaseDomainService<T> : BaseClass<T>, IBaseDomainService
    {
        #region Declaration
        protected readonly MongoDbSettings _mongoDbSettings;
        protected readonly AppSettings _appSettings;
        #endregion

        #region Contructor
        public BaseDomainService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _mongoDbSettings = new MongoDbSettings();  
            //_appSettings = serviceProvider.GetRequiredService<AppSettings>();   
        }
        #endregion

    }
}
