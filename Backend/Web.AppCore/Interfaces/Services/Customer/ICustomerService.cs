using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities;

namespace Web.AppCore.Interfaces.Services
{
    public interface ICustomerService : IBaseDomainService
    {
        /// <summary>
        /// Lấy thông tin danh danh sách khách hàng theo điều kiện phân trang
        /// </summary>
        /// <returns></returns>
        Task<Pagging<Customer>> GetPaggingCustomer(Pagination pagination);

        /// <summary>
        /// Thêm thông tin nhiều khách hàng
        /// </summary>
        /// <param name="customers"></param>
        /// <returns></returns>
        Task<bool> InsertManyCustomersAsync(List<Customer> customers);

        /// <summary>
        /// Lấy thông tin User theo Id
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        Task<Customer> GetCustomerByIdAsync(string customerId);

        /// <summary>
        /// Lấy thông tin danh danh sách khách hàng
        /// </summary>
        /// <returns></returns>
        Task<List<Customer>> GetCustomersAsync();

        /// <summary>
        /// Lấy thông tin danh danh sách khách hàng
        /// </summary>
        /// <returns></returns>
        Task<bool> InsertCustomerAsync(Customer customer);

        /// <summary>
        /// Xóa thông tin khách hàng
        /// </summary>
        /// <returns></returns>
        Task<bool> DeleteCustomerAsync(string customerId);
        Task<bool> DeleteManyCustomerAsync(List<string> customerIds);

        /// <summary>
        /// Cập nhật thông tin khách hàng
        /// </summary>
        /// <returns></returns>
        Task<bool> UpdateCustomerAsync(string customerId, Customer customer);
    }
}
