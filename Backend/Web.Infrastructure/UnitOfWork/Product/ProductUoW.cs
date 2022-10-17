using MongoDBData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class ProductUoW : BaseUnitOfWork<ProductUoW>, IProductUoW
    {
        public ProductUoW(IMongoDbContext dbContext, IServiceProvider serviceProvider) : base(dbContext,serviceProvider)
        {
        }
    }
}
