using Microsoft.Extensions.Hosting;
using NLog.Web;
using System;
using System.IO;
namespace Web.Worker.Shared.Config
{
    public static class NLogConfigExtention
    {
        private const string NLogConfig = "NLOG_CONFIG_FILE_PATH";
        public static IHostBuilder ConfigNLogSettings(this IHostBuilder builder)
        {
            //đọc thông tin đường dẫn truyền vào
            string configFilePath = Environment.GetEnvironmentVariable(NLogConfig);

            //Không tồn tại đọc file ngầm định(mặc định)
            if (string.IsNullOrEmpty(configFilePath) || !File.Exists(configFilePath))
            {
                string appSettingsFileName = "nlog.config";
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
                builder.ConfigureLogging((logging) =>
                {
                    logging.AddNLog(configFilePath);
                });
            }

            return builder;
        }
    }
}
