using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Constant
{
    public class CachedKeys
    {
        public static string GetKeyRoleAccessAdmin(string userId, string subcriberId) => $"RoleAccessAdmin_{userId}_{subcriberId}";
    }
}
