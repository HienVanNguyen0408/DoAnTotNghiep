using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Stockets.VideoChats
{
    public class TwilioSettings
    {
        /// <summary>
        /// The primary Twilio account SID, displayed prominently on your twilio.com/console dashboard.
        /// </summary>
        public string AccountSid { get; set; } = "SK03b11195c484d76063af907fdc9b4920";
        public string AccountSidTest { get; set; } = "AC049c6522dbba85a73b3d2b3851fb4674";

        /// <summary>
        /// The auth token for your primary Twilio account, hidden on your twilio.com/console dashboard.
        /// </summary>
        public string AuthToken { get; set; } = "ba7b417f6e08e2403e31719cef0180cf";
        public string AuthTokenTest { get; set; } = "117254c0e7e4164c6b0901bd337b801a";

        /// <summary>
        /// Signing Key SID, also known as the API SID or API Key.
        /// </summary>
        public string ApiKey { get; set; } = "HienDev";

        /// <summary>
        /// The API Secret that corresponds to the <see cref="ApiKey"/>.
        /// </summary>
        public string ApiSecret { get; set; } = "zVcQkDjJKtM73DZoaDhH0w6dMck2kO5T";
    }
}
