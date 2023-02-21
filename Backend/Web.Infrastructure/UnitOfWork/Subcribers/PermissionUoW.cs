using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class PermissionUoW : BaseUnitOfWork<PermissionUoW>, IPermissionUoW
    {
        public PermissionUoW(IServiceProvider serviceProvider) : base(serviceProvider)
        {

        }
    }
}
