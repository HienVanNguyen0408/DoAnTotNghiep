using Microsoft.AspNetCore.Mvc;
using System;

namespace Web.Api.Controllers
{
    public class ShipmentController : BaseAuthController<ShipmentController>
    {
        public ShipmentController(IServiceProvider serviceProvider):base(serviceProvider)
        {

        }
    }
}
