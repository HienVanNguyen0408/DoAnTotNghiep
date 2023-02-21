using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class OrderUoW : BaseUnitOfWork<OrderUoW>, IOrderUoW
    {
        public OrderUoW(IServiceProvider serviceProvider) : base(serviceProvider)
        {

        }
    }
}
