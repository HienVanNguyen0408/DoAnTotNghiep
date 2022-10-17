using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using MongoDBData;
using System;
using System.IO;
using System.Reflection;
using Web.AppCore;
using Web.AppCore.Entities;
using Web.Infrastructure;
using Web.Models.Entities.GHN;
using Web.Models.Settings;

namespace Web.WokerService
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            // add configure
            services.Configure<MongoDbSettings>(Configuration.GetSection(MongoDbSettings.CONFIG_NAME));
            services.Configure<MongoDbSettings>(Configuration.GetSection(AppSettings.CONFIG_NAME));
            services.Configure<GHNSettings>(Configuration.GetSection(GHNSettings.CONFIG_NAME));

            services.AddMvc();
            services.AddControllers();
            services.AddControllers().AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.Converters.Add(new ByteArrayConverter());
            });

            services
                .AddDataInfastructure(Configuration)
                .AddDataServiceAppCore()
                .AddServiceCollectionInfrastructure()
                .AddSettingsInfrastructure(Configuration);


            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Web.Api", Version = "v1", Description = "API" });

                // Set the comments path for the Swagger JSON and UI.
                var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
            });
            services.AddCors(o => o.AddPolicy("MyPolicy", builder =>
            {
                builder.AllowAnyOrigin()
                       .AllowAnyMethod()
                       .AllowAnyHeader();
            }));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Web.WokerService v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
