using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities.GHN
{
    public class District
    {
        public int DistrictID { get; set; }
        public int ProvinceID { get; set; }
        public string DistrictName { get; set; }
        public int Type { get; set; }
        public int SupportType { get; set; }
        public List<string> NameExtension { get; set; }
        public bool CanUpdateCOD { get; set; }
        public int Status { get; set; }
        public string ReasonCode { get; set; }
        public string ReasonMessage { get; set; }
        public string CreatedIP { get; set; }
        public string UpdatedIP { get; set; }

        public int CreatedEmployee { get; set; }
        public int UpdatedEmployee { get; set; }
        public string CreatedSource { get; set; }
        public string UpdatedSource { get; set; }

        public string CreatedDate { get; set; } 
        public string UpdatedDate { get; set; } 
    }
}
