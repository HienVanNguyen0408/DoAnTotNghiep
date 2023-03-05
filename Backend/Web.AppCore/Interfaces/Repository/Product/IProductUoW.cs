using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities;
using Web.Models.Request;

namespace Web.AppCore.Interfaces.Repository
{
    public interface IProductUoW : IBaseUnitOfWork
    {
        Task<Pagging<Product>> GetProductsPaggingAsync(ProductFilterRequest request);
    }
}
