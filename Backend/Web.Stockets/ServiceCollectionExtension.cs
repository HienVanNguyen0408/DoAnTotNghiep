using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;
using Web.Stockets.VideoChats;

namespace Web.Stockets
{
    public static class ServiceCollectionExtension
    {
        public static IServiceCollection AddDataServiceWebStockets(this IServiceCollection services)
        {
            services.AddTransient<IVideoService, VideoService>();
            return services;
        }
    }
}
