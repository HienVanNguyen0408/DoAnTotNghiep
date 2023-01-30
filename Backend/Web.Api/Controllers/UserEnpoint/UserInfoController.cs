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
using Web.Models.Request;
using Web.Models.Respone;
using Web.Storage;
using Web.Utils;

namespace Web.Api.Controllers
{

    public class UserInfoController : BaseAuthController<UserInfoController>
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
        public UserInfoController(IServiceProvider serviceProvider) : base(serviceProvider)
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

        [HttpPost("login")]
        public async Task<ServiceResult<UserRespone>> LoginUser([FromBody] UserRequest request)
        {
            var svcResult = new ServiceResult<UserRespone>();
            try
            {
                var authen = await _jwtAuthencation.Autheticate(request);
                if (authen.IsNullOrEmptyOrWhiteSpace()) return svcResult;

                var userRespone = new UserRespone();
                var user = await _userService.GetUserByUserNameAsync(request.user_name);
                if (user == null) return svcResult;

                userRespone = MapperExtensions.MapperData<User, UserRespone>(user);
                userRespone.key_auth = authen;
                svcResult = new ServiceResult<UserRespone>
                {
                    Data = userRespone,
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

        /// <summary>
        /// Đăng kí tài khoản
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost("register")]
        public async Task<ServiceResult<bool>> RegiterUserAsync([FromBody] UserRequest request)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var resRegister = await _userService.InsertUserAsync(user: request);
                svcResult = new ServiceResult<bool>
                {
                    Data = resRegister,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm RegiterUserAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        [HttpPost("testminio")]
        public async Task<bool> TestMinIO()
        {
            var file = System.IO.File.ReadAllBytes(@"C:\Users\HienVanNguyen\Pictures\icon_hud4b034c4f7a5c231da985da63cf83ade_53523_512x512_fill_lanczos_center_2.png");
            var fullPath = GlobalConstant.GetFullPathTemplate("product", "filetest.png");
            var xxx = await _storageClient.UploadFileAsync(fullPath, file);
            return true;
        }

        [HttpGet("getpath")]
        public async Task<string> GetPath([FromQuery] string fullPath)
        {
            var xxx = await _storageClient.GetPathFileDownloadAsync(fullPath);
            var data = await _storageClient.DownloadFileAsync(fullPath);
            System.IO.File.WriteAllBytes(@"C:\Users\HienVanNguyen\Pictures\abc.png", data);
            return xxx;
        }

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