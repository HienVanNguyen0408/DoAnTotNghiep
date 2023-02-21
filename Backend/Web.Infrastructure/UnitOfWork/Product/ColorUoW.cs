using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class ColorUoW : BaseUnitOfWork<ColorUoW>, IColorUoW
    {
        public ColorUoW(IServiceProvider serviceProvider) : base(serviceProvider)
        {

        }
    }
}
