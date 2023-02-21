using PostgresDBData;
using System;
using Web.AppCore.Interfaces.Repository;

namespace Web.Infrastructure.UnitOfWork
{
    public class ImageUoW : BaseUnitOfWork<ImageUoW>, IImageUoW
    {
        public ImageUoW(IServiceProvider serviceProvider) : base(serviceProvider)
        {

        }
    }
}
