using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Web.AppCore;
using Web.Caching;
using Web.Infrastructure;
using Web.MessageQ;
using Web.Models.Settings;
using Web.Stockets;

namespace Web.Worker
{
    public static class AppConfiguaration
    {
        public static void ConfigServices(this IServiceCollection services, IConfiguration configuration)
        {
            //Config
            //services.Configure<QueueSettings>(configuration.GetSection(QueueSettings.CONFIG_NAME));
            //services.Configure<AppSettings>(configuration.GetSection(AppSettings.CONFIG_NAME));

            //Add service
            services
                .AddDataInfastructure(configuration)
                .AddAppCoreService()
                .AddServiceCollectionInfrastructure()
                .AddSettingsInfrastructure(configuration)
                .AddRedisCahedService()
                .AddDataServiceWebStockets();

            //Chạy worker
            services.AddHostedService<OrderWorker>();
        }
    }
}
