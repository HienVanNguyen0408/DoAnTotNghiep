using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class PermissionRelationshipUoW : BaseUnitOfWork<PermissionRelationshipUoW>, IPermissionRelationshipUoW
    {
        public PermissionRelationshipUoW(PostgreSqlContext dbContext, IServiceProvider serviceProvider) : base(dbContext, serviceProvider)
        {

        }
    }
}
