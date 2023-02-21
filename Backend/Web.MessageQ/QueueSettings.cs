using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.MessageQ
{
    public class QueueSettings
    {
        public const string CONFIG_NAME = "QueueSettings";
        /// <summary>
        /// Connection string queue
        /// </summary>
        public string ConnectionString { get; set; }

        /// <summary>
        /// Số lượng bốc ra từ Queue
        /// </summary>
        public ushort WithPrefecthCount { get; set; } = 50;

        public string Host { get; set; }
        public string Exchange { get; set; }
        public int RequestedHeartbeat { get; set; }
        public bool PublisherConfirms { get; set; }
        public ushort Timeout { get; set; }
        public ushort Port { get; set; }
        public string VirtualHost { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }


    }
}
