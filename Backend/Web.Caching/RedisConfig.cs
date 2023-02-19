using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Caching
{
    public class RedisConfig
    {
        public string ConnectionString { get; set; } = "vanhien.online:6379";
        public string Port { get; set; } = "6379";
    }
}
