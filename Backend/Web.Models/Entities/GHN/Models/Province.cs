using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities.GHN
{
    public class Province
    {
        /// <summary>
        /// Id Tỉnh/TP
        /// </summary>
        public int ProvinceID { get; set; }

        /// <summary>
        /// Tên Tỉnh/TP
        /// </summary>
        public string ProvinceName { get; set; }

        public int CountryID { get; set; }
        /// <summary>
        /// Mã Tỉnh/TP
        /// </summary>
        public string Code { get; set; }

        /// <summary>
        /// Tên mở rộng
        /// "Hà Nội","TP.Hà Nội","TP. Hà Nội","TP Hà Nội","Thành phố Hà Nội","hanoi", "HN","ha noi"
        /// </summary>
        public List<string> NameExtension { get; set; }


        public int IsEnable { get; set; }


        public int RegionID { get; set; }
        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        public string UpdatedBy { get; set; }
        /// <summary>
        /// Người sửa đổi
        /// </summary>
        public string UpdatedAt { get; set; }

        /// <summary>
        /// Can Update COD
        /// true:Yes
        /// false:No
        /// </summary>
        public bool CanUpdateCOD { get; set; }

        /// <summary>
        ///Status : 1:Unlock, 2:Lock
        /// </summary>
        public int Status { get; set; }
    }
}
