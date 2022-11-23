using Microsoft.Extensions.DependencyInjection;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Interfaces.Services.MessageQueue;
using Web.AppCore.Services;
using Web.AppCore.Services.MessageQueue;
using Web.MessageQ.Consumer;
using Web.MessageQ.Publisher;

namespace Web.AppCore
{
    public static class ServiceCollectionExtension
    {
        public static IServiceCollection AddAppCoreService(this IServiceCollection services)
        {

            services.AddDataServiceAppCore()
                    .AddMessageQueueService();
            return services;
        }

        public static IServiceCollection AddDataServiceAppCore(this IServiceCollection services)
        {
            services.AddTransient<IDownloadService, DowloadService>();
            services.AddTransient<IImportExcelService, ImportExcelService>();

            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IRoleAccessService, RoleAccessService>();
            services.AddTransient<ISupplierService, SupplierService>();
            services.AddTransient<IProductService, ProductService>();
            services.AddTransient<IShipmentService, ShipmentService>();
            services.AddTransient<ICustomerService, CustomerService>();
            services.AddTransient<IProductService, ProductService>();
            services.AddTransient<IOrderService, OrderService>();
            services.AddTransient<IOrderItemService, OrderItemService>();
            services.AddTransient<IBlogService, BlogService>();
            services.AddTransient<IPermissionService, PermissionService>();
            services.AddTransient<IPermissionDetailService, PermissionDetailService>();
            services.AddTransient<IPermissionRelationshipService, PermissionRelationshipService>();
            return services;
        }

        public static IServiceCollection AddMessageQueueService(this IServiceCollection services)
        {

            services.AddTransient(typeof(IConsumer<>), typeof(Consumer<>));
            services.AddTransient<IPublisher, Publisher>();
            services.AddTransient<IPublisherQueue, PublisherQueue>();
            return services;
        }
    }
}
