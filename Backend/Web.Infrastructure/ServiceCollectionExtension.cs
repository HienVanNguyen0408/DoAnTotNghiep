using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MongoDBData;
using System.Configuration;
using Web.AppCore.Interfaces.Repository;
using Web.Infrastructure.Services;
using Web.Infrastructure.Services.GHN;
using Web.Infrastructure.Services.Momo;
using Web.Infrastructure.UnitOfWork;
using Web.Models.Entities.GHN;

namespace Web.Infrastructure
{
    public static class ServiceCollectionExtension
    {
        public static IServiceCollection AddDataInfastructure(this IServiceCollection services, IConfiguration configuration)
        {
            SerializationFactory.Register();

            // add configure
            services.AddSingleton<IMongoDbContext, MongoDbContext>();
            services.AddTransient(typeof(IBaseRepo<>), typeof(BaseRepo<>));
            services.AddTransient(typeof(IDbShareRepo<>), typeof(DbShareRepo<>));

            services.AddTransient<IUserUoW, UserUoW>();
            services.AddTransient<IEmployeeUoW, EmployeeUoW>();
            services.AddTransient<ISupplierUoW, SupplierUoW>();
            services.AddTransient<IProductUoW, ProductUoW>();
            services.AddTransient<IShipmentUoW, ShipmentUoW>();
            services.AddTransient<IOrderUoW, OrderUoW>();

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
