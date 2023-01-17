using System;
using System.Collections.Generic;
using System.Text;
using Web.Models.Entities;

namespace Web.Models.Respone
{
    public class UserRespone : User
    {
        public string key_auth { get; set; }
    }
}
