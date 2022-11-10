using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class ColorUoW : BaseUnitOfWork<SizeUoW>, IColorUoW
    {
        public ColorUoW(PostgreSqlContext dbContext, IServiceProvider serviceProvider) : base(dbContext, serviceProvider)
        {

        }
    }
}
