 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;

namespace Web.AppCore.Services
{
    public class ProductCategoryService : BaseDomainService<ProductCategoryService>, IProductCategoryService
    {
        public ProductCategoryService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
        }
    }
}
