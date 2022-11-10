using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class ProductCategoryUoW : BaseUnitOfWork<ProductCategoryUoW>, IProductCategoryUoW
    {
        public ProductCategoryUoW(PostgreSqlContext dbContext, IServiceProvider serviceProvider) : base(dbContext, serviceProvider)
        {

        }
    }
}
