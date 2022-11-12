using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class PermissionDetailUoW : BaseUnitOfWork<PermissionDetailUoW>, IPermissionDetailUoW
    {
        public PermissionDetailUoW(PostgreSqlContext dbContext, IServiceProvider serviceProvider) : base(dbContext, serviceProvider)
        {

        }
    }
}
