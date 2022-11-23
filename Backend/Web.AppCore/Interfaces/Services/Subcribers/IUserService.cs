using System.Collections.Generic;
using System.Threading.Tasks;
using Web.Models.Entities;

namespace Web.AppCore.Interfaces.Services
{
    public interface IUserService
    {
        /// <summary>
        /// Lấy thông tin User theo Id
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        Task<User> GetUserByIdAsync(string userId);

        /// <summary>
        /// Lấy thông tin danh sách user
        /// </summary>
        /// <returns></returns>
        Task<IEnumerable<User>> GetUsersAsync(); 
        
        /// <summary>
        /// Lấy thông tin danh sách user phân trang
        /// </summary>
        /// <returns></returns>
        Task<Pagging<User>> GetUserPageAsync(Pagination pagination);

        /// <summary>
        /// Lấy thông tin danh sách user
        /// </summary>
        /// <returns></returns>
        Task<bool> InsertUserAsync(User user);

        /// <summary>
        /// Xóa thông tin người dùng
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        Task<bool> DeleteUserAsync(string userId);

        /// <summary>
        /// Xóa thông tin người dùng
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        Task<bool> DeleteUserAsync(List<string> userIds);

        /// <summary>
        /// Cập nhật thông tin người dùng
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        Task<bool> UpdateUserAsync(string userId, User user);
    }
}
