using Autofac.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.Utils.Shared;

namespace Web.WokerService
{
    public class Program
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
                    //services.AddHostedService<Worker>();
                }).UseServiceProviderFactory(new AutofacServiceProviderFactory());
                
    }
}
