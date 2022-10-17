using Microsoft.AspNetCore.Mvc;
using System;

namespace Web.Api.Controllers
{
    public class ProductController : BaseAuthController<ProductController>
    {
        public ProductController(IServiceProvider serviceProvider) : base(serviceProvider)
        {

        }

    }
}
