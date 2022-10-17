 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;

namespace Web.AppCore.Services
{
    public class ProductService : BaseDomainService<ProductService>, IProductService
    {
        public ProductService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
        }
    }
}
