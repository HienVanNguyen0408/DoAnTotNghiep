using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities;
using Web.Models.Request;

namespace Web.AppCore.Interfaces.Services
{
    public interface IOrderService : IBaseDomainService
    {
        Task<bool> UpdateOrderAsync();
        Task<bool> UpdatePaymentOrderAsync();


        /// <summary>
        /// Thêm đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        Task<bool> InsertOrderAsync(OrderRequest order);

        /// <summary>
        /// Xóa đơn hàng
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        Task<bool> DeleteOrderAsync(string orderId);


        /// <summary>
        /// Xóa đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        Task<bool> UpdateOrderAsync(Order order);
    }
}
