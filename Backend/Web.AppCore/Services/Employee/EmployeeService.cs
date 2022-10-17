using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;

namespace Web.AppCore.Services
{
    public class EmployeeService : BaseDomainService<EmployeeService>, IEmployeeService
    {
        public EmployeeService(IServiceProvider serviceProvider):base(serviceProvider)
        {

        }
    }
}
