using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Settings
{
    public class JwtSettings
    {
        public string ValidAudience { get; set; } = "https://vanhien.online:5001";
        public string ValidIssuer { get; set; } = "https://vanhien.online:5001";
        /// <summary>
        /// Key
        /// </summary>
        public string Key { get; set; } = "I am admin app study english";

        public string Secret { get; set; } = "SecretSecretSecretSecretSecretSecretSecretSecret";

        /// <summary>
        /// Hạn token
        /// Tính bằng giờ
        /// </summary>
        public double ExpireDate { get; set; } = 24;
        public string Subject { get; set; } = "SubjectAuthencation";

        public bool ValidateIssuerSigningKey { get; set; }

        public string IssuerSigningKey { get; set; }

        public bool ValidateIssuer { get; set; } = true;

        public bool ValidateAudience { get; set; } = true;

        public bool RequireExpirationTime { get; set; }

        public bool ValidateLifetime { get; set; } = true;

    }
}
