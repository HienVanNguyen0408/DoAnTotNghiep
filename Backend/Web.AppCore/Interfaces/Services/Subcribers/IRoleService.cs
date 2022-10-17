using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Interfaces.Services
{
    public interface IRoleAccessService
    {

        /// <summary>
        /// User có quyền admin hay không
        /// </summary>
        /// <param name="userId">Id của user</param>
        /// <param name="subcriberId">Id của thuê bao</param>
        /// <returns></returns>
        Task<bool> IsAdminRoleAsync(string userId, string subcriberId);
    }
}
