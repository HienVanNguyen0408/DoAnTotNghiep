using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;

namespace Web.AppCore.Services
{
    public class CartService : BaseDomainService<CartService>, ICartService
    {
        public CartService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
        }


        private string KeyCachedCart(string userId) => $"Cart_{userId}";
    }
}
