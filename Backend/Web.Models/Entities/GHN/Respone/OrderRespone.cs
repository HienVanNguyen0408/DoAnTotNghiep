using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities.GHN
{
    public class OrderRespone
    {
        public string district_encode { get; set; }
        public string DistrictEncode => district_encode;

        /// <summary>
        /// Thời gian giao hàng dự kiến.
        /// </summary>
        public string expected_delivery_time { get; set; }
        public string ExpectedDeliveryTime => expected_delivery_time;

        /// <summary>
        /// Thông tin phí
        /// </summary>
        public OrderFeeInfo fee { get; set; }
        public OrderFeeInfo Fee => fee;

        /// <summary>
        /// Mã đơn hàng
        /// </summary>
        public string order_code { get; set; }
        public string OrderCode => order_code;

        public string sort_code { get; set; }
        public string SortCode => sort_code;

        /// <summary>
        /// Tổng phí
        /// </summary>
        public string total_fee { get; set; }
        public decimal TotalFee => string.IsNullOrEmpty(total_fee) ? 0 : decimal.Parse(total_fee);

        /// <summary>
        /// Loại hình vận chuyển
        /// </summary>
        public string trans_type { get; set; }
        public string TransType => trans_type;

        public string ward_encode { get; set; }
        public string WardEncode => ward_encode;

    }
    public class OrderFeeInfo
    {
        /// <summary>
        /// Mã phiếu giảm giá để giảm giá
        /// </summary>
        public int coupon { get; set; }
        public int Coupon => coupon;

        /// <summary>
        /// Giá trị bảo hiểm
        /// </summary>
        public decimal insurance { get; set; }
        public decimal Insurance => insurance;

        /// <summary>
        /// Service fee : tiền phí
        /// </summary>
        public decimal main_service { get; set; }


        public int r2s { get; set; }
        public int R2s  => r2s;

        public int station_do { get; set; }
        public int StationDo => station_do;
        //public int return { get; set; }


        public int station_pu { get; set; }
        public int StationPu => station_do;
    }

    public class OrderCancelRespone
    {
        public string order_code { get; set; }
        public string OrderCode => order_code; 
        
        public bool result { get; set; }
        public bool Result => result;
        
        public string message { get; set; }
        public String Message => message;

        /// <summary>
        /// Hủy đơn hàng thành công hay không
        /// </summary>
        public bool IsSuccess => result && message.Equals("OK",StringComparison.OrdinalIgnoreCase);
    }

    public class LeadTimeRespone
    {
        /// <summary>
        /// Thời gian giao hàng dự kiến
        /// </summary>
        public int leadtime { get; set; }
        public DateTime? LeadTime => leadtime > 0 ? DateTime.Parse($"{leadtime}") : (DateTime?) null;

        /// <summary>
        /// Ngày tạo đơn hàng
        /// </summary>
        public int order_date { get; set; }
        public DateTime? OrderDate => order_date > 0 ? DateTime.Parse($"{order_date}") : (DateTime?)null;

    }

    public class FeeInfo
    {
        public int total { get; set; }
        public int service_fee { get; set; }
        public int insurance_fee { get; set; }
        public int pick_station_fee { get; set; }
        public int coupon_value { get; set; }
        public int document_return { get; set; }
        public int double_check { get; set; }
        public int cod_fee { get; set; }
        public int pick_remote_areas_fee { get; set; }
        public int deliver_remote_areas_fee { get; set; }
        public int cod_failed_fee { get; set; }
    }
    
    public class LeadTimeInfo
    {
        public int leadtime { get; set; }
        public int order_date { get; set; }
    }
}
