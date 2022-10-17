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
    }
}
