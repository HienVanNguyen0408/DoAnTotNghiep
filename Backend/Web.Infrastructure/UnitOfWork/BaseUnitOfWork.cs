using MongoDBData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.Models.Entities;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
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

        protected readonly IMongoDbContext _dbContext;
        protected readonly MongoDbSettings _mongoDbSettings;
        protected readonly AppSettings _appSettings;
        #endregion

        #region Contructor
        public BaseUnitOfWork(IMongoDbContext dbContext,IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _dbContext = dbContext;
            _mongoDbSettings = serviceProvider.GetRequiredService<IOptions<MongoDbSettings>>().Value;  
            _appSettings = serviceProvider.GetRequiredService<IOptions<AppSettings>>().Value;  
        }

        #endregion

        #region Properties
        public IBaseRepo<Subcriber> Subcribers => _subcriber ??= new BaseRepo<Subcriber>(_dbContext);
        public IBaseRepo<User> Users => _user ??= new BaseRepo<User>(_dbContext);
        #endregion

        #region Methods

        #endregion
    }
}
