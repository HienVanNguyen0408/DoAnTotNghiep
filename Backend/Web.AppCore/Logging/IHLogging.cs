using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Logging
{
    public interface IHLogging
    {
        void LogError(string message, Exception ex);
        void LogInfor(string message, Exception ex);
    }
}
