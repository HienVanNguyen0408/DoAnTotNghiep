using PostgresDBData;
using Web.Models.Entities;

namespace Web.AppCore.Interfaces.Repository
{
    public interface IBaseUnitOfWork
    {
        IBaseRepo<User> Users { get; }
        IBaseRepo<Avatar> Avatars { get; }
        IBaseRepo<Size> Sizes { get; }
        IBaseRepo<Color> Colors { get; }
        IBaseRepo<Product> Products { get; }
        IBaseRepo<ProductCategory> ProductCategories { get; }
        IBaseRepo<Customer> Customers { get; }
        IBaseRepo<Order> Orders { get; }
        IBaseRepo<OrderItem> OrderItems { get; }
        IBaseRepo<Blog> Blogs { get; }
        IBaseRepo<BlogCategory> BlogCategories { get; }
        IBaseRepo<Image> Images { get; }
        IBaseRepo<Permission> Permissions { get; }
        IBaseRepo<PermissionDetail> PermissionDetails { get; }
        IBaseRepo<PermissionRelationship> PermissionRelationships { get; }
    }
}
