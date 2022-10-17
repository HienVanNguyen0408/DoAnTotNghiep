using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;
using Web.Models.Constant;
using Web.Models.Enums;

namespace Web.AppCore.Services
{
    public class RoleAccessService : BaseDomainService<RoleAccessService>, IRoleAccessService
    {
        #region Declaration
        protected readonly IUserService _userService;
        #endregion
        #region Contructor
        public RoleAccessService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
        }

        #endregion

        #region Properties

        #endregion

        #region Methods
        public async Task<bool> IsAdminRoleAsync(string userId, string subcriberId)
        {
            await Task.CompletedTask;

            var cachedKey = CachedKeys.GetKeyRoleAccessAdmin(userId,subcriberId);
            bool isAdmin = false;
            if (string.IsNullOrEmpty(cachedKey))
            {
                // Lấy data từ cached
                // Chưa xử lý
                isAdmin = false;
            }
            else
            {
                var user = await _userService.GetUserByIdAsync(userId);
                if(user != null && user.RoleType == RoleType.Admin)
                {
                    isAdmin = true; 
                }
                else
                {
                    isAdmin = false;
                }

                // TODO: Lưu cached thông tin admin access (nếu cần)

            }
            return isAdmin;
        }
        #endregion
    }
}
