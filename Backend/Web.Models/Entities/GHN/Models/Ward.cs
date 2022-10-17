using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities.GHN
{
    /// <summary>
    /// Phường/Xã
    /// </summary>
    public class Ward
    {
        public string WardCode { get; set; }
        public int DistrictID { get; set; }
        public string WardName { get; set; }
        public List<string> NameExtension { get; set; }
        public int IsEnable { get; set; }
        public bool CanUpdateCOD { get; set; }
        public int UpdatedBy { get; set; }
        public string CreatedAt { get; set; }
        public string UpdatedAt { get; set; }
        public string UpdatedDate { get; set; }

        /// <summary>
        /// Type , 0:Lock, 1:Take/Pay, 2:Deliver, 3:Take/Deliver/Pay
        /// </summary>
        public int SupportType { get; set; }

        /// <summary>
        /// Status : 1:Unlock, 2:Lock
        /// </summary>
        public int Status { get; set; }
        public string ReasonCode { get; set; }
        public string ReasonMessage { get; set; }
    }
}
