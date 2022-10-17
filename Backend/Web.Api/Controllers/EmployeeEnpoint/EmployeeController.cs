using Microsoft.AspNetCore.Mvc;
using System;

namespace Web.Api.Controllers
{
    public class EmployeeController : BaseAuthController<EmployeeController>
    {
        public EmployeeController(IServiceProvider serviceProvider):base(serviceProvider)
        {

        }
    }
}
