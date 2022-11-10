using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using PostgresDBData;
using Web.AppCore.Interfaces.Repository;
using Web.Infrastructure.Services;
using Web.Infrastructure.Services.GHN;
using Web.Infrastructure.Services.Momo;
using Web.Infrastructure.UnitOfWork;

namespace Web.Infrastructure
{
    public static class ServiceCollectionExtension
    {
        public static IServiceCollection AddDataInfastructure(this IServiceCollection services, IConfiguration configuration)
        {
            // add configure
            services.AddTransient(typeof(IBaseRepo<>), typeof(BaseRepo<>));

            services.AddTransient<IUserUoW, UserUoW>();
            services.AddTransient<IProductUoW, ProductUoW>();
            services.AddTransient<IColorUoW, ColorUoW>();
            services.AddTransient<ISizeUoW, SizeUoW>();
            services.AddTransient<IProductCategoryUoW, ProductCategoryUoW>();
            services.AddTransient<IOrderUoW, IOrderUoW>();
            services.AddTransient<IOrderItemUoW, OrderItemUoW>();

            //Service 
            services.AddServiceEmailClient();

            return services;
        }
        public static IServiceCollection AddServiceCollectionInfrastructure(this IServiceCollection services)
        {
            return services;
        }
        
        public static IServiceCollection AddSettingsInfrastructure(this IServiceCollection services, IConfiguration configuration)
        {
            return services;
        }
        
        public static IServiceCollection AddServiceEmailClient(this IServiceCollection services)
        {
            services.AddTransient<ISendMailClient, SendMailClient>();
            services.AddTransient<IGHNClient, GHNClient>();
            services.AddTransient<IMomoClient, MomoClient>();
            return services;
        }

    }
}
