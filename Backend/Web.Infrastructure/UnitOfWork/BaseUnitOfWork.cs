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

        private IBaseRepo<Subcriber> _subcriber;
        private IBaseRepo<User> _user;
        private IBaseRepo<Customer> _customers;
        private IBaseRepo<Size> _sizes;
        private IBaseRepo<Product> _products;
        private IBaseRepo<Color> _colors;
        private IBaseRepo<ProductCategory> _product_categories;
        private IBaseRepo<Order> _orders;

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
        public IBaseRepo<Subcriber> Subcribers => _subcriber ??= new BaseRepo<Subcriber>(_dbContext);
        public IBaseRepo<User> Users => _user ??= new BaseRepo<User>(_dbContext);
        public IBaseRepo<Customer> Customers => _customers ??= new BaseRepo<Customer>(_dbContext);
        public IBaseRepo<Size> Sizes => _sizes ??= new BaseRepo<Size>(_dbContext);

        public IBaseRepo<Color> Colors => _colors ??= new BaseRepo<Color>(_dbContext);

        public IBaseRepo<Product> Products => _products ??= new BaseRepo<Product>(_dbContext);

        public IBaseRepo<ProductCategory> ProductCategories => _product_categories ??= new BaseRepo<ProductCategory>(_dbContext);
        public IBaseRepo<Order> Orders => _orders ??= new BaseRepo<Order>(_dbContext);
        #endregion

        #region Methods

        #endregion
    }
}
