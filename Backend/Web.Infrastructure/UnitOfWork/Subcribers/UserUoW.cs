using Microsoft.EntityFrameworkCore;
using NpgsqlTypes;
using PostgresDBData;
using System;
using System.Linq;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.Models.Entities;

namespace Web.Infrastructure.UnitOfWork
{
    public class UserUoW : BaseUnitOfWork<UserUoW>, IUserUoW
    {
        private const string Query = "Npgsql";
        protected readonly PostgreSqlContext _context;
        public UserUoW(IServiceProvider serviceProvider) : base( serviceProvider)
        {
        }
    }
}
