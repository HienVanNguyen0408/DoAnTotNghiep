using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class OrderItemUoW : BaseUnitOfWork<OrderItemUoW>, IOrderItemUoW
    {
        public OrderItemUoW(IServiceProvider serviceProvider) : base(serviceProvider)
        {

        }
    }
}
