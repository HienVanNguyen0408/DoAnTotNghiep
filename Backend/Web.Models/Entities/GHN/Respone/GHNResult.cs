using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Models.Entities.GHN
{
    public class GHNResult<T>
    {
        public int code { get; set; }
        public string message { get; set; }
        public T data { get; set; }

        public bool IsSuccessCode => code == 200;
        public bool IsSuccessMassage => message.Equals("OK",StringComparison.OrdinalIgnoreCase);
    }

    public class GHNProvince
    {
        public int ProvinceID { get; set; }
        public int CountryID { get; set; }
        public string ProvinceName { get; set; }
        public string Code { get; set; }
        public int SupportType { get; set; }
        public List<string> NameExtension { get; set; }
        public int IsEnable { get; set; }
        public int RegionID { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public bool CanUpdateCOD { get; set; }
        public int Status { get; set; }
    }
    public class GHNDistrict
    {
        public int DistrictID { get; set; }
        public int ProvinceID { get; set; }
        public string DistrictName { get; set; }
        public int Type { get; set; }
        public int SupportType { get; set; }
        public List<string> NameExtension { get; set; }
        public bool CanUpdateCOD { get; set; }
        public int Status { get; set; }
        public object WhiteListClient { get; set; }
        public object WhiteListDistrict { get; set; }
        public string CreatedIP { get; set; }
        public int CreatedEmployee { get; set; }
        public string CreatedSource { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string UpdatedIP { get; set; }
        public string UpdatedSource { get; set; }
    }
}
