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
        Task<bool> UpdatePaymentOrderAsync();


        /// <summary>
        /// Thêm đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        Task<bool> InsertOrderAsync(OrderRequest order);

        /// <summary>
        /// Insert đơn hàng từ queue
        /// </summary>
        /// <param name="order"></param>
        /// <param name="headers"></param>
        /// <returns></returns>
        Task<bool> InsertOrderOnQueueAsync(OrderRequest order, IDictionary<string, object> headers);

        /// <summary>
        /// Xóa đơn hàng
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        Task<bool> DeleteOrderAsync(string orderId);
        
        /// <summary>
        /// Xóa nhiều đơn hàng
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        Task<bool> DeleteOrdersAsync(IEnumerable<string> orderIds);


        /// <summary>
        /// Xóa đơn hàng
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        Task<bool> UpdateOrderAsync(Order order);


        /// <summary>
        /// Lấy danh sách đơn hàng phân trang
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        Task<Pagging<Order>> GetOrderPageAsync(Pagination pagination);


        /// <summary>
        /// Lấy thông tin chi tiết đơn hàng
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        Task<Order> GetOrderAsync(string orderId);

        Task<bool> UpdateOrderOnQueueAsync(Order order, IDictionary<string, object> headers);
    }
}
