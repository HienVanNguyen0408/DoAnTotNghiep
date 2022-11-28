using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Storage
{
    public static class StorageServiceExtension
    {
        public static IServiceCollection AddStorageServiceExtension(this IServiceCollection services, IConfiguration configuration)
        {
            // add configure
            services.AddTransient<IStorageClient, StorageClient>();

            return services;
        }
    }
}
