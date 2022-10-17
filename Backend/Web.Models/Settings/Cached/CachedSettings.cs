using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Settings
{
    public class CachedSettings
    {

        /// <summary>
        /// Thời gian lưu cached check role admin
        /// </summary>
        public long RoleAccessTimeout { get; set; } = 1 * 60;
    }
}
