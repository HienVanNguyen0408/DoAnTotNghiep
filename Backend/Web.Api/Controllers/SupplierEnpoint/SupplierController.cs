using Microsoft.AspNetCore.Mvc;
using System;
namespace Web.Api.Controllers
{
    public class SupplierController : BaseAuthController<SupplierController>
    {
        public SupplierController(IServiceProvider serviceProvider):base(serviceProvider)
        {

        }
    }
}
