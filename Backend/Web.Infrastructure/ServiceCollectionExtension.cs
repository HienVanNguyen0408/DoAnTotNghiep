using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using PostgresDBData;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.AppCore.Services.MessageQueue;
using Web.Infrastructure.Services;
using Web.Infrastructure.Services.GHN;
using Web.Infrastructure.Services.Momo;
using Web.Infrastructure.UnitOfWork;
using Web.MessageQ;
using Web.MessageQ.Publisher;

namespace Web.Infrastructure
{
    public static class ServiceCollectionExtension
    {
        public static IServiceCollection AddDataInfastructure(this IServiceCollection services, IConfiguration configuration)
        {
            // add configure
            services.AddTransient(typeof(IBaseRepo<>), typeof(BaseRepo<>));

            // add configure
            services.AddTransient<IUserUoW, UserUoW>();
            services.AddTransient<IProductUoW, ProductUoW>();
            services.AddTransient<IColorUoW, ColorUoW>();
            services.AddTransient<ISizeUoW, SizeUoW>();
            services.AddTransient<IProductCategoryUoW, ProductCategoryUoW>();
            services.AddTransient<IOrderUoW, OrderUoW>();
            services.AddTransient<IOrderItemUoW, OrderItemUoW>();
            services.AddTransient<IBlogUoW, BlogUoW>();
            services.AddTransient<IBlogCategoryUoW, BlogCategoryUoW>();
            services.AddTransient<IImageUoW, ImageUoW>();
            services.AddTransient<IPermissionUoW, PermissionUoW>();
            services.AddTransient<IPermissionDetailUoW, PermissionDetailUoW>();
            services.AddTransient<IPermissionRelationshipUoW, PermissionRelationshipUoW>();
            services.AddTransient<IAddressInfoUoW, AddressInfoUoW>();
            //Service 
            services.AddServiceEmailClient();
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
