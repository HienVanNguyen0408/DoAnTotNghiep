using MongoDBData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    class CustomerUoW : BaseUnitOfWork<CustomerUoW>, ICustomerUoW
    {
        public CustomerUoW(IMongoDbContext dbContext, IServiceProvider serviceProvider) : base(dbContext, serviceProvider)
        {

        }
    }
}
