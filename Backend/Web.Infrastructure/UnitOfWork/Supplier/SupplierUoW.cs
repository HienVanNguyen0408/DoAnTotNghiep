using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class SupplierUoW : BaseUnitOfWork<ProductUoW>, ISupplierUoW
    {
        public SupplierUoW(PostgreSqlContext dbContext, IServiceProvider serviceProvider) : base(dbContext, serviceProvider)
        {

        }
    }
}
