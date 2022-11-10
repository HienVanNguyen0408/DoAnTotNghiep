using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    /// <summary>
    /// Thông tin của lô hàng
    /// </summary>
    public class Shipment : BaseEntity
    {
        /// <summary>
        /// Id của lô hàng
        /// </summary>
        public string ShipmentId { get; set; }
        public string ShipmentName { get; set; }

        /// <summary>
        /// Tên nhà cung cấp
        /// </summary>
        public string SupplierName { get; set; }
        public string SupplierAddress { get; set; }
        public string SupplierPhoneNumber { get; set; }

        /// <summary>
        /// Kho hàng chứa lô hàng
        /// </summary>
        public string WarehouseName { get; set; }
        public string WarehouseAddress { get; set; }
        public string WarehousePhoneNumber { get; set; }

        /// <summary>
        /// Tổng giá trị thanh toán lô hàng
        /// </summary>
        public decimal TotalAmount { get; set; }

        /// <summary>
        /// Tên người nhận hàng
        /// </summary>
        public string ReceiverName { get; set; }
        public string ReceiverAddress { get; set; }

        /// <summary>
        /// Tên người giao hàng
        /// </summary>
        public string ShipperName { get; set; }
        public string ShipperPhoneNumber { get; set; }
        public string ShipperAddress { get; set; }

        /// <summary>
        /// Xe giao hàng (mô tả tên xe, loại xe)
        /// </summary>
        public string DeliveryCar { get; set; }
        /// <summary>
        /// Biển số xe giao hàng
        /// </summary>
        public string LicensePlates { get; set; }


    }
}
