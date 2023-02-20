using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using PostgresDBData;
using Web.AppCore;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.Caching;
using Web.Infrastructure;
using Web.Infrastructure.UnitOfWork;
using Web.MessageQ;
using Web.Models.Entities.GHN;
using Web.Models.Settings;
using Web.Stockets;
using Web.Storage;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Web.AppCore.Services;

namespace Web.WokerService
{
    public static class AppConfiguaration
    {
        public static void ConfigServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<PostgresSettings>(configuration.GetSection(PostgresSettings.CONFIG_NAME));
            services.AddDbContext<PostgreSqlContext>(options =>
                    options.UseNpgsql(PostgresSettings.ConnectionString)
            );
            services.Configure<GHNSettings>(configuration.GetSection(GHNSettings.CONFIG_NAME));
            services.Configure<QueueSettings>(configuration.GetSection(QueueSettings.CONFIG_NAME));
            services.Configure<AppSettings>(configuration.GetSection(AppSettings.CONFIG_NAME));
            services.Configure<StorageSettings>(configuration.GetSection(StorageSettings.CONFIG_NAME));

            services.AddStackExchangeRedisCache(options =>
            {
                options.Configuration = configuration.GetSection("RedisConfig")["ConnectionString"];
            });
            
            services.AddTransient<IOrderService, OrderService>();
            services.AddTransient<IOrderUoW, OrderUoW>();

            // Register IServiceScopeFactory
            services
                .AddMessageQueueService()
                .AddRedisCahedService()
                .AddDataServiceWebStockets()
                .AddStorageServiceExtension(configuration);

            //Chạy worker
            services.AddHostedService<OrderWorker>();
            services.AddHostedService<Worker>();
        }
    }
}
