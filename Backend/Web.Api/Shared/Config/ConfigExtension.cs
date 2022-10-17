using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Api.Shared.Config
{
    public static class ConfigExtension
    {
        private const string AppSettingConfig = "APP_SETTINGS_CONFIG_FILE_PATH";
        public static IHostBuilder ConfigAppSettings(this IHostBuilder builder)
        {
            //đọc thông tin đường dẫn truyền vào
            string configFilePath = Environment.GetEnvironmentVariable(AppSettingConfig);

            //Không tồn tại đọc file ngầm định(mặc định)
            if(string.IsNullOrEmpty(configFilePath) || !File.Exists(configFilePath))
            {
                string appSettingsFileName = "appsetting.json";
                string basePath = AppContext.BaseDirectory;
                //đọc file trong thư mục config
                configFilePath = Path.Combine(basePath, "config", appSettingsFileName);

                if (!File.Exists(configFilePath))
                {
                    configFilePath = Path.Combine(basePath, appSettingsFileName);
                }
            }

            if (File.Exists(configFilePath))
            {
                builder.ConfigureAppConfiguration((hostContext, config) =>
                {
                    config.AddJsonFile(configFilePath);
                });
            }

            return builder;
        }
    }
}
