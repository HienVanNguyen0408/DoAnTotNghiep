using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web.Api.Auth;
using Web.AppCore.Interfaces.Services;
using Web.Caching;
using Web.Models.Entities;
using Web.Models.Request;

namespace Web.Api.Controllers
{

    public class UserInfoController : BaseAuthController<UserInfoController>
    {
        #region Declaration
        private const string TAG = "UserInfoController";
        protected readonly IUserService _userService;
        protected readonly IRedisCached _redisCached;
        protected readonly IJwtAuthencationManager _jwtAuthencation;
        #endregion

        #region Contructor
        public UserInfoController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _userService = GetRequiredService<IUserService>();
            _jwtAuthencation = GetRequiredService<IJwtAuthencationManager>();
            _redisCached = GetRequiredService<IRedisCached>();
        }
        #endregion

        #region Methods

        /// <summary>
        /// Lấy danh sách user
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IEnumerable<User>> GetUsersAsync()
        {
            try
            {
                // Danh sách user
                var users = await _userService.GetUsersAsync();
                return users;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetUsersAsync::Exception::{ex.Message}");
                return null;
            }
        }

         /// <summary>
        /// Lấy danh sách user
        /// </summary>
        /// <returns></returns>
        [HttpPost("pagging")]
        public async Task<Pagging<User>> GetUserPageAsync([FromBody] Pagination pagination)
        {
            try
            {
                //Danh sách user phân trang
                var pageResult = await _userService.GetUserPageAsync(pagination);
                return pageResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetUserPageAsync::Exception::{ex.Message}");
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
                var res = await _userService.InsertUserAsync(user);
                return res;
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
        public async Task<bool> DeleteUserAsync([FromBody] List<string> userIds)
        {
            try
            {
                //Xóa user
                await _userService.DeleteUserAsync(userIds);
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
        [HttpPost("update")]
        public async Task<bool> UpdateUserAsync(string userId, [FromBody] User user)
        {
            try
            {
                //Sửa 
                var updateRes = await _userService.UpdateUserAsync(userId, user);
                return updateRes;
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
                var res = await _userService.InsertUserAsync(user: request);
                return res;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm RegiterUserAsync::Exception::{ex.Message}");
                return false;
            }
        }
        #endregion
    }
}
