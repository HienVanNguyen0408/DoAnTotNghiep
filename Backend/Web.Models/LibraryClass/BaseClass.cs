using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;

namespace Web.Models.LibraryClass
{
    public abstract class BaseClass<T>
    {
        #region Declaration
        protected readonly IServiceProvider _serviceProvider;
        protected readonly ILogger<T> _logger;
        #endregion

        #region Contructor
        public BaseClass(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
            _logger = _serviceProvider.GetService<ILogger<T>>();
        }
        #endregion

    }
}
