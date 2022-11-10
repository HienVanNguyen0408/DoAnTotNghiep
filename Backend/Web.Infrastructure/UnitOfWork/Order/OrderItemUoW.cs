using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class OrderItemUoW : BaseUnitOfWork<OrderUoW>, IOrderItemUoW
    {
        public OrderItemUoW(PostgreSqlContext dbContext, IServiceProvider serviceProvider) : base(dbContext, serviceProvider)
        {

        }
    }
}
