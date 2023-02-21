using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class BlogUoW : BaseUnitOfWork<BlogUoW>, IBlogUoW
    {
        public BlogUoW(IServiceProvider serviceProvider) : base( serviceProvider)
        {

        }
    }
}
