using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class ShipmentUoW : BaseUnitOfWork<ShipmentUoW>, IShipmentUoW
    {
        public ShipmentUoW(IServiceProvider serviceProvider) : base(serviceProvider)
        {

        }
    }
}
