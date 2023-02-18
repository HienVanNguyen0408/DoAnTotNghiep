using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Storage
{
    public class StorageSettings
    {
        public const string CONFIG_NAME = "StorageSettings";
        public string SecretKey { get; set; } = "NVHIEN123";
        public string Password { get; set; } = "NVHIEN123";
        public string EndPoint { get; set; } = "http://127.0.0.1:9000";
        public string BucketName { get; set; } = "webbanhang";
    }
}
