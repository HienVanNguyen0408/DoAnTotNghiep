using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;
using Microsoft.Extensions.DependencyInjection;
using MongoDB.Driver;
using Microsoft.Extensions.Logging;

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
        /// <param name="userId">Id của user</param>
        /// <returns></returns>
        public async Task<User> GetUserByIdAsync(string userId)
        {
            var user = await _userUoW.Users.GetByIdAsync(userId);
            return user;
        }

        public async Task<List<User>> GetUsersAsync()
        {
            FilterDefinition<User> filter = Builders<User>.Filter.Where(x => true);
            var users = await _userUoW.Users.GetAllAsync(filter);
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

        public Task<List<User>> GetUsersAsync(FilterDefinition<User> filterDefinition)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Cập nhật thông tin người dùng
        /// </summary>
        /// <param name="userId">Id của user</param>
        /// <param name="user"></param>
        /// <returns></returns>
        public async Task<bool> UpdateUserAsync(string userId, User user)
        {
            try
            {
                var filter = Builders<User>.Filter.Eq(x => x.UserId, userId);
                UpdateDefinition<User> updateDefinition = null;
                updateDefinition = updateDefinition
                                    .Set(s => s.ModifiedDate, DateTime.Now)
                                    .Set(s => s.UserName, user.UserName)
                                    .Set(s => s.Password, user.Password)
                                    .Set(s => s.FullName, user.FullName)
                                    .Set(s => s.Address, user.Address)
                                    .Set(s => s.PhoneNumber, user.PhoneNumber)
                                    .Set(s => s.Email, user.Email)
                                    .Set(s => s.RoleType, user.RoleType);
                var resUpdate = await _userUoW.Users.UpdateOneAsync(filter, updateDefinition);
                return resUpdate;
            }
            catch (Exception)
            {
                return false;
            }
        }


        #endregion
    }
}
