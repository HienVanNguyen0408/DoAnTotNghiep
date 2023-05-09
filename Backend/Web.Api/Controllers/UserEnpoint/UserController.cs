using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using Web.Api.Auth;
using Web.AppCore.Entities;
using Web.AppCore.Interfaces.Services;
using Web.Caching;
using Web.Models.Entities;
using Web.Models.Enums.Subcribers;
using Web.Models.Request;
using Web.Models.Respone;
using Web.Storage;
using Web.Utils;

namespace Web.Api.Controllers
{
    [Authorize]
    public class UserController : BaseAuthController<UserController>
    {
        #region Declaration
        private const string TAG = "UserInfoController";
        protected readonly IUserService _userService;
        protected readonly IRedisCached _redisCached;
        protected readonly IJwtAuthencationManager _jwtAuthencation;
        protected readonly IStorageClient _storageClient;
        protected readonly IAddressInfoService _addressInfoService;
        #endregion

        #region Contructor
        public UserController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _userService = GetRequiredService<IUserService>();
            _jwtAuthencation = GetRequiredService<IJwtAuthencationManager>();
            _redisCached = GetRequiredService<IRedisCached>();
            _storageClient = GetRequiredService<IStorageClient>();
            _addressInfoService = GetRequiredService<IAddressInfoService>();
        }
        #endregion

        #region Methods

