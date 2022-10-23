
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Caching.StackExchangeRedis;
using Microsoft.Extensions.DependencyInjection;

namespace Web.Caching
{
    public static class ServiceCollectionExtension
    {
        public static IServiceCollection AddRedisCahedService(this IServiceCollection services)
        {
            services.AddSingleton<IDistributedCache, RedisCache>();
            services.AddTransient<IRedisCached, RedisCahed>();
            return services;
        }
    }
}
