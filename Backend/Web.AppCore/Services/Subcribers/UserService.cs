using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;
using Web.Utils;

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
                var userInsert = await _userUoW.Users.InsertOneAsync(user);
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

        public async Task<bool> DeleteUserAsync(List<string> userIds)
        {
            try
            {
                var users = await _userUoW.Users.GetByIdsAsync(userIds);
                await _userUoW.Users.DeleteManyAsync(users);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteUserAsync::Exception::{ex.Message}::FromData::{JsonUtils.Serialize(userIds)}");
                return false;
            }
        }

        public async Task<bool> UpdateUserAsync(User user)
        {
            return await _userUoW.Users.UpdateOneAsync(user);
        }

        public async Task<Pagging<User>> GetUserPageAsync(Pagination pagination)
        {
            if (pagination.Filter.IsNullOrEmptyOrWhiteSpace())
            {
                return await _userUoW.Users.GetPaggingAsync(pagination);
            }
            return await _userUoW.Users.GetPaggingAsync(pagination,
                                                            x => x.user_name.ContainsText(pagination.Filter)
                                                            || x.address.ContainsText(pagination.Filter)
                                                            || x.full_name.ContainsText(pagination.Filter)
                                                            || x.phone_number.ContainsText(pagination.Filter));
        }

        public async Task<User> GetUserByUserNameAsync(string userName)
        {
            var users = await _userUoW.Users.GetAllAsync(x => x.user_name.Equals(userName));
            if (users.CountExt() <= 0) return null;
            return users.FirstOrDefault();
        }
        #endregion
    }
}
