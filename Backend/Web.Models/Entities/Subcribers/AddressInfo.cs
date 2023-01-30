using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class AddressInfo : BaseEntity
    {
        public string user_id { get; set; }
        /// <summary>
        /// Địa chỉ mặc định
        /// </summary>
        public bool is_default { get; set; }
        /// <summary>
        /// Họ tên đầy đủ
        /// </summary>
        public string full_name { get; set; }

        /// <summary>
        /// Địa chỉ
        /// </summary>
        public string address { get; set; }

        /// <summary>
        /// Số điện thoại
        /// </summary>
        public string phone_number { get; set; }
        /// <summary>
        /// Tỉnh thành phố
        /// </summary>
        public string province { get; set; }
        /// <summary>
        /// Quận huyện
        /// </summary> 
        public string district { get; set; }
        public int district_id { get; set; }
        /// <summary>
        /// Xã phường
        /// </summary>
        public string ward { get; set; }
        public string ward_code { get; set; }

        public string address_info
        {
            get
            {
                if (string.IsNullOrEmpty(ward) || string.IsNullOrEmpty(district) || string.IsNullOrEmpty(province) || string.IsNullOrEmpty(address)) return string.Empty;
                return $"{address}, {ward}, {district}, {province}";
            }
        }
    }
}
