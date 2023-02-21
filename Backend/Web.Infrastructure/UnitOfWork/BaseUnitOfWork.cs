using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;
using Web.Models.Entities;
using Web.Models.LibraryClass;
using Web.Models.Settings;

namespace Web.Infrastructure.UnitOfWork
{
    public class BaseUnitOfWork<T> : BaseClass<T>, IBaseUnitOfWork
    {
        #region Declaration
        private const string TAG = "BaseUnitOfWork";

        private IBaseRepo<User> _user;
        private IBaseRepo<AddressInfo> _address_infos;
        private IBaseRepo<Avatar> _avatar;
        private IBaseRepo<Customer> _customers;
        private IBaseRepo<Product> _products;
        private IBaseRepo<Color> _colors;
        private IBaseRepo<ProductCategory> _product_categories;
        private IBaseRepo<Order> _orders;
        private IBaseRepo<OrderItem> _orderItems;
        private IBaseRepo<Blog> _blogs;
        private IBaseRepo<BlogCategory> _blog_categories;
        private IBaseRepo<Image> _images;
        private IBaseRepo<Permission> _permissions;
        private IBaseRepo<PermissionDetail> _permission_details;
        private IBaseRepo<PermissionRelationship> _permission_relationships;

        protected readonly PostgreSqlContext _dbContext;
        protected readonly AppSettings _appSettings;
        #endregion

        #region Contructor
        public BaseUnitOfWork(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            var contextOptions = new DbContextOptionsBuilder<PostgreSqlContext>()
                .UseNpgsql(@$"{PostgresSettings.ConnectionString}")
                .Options;
            _dbContext = new PostgreSqlContext(contextOptions);
            _appSettings = serviceProvider.GetRequiredService<IOptions<AppSettings>>().Value;
        }

        #endregion

        #region Properties
        public IBaseRepo<User> Users => _user ??= new BaseRepo<User>();
        public IBaseRepo<AddressInfo> AddressInfos => _address_infos ??= new BaseRepo<AddressInfo>();
        public IBaseRepo<Avatar> Avatars => _avatar ??= new BaseRepo<Avatar>();
        public IBaseRepo<Customer> Customers => _customers ??= new BaseRepo<Customer>();
        public IBaseRepo<Color> Colors => _colors ??= new BaseRepo<Color>();

        public IBaseRepo<Product> Products => _products ??= new BaseRepo<Product>();

        public IBaseRepo<ProductCategory> ProductCategories => _product_categories ??= new BaseRepo<ProductCategory>();
        public IBaseRepo<Order> Orders => _orders ??= new BaseRepo<Order>();
        public IBaseRepo<OrderItem> OrderItems => _orderItems ??= new BaseRepo<OrderItem>();
        public IBaseRepo<Blog> Blogs => _blogs ??= new BaseRepo<Blog>();
        public IBaseRepo<BlogCategory> BlogCategories => _blog_categories ??= new BaseRepo<BlogCategory>();
        public IBaseRepo<Image> Images => _images ??= new BaseRepo<Image>();

        public IBaseRepo<Permission> Permissions => _permissions ??= new BaseRepo<Permission>();

        public IBaseRepo<PermissionDetail> PermissionDetails => _permission_details ??= new BaseRepo<PermissionDetail>();

        public IBaseRepo<PermissionRelationship> PermissionRelationships => _permission_relationships ??= new BaseRepo<PermissionRelationship>();
        #endregion

        #region Methods

        #endregion
    }
}
