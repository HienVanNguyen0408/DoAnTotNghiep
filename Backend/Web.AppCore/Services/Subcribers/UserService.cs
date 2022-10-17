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


        #endregion
    }
}
