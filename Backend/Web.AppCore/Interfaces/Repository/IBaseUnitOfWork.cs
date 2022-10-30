using MongoDBData;
using Web.Models.Entities;

namespace Web.AppCore.Interfaces.Repository
{
    public interface IBaseUnitOfWork
    {
        IBaseRepo<Subcriber> Subcribers { get; }
        IBaseRepo<User> Users { get; }
        IBaseRepo<Customer> Customers { get; }
    }
}
