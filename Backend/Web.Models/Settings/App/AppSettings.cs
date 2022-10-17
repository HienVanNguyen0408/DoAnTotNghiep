using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Settings;

namespace Web.Models.Settings
{
    public class AppSettings
    {
        public const string CONFIG_NAME = "AppSettings";

        public CachedSettings CachedKeys { get; set; } = new CachedSettings();
    }
}
