using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Services.MessageQueue
{
    public class QueueNameSettings
    {
        public string QueueNameOrder { get; set; } = "OrderDataQueueName";
        public string QueueNameInsertOrder { get; set; } = "InsertOrderDataQueueName";
        public string QueueNameUpdateQuantityProduct { get; set; } = "UpdateAmountProductQueueName";
    }
}
