using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities.GHN
{
    public class OrderInfo
    {
        public int shop_id { get; set; }
        public int ShopId => shop_id;

        public int client_id { get; set; }
        public int ClientId => client_id;

        public string return_name { get; set; }
        public string ReturnName => return_name;

        public string return_phone { get; set; }
        public string ReturnPhone => return_phone;

        public string return_address { get; set; }
        public string ReturnAddress => return_address;

        public string return_ward_code { get; set; }
        public string ReturnWardCode => return_ward_code;
        public int return_district_id { get; set; }
        public int ReturnDistrictId => return_district_id;

        public string from_name { get; set; }
        public string FromName => from_name;

        public string from_phone { get; set; }
        public string FromPhone => from_phone;

        public string from_address { get; set; }
        public string FromAddress => from_address;

        public string from_ward_code { get; set; }
        public string FromWardCode => from_ward_code;

        public int from_district_id { get; set; }
        public int FromDistrictId => from_district_id;
        public int deliver_station_id { get; set; }
        public int DeliverStationId => deliver_station_id;

        public string to_name { get; set; }
        public string ToName => to_name;

        public string to_phone { get; set; }
        public string ToPhone => to_phone;

        public string to_address { get; set; }
        public string ToAddress => to_address;

        public string to_ward_code { get; set; }
        public string ToWardCode => to_ward_code;

        public int to_district_id { get; set; }
        public int ToDistrictId => to_district_id;

        public int weight { get; set; }
        public int Weight => weight;

        public int length { get; set; }
        public int Length => length;

        public int width { get; set; }
        public int Width => width;

        public int height { get; set; }
        public int Height => height;

        public int converted_weight { get; set; }
        public int ConvertedWeight => converted_weight;

        public int service_type_id { get; set; }
        public int ServiceTypeId => payment_type_id;

        public int service_id { get; set; }
        public int Service_id => service_id;

        public int payment_type_id { get; set; }
        public int PaymentTypeId => payment_type_id;

        public int custom_service_fee { get; set; }
        public int CustomServiceFee => custom_service_fee;

        public decimal cod_amount { get; set; }
        public decimal CodAmount => cod_amount;

        public DateTime? cod_collect_date { get; set; }
        public DateTime? CodCollectDate => cod_collect_date;

        public DateTime? cod_transfer_date { get; set; }
        public DateTime? CodTransferDate => cod_transfer_date;

        public bool is_cod_transferred { get; set; }
        public bool IsCodTransferred => is_cod_transferred;

        public bool is_cod_collected { get; set; }
        public bool IsCodCollected => is_cod_collected;

        public decimal insurance_value { get; set; }
        public decimal InsuranceValue => insurance_value;

        public int order_value { get; set; }
        public int OrderValue => order_value;

        public int pick_station_id { get; set; }
        public int PickStationId => pick_station_id;

        public string client_order_code { get; set; }
        public string ClientOrderCode => client_order_code;

        public string required_note { get; set; }
        public string RequiredNote => client_order_code;

        public string content { get; set; }
        public string Content => content;

        public string note { get; set; }
        public string Note => note;

        public string employee_note { get; set; }
        public string Employee_note => employee_note;

        public string coupon { get; set; }
        public string Coupon => coupon;

        public string _id { get; set; }
        public string Id => _id;

        public string order_code { get; set; }
        public string OrderCode => order_code;

        public string version_no { get; set; }
        public string VersionNo => version_no;

        public string updated_ip { get; set; }
        public string UpdatedIp => updated_ip;

        public string updated_employee { get; set; }
        public string UpdatedEmployee => updated_employee;

        public string updated_client { get; set; }
        public string UpdatedClient => updated_client;

         public string updated_source { get; set; }
        public string UpdatedSource => updated_source;

        public string updated_date { get; set; }
        public string UpdatedDate => updated_date;
        
        public int updated_warehouse { get; set; }
        public int UpdatedWarehouse => updated_warehouse;

        public string created_ip { get; set; }
        public string CreatedIp => created_ip;
        
        public int created_employee { get; set; }
        public int CreatedEmployee => created_employee;

        public int created_client { get; set; }
        public int CreatedClient => created_client;
        
        public string created_source { get; set; }
        public string CreatedSource => created_source;

        public string created_date { get; set; }
        public string CreatedDate => created_date;
        
        public string status { get; set; }
        public string Status => status;

        public int pick_warehouse_id { get; set; }
        public int PickWarehouseId => pick_warehouse_id;

        public int deliver_warehouse_id { get; set; }
        public int DeliverWarehouseId => deliver_warehouse_id;

        public int current_warehouse_id { get; set; }
        public int CurrentWarehouseId => current_warehouse_id;

        public int return_warehouse_id { get; set; }
        public int ReturnWarehouseId => return_warehouse_id;

        public int next_warehouse_id { get; set; }
        public int NextWarehouseId => next_warehouse_id; 
        
        public string leadtime { get; set; }
        public string Leadtime => leadtime;

        public string order_date { get; set; }
        public string OrderDate => order_date;

        public string soc_id { get; set; }
        public string SocId => soc_id;

        public string finish_date { get; set; }
        public string FinishDate => finish_date;
        
        public List<string> tag { get; set; }
        public List<string> Tag => tag;
    }
}