        /// <summary>
        /// Lấy danh sách user
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<ServiceResult<IEnumerable<User>>> GetUsersAsync()
        {
            var svcResult = new ServiceResult<IEnumerable<User>>();
            try
            {
                // Danh sách user
                var users = await _userService.GetUsersAsync();
                svcResult = new ServiceResult<IEnumerable<User>>
                {
                    Data = users,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetUsersAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Lấy danh sách user
        /// </summary>
        /// <returns></returns>
        [HttpPost("pagging")]
        public async Task<ServiceResult<Pagging<User>>> GetUserPageAsync([FromBody] Pagination pagination)
        {
            var svcResult = new ServiceResult<Pagging<User>>();
            try
            {
                //Danh sách user phân trang
                var pageResult = await _userService.GetUserPageAsync(pagination);
                svcResult = new ServiceResult<Pagging<User>>
                {
                    Data = pageResult,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetUserPageAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Thêm thông tin user
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost("insert")]
        public async Task<ServiceResult<bool>> InsertUserAsync([FromBody] User user)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                //Thêm user
                var resInsert = await _userService.InsertUserAsync(user);
                svcResult = new ServiceResult<bool>
                {
                    Data = resInsert,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertUserAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Xóa thông tin user
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost("delete")]
        public async Task<ServiceResult<bool>> DeleteUserAsync([FromBody] List<string> userIds)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                //Xóa user
                var resDelete = await _userService.DeleteUserAsync(userIds);
                svcResult = new ServiceResult<bool>
                {
                    Data = resDelete,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteUserAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Sửa thông tin user
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost("update")]
        public async Task<ServiceResult<bool>> UpdateUserAsync([FromBody] User user)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                //Sửa 
                var resUpdate = await _userService.UpdateUserAsync(user);
                svcResult = new ServiceResult<bool>
                {
                    Data = resUpdate,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateUserAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        [AllowAnonymous]
        [HttpPost("authenticate")]
        public async Task<ServiceResult<string>> AutheticateAsync([FromBody] UserRequest request)
        {
            var svcResult = new ServiceResult<string>();
            try
            {
                var authen = await _jwtAuthencation.Autheticate(request);
                svcResult = new ServiceResult<string>
                {
                    Data = authen,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm LoginUser::Exception::{ex.Message}");
                return svcResult;
            }
        }

        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<ServiceResult<UserRespone>> LoginUser([FromBody] UserRequest user)
        {
            var svcResult = new ServiceResult<UserRespone>();
            try
            {
                var authen = await _jwtAuthencation.Autheticate(user);
                if (authen.IsNullOrEmptyOrWhiteSpace())
                {
                    svcResult.Status = ServiceResultStatus.Authorized;
                    svcResult.Message = "Tài khoản hoặc mật khẩu không đúng";
                    return svcResult;
                }

                var userDB = await _userService.GetUserByUserNameAsync(user.user_name);
                if (userDB == null)
                {
                    svcResult.Message = "Đăng nhập thất bại";
                    svcResult.Status = ServiceResultStatus.NotFound;
                    return svcResult;
                }

                svcResult.Data = MapperExtensions.MapperData<User, UserRespone>(userDB);
                svcResult.Data.key_auth = authen;
                svcResult = new ServiceResult<UserRespone>
                {
                    Data = svcResult.Data,
                    Success = true,
                    Status = ServiceResultStatus.Ok,
                    Message = "Đăng nhập thành công"
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                svcResult.Message = "Vui lòng liên hệ VHSTORE để được hỗ trợ";
                _logger.LogError($"{TAG}::Lỗi hàm LoginUser::Exception::{ex.Message}");
                return svcResult;
            }
        }

        [AllowAnonymous]
        /// <summary>
        /// Đăng kí tài khoản
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("register")]
        public async Task<ServiceResult<InsertStatus>> RegiterUserAsync([FromBody] UserRequest request)
        {
            var svcResult = new ServiceResult<InsertStatus>();
            try
            {
                var user = await _userService.GetUserByUserNameAsync(request.user_name);
                if (user != null)
                {
                    svcResult.Data = InsertStatus.Duplicate;
                    svcResult.Message = "Tài khoản đã tồn tại";
                    return svcResult;
                }
                var resRegister = await _userService.InsertUserAsync(user: request);

                svcResult = new ServiceResult<InsertStatus>
                {
                    Data = resRegister ? InsertStatus.Success : InsertStatus.Fail,
                    Success = true,
                    Status = ServiceResultStatus.Ok,
                    Message = resRegister ? "Đăng ký thành công" : "Đăng ký thất bại"
                };
            }
            catch (Exception ex)
            {
                svcResult.Data = InsertStatus.Unknow;
                _logger.LogError($"{TAG}::Lỗi hàm RegiterUserAsync::Exception::{ex.Message}");
                svcResult.Message = "Vui lòng liên hệ VHSTORE để được hỗ trợ";
            }
            return svcResult;
        }

        [AllowAnonymous]
        /// <summary>
        /// Danh sách các địa chỉ của người dùng
        /// </summary>
        /// <returns></returns>
        [HttpGet("addressinfos/{userId}")]
        public async Task<ServiceResult<List<AddressInfo>>> GetAddressInfosAsync(string userId)
        {
            var svcResult = new ServiceResult<List<AddressInfo>>();
            try
            {
                var addresInfos = await _addressInfoService.GetAddressInfos(userId);
                svcResult = new ServiceResult<List<AddressInfo>>
                {
                    Data = addresInfos,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetAddressInfosAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Thông tin địa chỉ theo id
        /// </summary>
        /// <returns></returns>
        [HttpGet("addressinfo/{id}")]
        public async Task<ServiceResult<AddressInfo>> GetAddressInfoAsync(string id)
        {
            var svcResult = new ServiceResult<AddressInfo>();
            try
            {
                var addresInfo = await _addressInfoService.GetAddressInfo(id);
                svcResult = new ServiceResult<AddressInfo>
                {
                    Data = addresInfo,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetAddressInfoAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Thêm địa chỉ
        /// </summary>
        /// <returns></returns>
        [HttpPost("insertaddress")]
        public async Task<ServiceResult<bool>> InsertAddressInfoAsync([FromBody] AddressInfo addressInfo)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var result = await _addressInfoService.InsertAddressInfo(addressInfo);
                svcResult = new ServiceResult<bool>
                {
                    Data = result,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertAddressInfoAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Cập nhật địa chỉa
        /// </summary>
        /// <returns></returns>
        [HttpPost("updateaddress")]
        public async Task<ServiceResult<bool>> UpdateAddressInfoAsync([FromBody] AddressInfo addressInfo)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var result = await _addressInfoService.UpdateAddressInfo(addressInfo);
                svcResult = new ServiceResult<bool>
                {
                    Data = result,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateAddressInfoAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Cập nhật địa chỉa
        /// </summary>
        /// <returns></returns>
        [HttpPost("deleteaddress/{id}")]
        public async Task<ServiceResult<bool>> DeleteAddressInfoAsync(string id)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var result = await _addressInfoService.DeleteAddressInfo(id);
                svcResult = new ServiceResult<bool>
                {
                    Data = result,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteAddressInfoAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        [HttpGet("setdefault/{userid}/{id}")]
        public async Task<ServiceResult<bool>> SetDefaultAddressAsync(string userId, string id, [FromQuery] bool isDefault)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var result = await _addressInfoService.SetDefaultAddress(userId, id, isDefault);
                svcResult = new ServiceResult<bool>
                {
                    Data = result,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm SetDefaultAddressAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        [HttpGet("addressdefault/{userid}")]
        public async Task<ServiceResult<AddressInfo>> GetAddressDefaultAsync(string userId)
        {
            var svcResult = new ServiceResult<AddressInfo>();
            try
            {
                var result = await _addressInfoService.GetAddressInfoDefault(userId);
                svcResult = new ServiceResult<AddressInfo>
                {
                    Data = result,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetAddressDefaultAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }
        #endregion
    }
}