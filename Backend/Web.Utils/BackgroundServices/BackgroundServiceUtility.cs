using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Utils.BackgroundServices
{
    public static class BackgroundServiceUtility
    {
        public static TimeSpan GetWaiting(int hour, int minute, int second)
        {
            var now = DateTime.Now;
            var runningDate = new DateTime(now.Year, now.Month, now.Day, hour, minute, second);
            if (runningDate <= now)
            {
                runningDate = runningDate.AddDays(1);
            }
            TimeSpan waiting = runningDate.Subtract(now);
            return waiting;
        }

        public static TimeSpan GetWaiting(int secondWait)
        {
            var now = DateTime.Now;
            var runningDate = now.AddSeconds(secondWait);
            TimeSpan waiting = runningDate.Subtract(now);
            return waiting;
        }
    }
}
