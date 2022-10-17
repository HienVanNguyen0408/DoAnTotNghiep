using MongoDBData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class SupplierUoW : BaseUnitOfWork<ProductUoW>, ISupplierUoW
    {
        public SupplierUoW(IMongoDbContext dbContext, IServiceProvider serviceProvider) : base(dbContext, serviceProvider)
        {
        }
    }
}
