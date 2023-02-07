using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using PostgresDBData;
using System;
using System.IO;
using System.Reflection;
using System.Text;
using Web.Api.Auth;
using Web.AppCore;
using Web.AppCore.Entities;
using Web.Caching;
using Web.Infrastructure;
using Web.MessageQ;
using Web.Models.Entities.GHN;
using Web.Models.Settings;
using Web.Stockets;
using Web.Storage;

namespace Web.Api
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

            services.Configure<PostgresSettings>(Configuration.GetSection(PostgresSettings.CONFIG_NAME));
            services.AddDbContext<PostgreSqlContext>(options => options.UseNpgsql(PostgresSettings.ConnectionString));
            services.Configure<GHNSettings>(Configuration.GetSection(GHNSettings.CONFIG_NAME));
            services.Configure<QueueSettings>(Configuration.GetSection(QueueSettings.CONFIG_NAME));
            services.Configure<AppSettings>(Configuration.GetSection(AppSettings.CONFIG_NAME));
            services.Configure<StorageSettings>(Configuration.GetSection(StorageSettings.CONFIG_NAME));

            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(options =>
            {
                options.RequireHttpsMetadata = false;
                options.SaveToken = true;
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuerSigningKey = true,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(Configuration["Jwt:Key"])),
                    RequireSignedTokens = true
                };
            });
            ////Google
            //.AddGoogle(option =>
            //{
            //    option.ClientId = Configuration["App:GoogleClientId"];
            //    option.ClientSecret = Configuration["App:GoogleClientSecret"];
            //})
            //// Facebook
            //.AddFacebook(option =>
            //{
            //    option.ClientId = Configuration["App:FacebookClientId"];
            //    option.ClientSecret = Configuration["App:FacebookClientSecret"];
            //}); 

            services.AddTransient<IJwtAuthencationManager, JwtAuthencationManager>();

            services.AddMvc();
            services.AddControllers();
            services.AddControllers().AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.Converters.Add(new ByteArrayConverter());
            });

            services.AddStackExchangeRedisCache(options =>
            {
                options.Configuration = Configuration.GetSection("RedisConfig")["ConnectionString"];
            });
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services
                .AddDataInfastructure(Configuration)
                .AddAppCoreService()
                .AddServiceCollectionInfrastructure()
                .AddSettingsInfrastructure(Configuration)
                .AddRedisCahedService()
                .AddDataServiceWebStockets()
                .AddStorageServiceExtension(Configuration);


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
            }

            //UseSwaggerDoc(app,"dev-docs");
            app.UseSwagger();
            app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Web.Api v1"));
            //app.UseWebSockets();

            //var webSocketOptions = new WebSocketOptions()
            //{
            //    KeepAliveInterval = TimeSpan.FromSeconds(120),
            //    ReceiveBufferSize = 4 * 1024
            //};
            //app.UseWebSockets(webSocketOptions);

            // Hook in the global error-handling middleware
            app.UseMiddleware(typeof(ErrorHandlingMiddleware));

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseCors("MyPolicy");

            //app.Use(async (context, next) =>
            //{
            //    context.Response.Headers.Add("X-Codepedia-Custom-Header-Response", "Satinder singh");
            //    context.Response.Headers.Add("X-Content-Type-Options", "nosniff");
            //    context.Response.Headers.Add("X-Frame-Options", "DENY");
            //    context.Response.Headers.Add("X-XSS-Protection", "1; mode=block");
            //    await next();
            //});

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
        
        //private void InitializeDatabase(IApplicationBuilder app)
        //{
        //    using (var scope = app.ApplicationServices.GetService<IServiceScopeFactory>().CreateScope())
        //    {
        //        scope.ServiceProvider.GetRequiredService<MySqlContext>().Database.Migrate();

        //    }
        //}
        public static IApplicationBuilder UseSwaggerDoc(IApplicationBuilder app, string urlPath)
        {
            if (!string.IsNullOrWhiteSpace(urlPath))
            {
                string routeTemplate = $"{urlPath}/{{documentName}}/swagger.json";
                app.UseSwagger(c => { c.RouteTemplate = routeTemplate; });

                // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
                // specifying the Swagger JSON endpoint.
                app.UseSwaggerUI(c =>
                {
                    string documentName = "v1";
                    string endPoint = $"{documentName}/swagger.json";
                    c.SwaggerEndpoint(endPoint, "Web Api");
                    c.RoutePrefix = urlPath;
                });
            }

            return app;
        }
    }
}
