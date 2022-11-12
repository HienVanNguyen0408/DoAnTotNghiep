 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;

namespace Web.AppCore.Services
{
    public class BlogService : BaseDomainService<BlogService>, IBlogService
    {
        public BlogService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
        }
    }
}
