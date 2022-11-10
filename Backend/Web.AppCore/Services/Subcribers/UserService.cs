using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;

namespace Web.AppCore.Services
{
    public class UserService : BaseDomainService<UserService>, IUserService
    {
        #region Declaration
        private const string TAG = "UserService";
        protected readonly IUserUoW _userUoW;
        #endregion
        #region Contructor
        public UserService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _userUoW = serviceProvider.GetRequiredService<IUserUoW>();
        }

        #endregion

        #region Properties

        #endregion

        #region Methods
        /// <summary>
        /// Lấy thông tin user theo Id
        /// </summary>
        /// <param name="id">Id của user</param>
        /// <returns></returns>
        public async Task<User> GetUserByIdAsync(string id)
        {
            var user = await _userUoW.Users.GetByIdAsync(id);
            return user;
        }

        public async Task<IEnumerable<User>> GetUsersAsync()
        {
            var users = await _userUoW.Users.GetAllAsync();
            return users;
        }

        public async Task<bool> InsertUserAsync(User user)
        {
            try
            {
                await _userUoW.Users.InsertOneAsync(user);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertUserAsync::Exception::{ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Xóa thông tin người dùng
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public async Task<bool> DeleteUserAsync(string userId)
        {
            try
            {
                var user = await _userUoW.Users.GetByIdAsync(userId);
                await _userUoW.Users.DeleteOneAsync(user);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteUserAsync::Exception::{ex.Message}");
                return false;
            }
        }

        public Task<bool> UpdateUserAsync(string userId, User user)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
