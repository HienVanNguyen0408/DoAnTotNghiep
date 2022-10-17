using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.AppCore.Exceptions
{
    public class ClientException: Exception
    {

        #region Contructor
        /// <summary>
        /// Contructor
        /// </summary>
        public ClientException(string msg) : base(msg)
        {
        }
        /// <summary>
        /// Contructor
        /// </summary>
        public ClientException(string msg,  Exception ex) : base(msg,ex)
        {
        }

        public ClientException(object ob)
        {
            this.Data.Add(1, ob);
        }
        #endregion


    }
}
