using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class BlogCategoryUoW : BaseUnitOfWork<BlogCategoryUoW>, IBlogCategoryUoW
    {
        public BlogCategoryUoW(PostgreSqlContext dbContext, IServiceProvider serviceProvider) : base(dbContext, serviceProvider)
        {

        }
    }
}
