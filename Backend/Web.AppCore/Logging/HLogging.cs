using Microsoft.Extensions.Logging;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Logging
{
    public class HLogging : IHLogging
    {
        private static Logger _logger = LogManager.GetCurrentClassLogger();

        public void LogError(string message,Exception? ex)
        {
            _logger.Error(message,ex);
        }
        
        public void LogInfor(string message,Exception? ex)
        {
            _logger.Info(message,ex);
        }
    }
}
