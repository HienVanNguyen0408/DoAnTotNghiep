using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.DependencyInjection;

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
            _logger = _serviceProvider.GetRequiredService<ILogger<T>>();    
        }
        #endregion

    }
}
