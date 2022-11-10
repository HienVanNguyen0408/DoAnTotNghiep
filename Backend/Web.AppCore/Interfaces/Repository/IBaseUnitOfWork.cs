using PostgresDBData;
using Web.Models.Entities;

namespace Web.AppCore.Interfaces.Repository
{
    public interface IBaseUnitOfWork
    {
        IBaseRepo<Subcriber> Subcribers { get; }
        IBaseRepo<User> Users { get; }
        IBaseRepo<Size> Sizes { get; }
        IBaseRepo<Color> Colors { get; }
        IBaseRepo<Product> Products { get; }
        IBaseRepo<ProductCategory> ProductCategories { get; }
        IBaseRepo<Customer> Customers { get; }
        IBaseRepo<Order> Orders { get; }
    }
}
