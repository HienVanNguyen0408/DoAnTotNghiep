﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Storage
{
    public class StorageSettings
    {
        public const string CONFIG_NAME = "StorageSettings";
        public string SecretKey { get; set; }
        public string Password { get; set; }
        public string EndPoint { get; set; }
        public string BucketName { get; set; }
    }
}
