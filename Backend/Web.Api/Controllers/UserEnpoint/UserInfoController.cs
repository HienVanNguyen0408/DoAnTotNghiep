using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web.Api.Auth;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;
using Web.Models.Request;

namespace Web.Api.Controllers
{

    public class UserInfoController : BaseAuthController<UserInfoController>
    {
        #region Declaration
        private const string TAG = "UserInfoController";
        protected readonly IUserService _userService;
        protected readonly IJwtAuthencationManager _jwtAuthencation;
        protected readonly IMongoCollection<User> _collection;
        #endregion

        #region Contructor
        public UserInfoController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _userService = GetRequiredService<IUserService>();
            _jwtAuthencation = GetRequiredService<IJwtAuthencationManager>();
        }
        #endregion

        #region Methods

        /// <summary>
        /// Lấy danh sách user
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<List<User>> GetUsersAsync()
        {
            try
            {
                // Danh sách user
                var users = await _collection.Find(x => true).ToListAsync();
                return users;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetUsersAsync::Exception::{ex.Message}");
                return null;
            }
        }

        /// <summary>
        /// Danh sách user theo điều kiện tìm kiếm
        /// </summary>
        /// <returns></returns>
        [HttpGet("filter")]
        public async Task<List<User>> GetUsersFilterAsync(string textSearch)
        {
            try
            {
                //Đánh index phục vụ việc tìm kiếm full text seach hiệu quả hơn
                _collection.Indexes.CreateOneAsync(Builders<User>.IndexKeys.Text(x => x.UserName));
                _collection.Indexes.CreateOne(Builders<User>.IndexKeys.Text(x => x.FullName));
                _collection.Indexes.CreateOne(Builders<User>.IndexKeys.Text(x => x.PhoneNumber));
                _collection.Indexes.CreateOne(Builders<User>.IndexKeys.Text(x => x.Address));
                var filter = Builders<User>.Filter.Text($"{textSearch}");
                // Danh sách user
                var users = await _collection.Find(filter).ToListAsync();
                return users;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetUsersFilterAsync::Exception::{ex.Message}");
                return null;
            }
        }

        /// <summary>
        /// Lấy thông tin user theo user name
        /// </summary>
        /// <returns></returns>
        [HttpGet("username/{userName}")]
        public async Task<User> GetUserByUserNameAsync(string userName)
        {
            try
            {
                var filter = Builders<User>.Filter.Eq(x => x.UserName, userName);
                // Danh sách user
                var user = await _collection.Find(filter).FirstOrDefaultAsync();
                return user;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetUserByUserNameAsync::Exception::{ex.Message}");
                return null;
            }
        }

        /// <summary>
        /// Thêm thông tin user
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost("insert")]
        public async Task<bool> InsertUserAsync([FromBody] User user)
        {
            try
            {
                //Thêm user
                await _collection.InsertOneAsync(user);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertUserAsync::Exception::{ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Xóa thông tin user
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost("delete")]
        public async Task<bool> DeleteUserAsync(string userId)
        {
            try
            {
                var filter = Builders<User>.Filter.Eq(x => x.UserId, userId);
                //Thêm user
                await _collection.DeleteOneAsync(filter);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteUserAsync::Exception::{ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Sửa thông tin user
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost("update/{userId}")]
        public async Task<bool> UpdateUserAsync(string userId, [FromBody] User user)
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
                //Sửa 
                var updateRes = await _collection.UpdateOneAsync(filter, updateDefinition);
                return updateRes.ModifiedCount == 1;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateUserAsync::Exception::{ex.Message}");
                return false;
            }
        }


        [HttpPost("authenticate")]
        public async Task<string> AutheticateAsync([FromBody] UserRequest request)
        {
            try
            {
                var authen = await _jwtAuthencation.Autheticate(request);
                return authen;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm LoginUser::Exception::{ex.Message}");
                return String.Empty;
            }
        }

        [HttpPost("login")]
        public async Task<bool> LoginUser([FromBody] UserRequest request)
        {
            try
            {
                var authen = await _jwtAuthencation.Autheticate(request);
                return !string.IsNullOrEmpty(authen);
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm LoginUser::Exception::{ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Đăng kí tài khoản
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("register")]
        public async Task<bool> RegiterUserAsync([FromBody] UserRequest request)
        {
            try
            {
                var authen = await _jwtAuthencation.Autheticate(request);
                return !string.IsNullOrEmpty(authen);
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm LoginUser::Exception::{ex.Message}");
                return false;
            }
        }
        #endregion
    }
}
