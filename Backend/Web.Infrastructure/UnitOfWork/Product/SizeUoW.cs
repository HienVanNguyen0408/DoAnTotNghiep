using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class SizeUoW : BaseUnitOfWork<SizeUoW>, ISizeUoW
    {
        public SizeUoW(IServiceProvider serviceProvider) : base(serviceProvider)
        {

        }
    }
}
