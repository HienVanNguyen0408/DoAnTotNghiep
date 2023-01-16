using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.AppCore.Entities;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;

namespace Web.Api.Controllers.CartEnpoint
{
    public class CartController : BaseAuthController<CartController>
    {
        private const string TAG = "ProductController";
        private readonly ICartService _cartService;
        public CartController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _cartService = GetRequiredService<ICartService>();
        }

        #region Methods
        [HttpGet("{userId}")]
        public async Task<ServiceResult<Pagging<Cart>>> GetCartsAsync(string userId)
        {
            try
            {
                var cartPage = new ServiceResult<Pagging<Cart>>();
                return cartPage;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"{TAG}:Hàm GetCartsAsync::Exception::{ex.Message}");
                return null;
            }
        }
        #endregion

    }
}
