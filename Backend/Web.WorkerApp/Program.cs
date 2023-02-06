using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Web.Utils.Shared;


namespace Web.WorkerApp
{
    class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigAppSettings()
                .ConfigureServices((hostContext, services) =>
                {
                    var config = hostContext.Configuration;
                    AppConfiguaration.ConfigServices(services, config);
                });
    }
}
