using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class UserUoW : BaseUnitOfWork<UserUoW>, IUserUoW
    {
        public UserUoW(PostgreSqlContext dbContext, IServiceProvider serviceProvider) : base(dbContext, serviceProvider)
        {

        }
    }
}
