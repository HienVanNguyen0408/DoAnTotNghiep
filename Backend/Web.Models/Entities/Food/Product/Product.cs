using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class Product : BaseEntity
    {
        public string ProductId { get; set; } = GenerateNewId();
        /// <summary>
        /// Mã sản phẩm
        /// </summary>
        public string ProductCode { get; set; }

        /// <summary>
        /// Tên sản phẩm
        /// </summary>
        public string ProductName { get; set; }
        /// <summary>
        /// Mô tả sản phẩm
        /// </summary>
        public string ProductDescription { get; set; }

        /// <summary>
        /// Id lô hàng
        /// </summary>
        public string ShipmentId{ get; set; }

        public string Shipment{ get; set; }

        /// <summary>
        /// Ngày hết hạn
        /// </summary>
        public DateTime ExpiredDate { get; set; }
        /// <summary>
        /// Ngày sản xuất
        /// </summary>
        public DateTime ManufactureDate { get; set; }

        /// <summary>
        /// Số lượng tồn(còn lại trong kho, cửa hàng)
        /// </summary>
        public long QuantityStock { get; set; }

        /// <summary>
        /// Giá gốc(giá nhập vào)
        /// </summary>
        public decimal OriginalPrice { get; set; }
        /// <summary>
        /// Giá bán
        /// </summary>
        public decimal SalePrice { get; set; }

        /// <summary>
        /// Tiền thuế
        /// </summary>
        public decimal? VatAmount { get; set; }
        /// <summary>
        /// Thuế suất
        /// </summary>
        public decimal? VatRate { get; set; }


        /// <summary>
        /// Tiền chiết khấu
        /// </summary>
        public decimal? DiscountAmount { get; set; }
        /// <summary>
        /// Tỷ lệ chiết khấu
        /// </summary>
        public string DiscountRate { get; set; }

        /// <summary>
        /// Chiều cao của sản phẩm
        /// đơn vị cm
        /// </summary>
        public decimal? Height { get; set; }
        /// <summary>
        /// Chiều rộng của sản phẩm
        /// đơn vị cm
        /// </summary>
        public decimal? Width { get; set; }
        /// <summary>
        /// Cân nặng của sản phẩm
        /// đơn vị cm
        /// </summary>
        public decimal? Weight { get; set; }

        /// <summary>
        /// Thông tin đơn vị sản phẩm
        /// </summary>
        public UnitProduct UnitInfo { get; set; }
    }
}
