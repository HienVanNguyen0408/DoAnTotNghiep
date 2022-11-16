using Microsoft.AspNetCore.Mvc;
using System;
using Web.AppCore.Interfaces.Services;

namespace Web.Api.Controllers
{
    public class ProductController : BaseAuthController<ProductController>
    {
        private readonly IProductService _productService;
        public ProductController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _productService = GetRequiredService<IProductService>();
        }

    }
}
