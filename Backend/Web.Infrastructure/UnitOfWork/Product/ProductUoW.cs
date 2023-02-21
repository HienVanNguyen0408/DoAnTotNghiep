using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class ProductUoW : BaseUnitOfWork<ProductUoW>, IProductUoW
    {
        public ProductUoW(IServiceProvider serviceProvider) : base(serviceProvider)
        {

        }
    }
}
