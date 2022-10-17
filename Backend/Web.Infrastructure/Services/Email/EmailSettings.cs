using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Infrastructure.Services
{
    public class EmailSettings
    {
        /// <summary>
        /// 
        /// </summary>
        public string Mail { get; set; } = "hien.van.nguyen0408@gmail.com";
        public string DisplayName { get; set; } = "Nguyễn Văn Hiến";
        public string Password { get; set; } = "Hien04080408";
        public string Host { get; set; } = "smtp.gmail.com";
        public int Port { get; set; } = 587;
    }
}
