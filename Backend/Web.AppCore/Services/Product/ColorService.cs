 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;

namespace Web.AppCore.Services
{
    public class ColorService : BaseDomainService<ColorService>, IColorService
    {
        public ColorService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
        }
    }
}
