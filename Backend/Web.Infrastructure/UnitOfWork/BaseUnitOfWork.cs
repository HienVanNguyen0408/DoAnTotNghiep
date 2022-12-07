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
        protected readonly PostgresSettings _postgresSettings;
        protected readonly AppSettings _appSettings;
        #endregion

        #region Contructor
        public BaseUnitOfWork(PostgreSqlContext dbContext, IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _dbContext = dbContext;
            _postgresSettings = serviceProvider.GetRequiredService<IOptions<PostgresSettings>>().Value;
            _appSettings = serviceProvider.GetRequiredService<IOptions<AppSettings>>().Value;
        }

        #endregion

        #region Properties
        public IBaseRepo<User> Users => _user ??= new BaseRepo<User>(_dbContext);
        public IBaseRepo<Avatar> Avatars => _avatar ??= new BaseRepo<Avatar>(_dbContext);
        public IBaseRepo<Customer> Customers => _customers ??= new BaseRepo<Customer>(_dbContext);
        public IBaseRepo<Color> Colors => _colors ??= new BaseRepo<Color>(_dbContext);

        public IBaseRepo<Product> Products => _products ??= new BaseRepo<Product>(_dbContext);

        public IBaseRepo<ProductCategory> ProductCategories => _product_categories ??= new BaseRepo<ProductCategory>(_dbContext);
        public IBaseRepo<Order> Orders => _orders ??= new BaseRepo<Order>(_dbContext);
        public IBaseRepo<OrderItem> OrderItems => _orderItems ??= new BaseRepo<OrderItem>(_dbContext);
        public IBaseRepo<Blog> Blogs => _blogs ??= new BaseRepo<Blog>(_dbContext);
        public IBaseRepo<BlogCategory> BlogCategories => _blog_categories ??= new BaseRepo<BlogCategory>(_dbContext);
        public IBaseRepo<Image> Images => _images ??= new BaseRepo<Image>(_dbContext);

        public IBaseRepo<Permission> Permissions => _permissions ??= new BaseRepo<Permission>(_dbContext);

        public IBaseRepo<PermissionDetail> PermissionDetails => _permission_details ??= new BaseRepo<PermissionDetail>(_dbContext);

        public IBaseRepo<PermissionRelationship> PermissionRelationships => _permission_relationships ??= new BaseRepo<PermissionRelationship>(_dbContext);
        #endregion

        #region Methods

        #endregion
    }
}
