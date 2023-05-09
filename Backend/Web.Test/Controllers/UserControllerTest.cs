using Microsoft.Extensions.DependencyInjection;
using Moq;
using NUnit.Framework;
using PostgresDBData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Api.Auth;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Services;
using Web.Caching;
using Web.Models.Entities;
using Web.Models.Enums;
using Web.Models.Request;
using Web.Storage;
using Web.Test.Services;
using Web.Api.Controllers;
using Web.AppCore.Entities;
using Web.Models.Respone;
using Web.Models.Enums.Subcribers;

namespace Web.Test.Controllers
{
    public class UserControllerTest : BaseControllerTest<UserController>
    {

        protected UserController _targetController;
        protected Mock<IUserService> _userService;
        protected Mock<IRedisCached> _redisCached;
        protected Mock<IJwtAuthencationManager> _jwtAuthencation;
        protected Mock<IStorageClient> _storageClient;
        protected Mock<IAddressInfoService> _addressInfoService;

        [SetUp]
        public override void SetUp()
        {
            base.SetUp();
            _userService = new Mock<IUserService>();
            _redisCached = new Mock<IRedisCached>();
            _jwtAuthencation = new Mock<IJwtAuthencationManager>();
            _storageClient = new Mock<IStorageClient>();
            _addressInfoService = new Mock<IAddressInfoService>();

            _serviceProvider.Setup(x => x.GetService(typeof(IUserService))).Returns(_userService.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IRedisCached))).Returns(_redisCached.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IJwtAuthencationManager))).Returns(_jwtAuthencation.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IStorageClient))).Returns(_storageClient.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IAddressInfoService))).Returns(_addressInfoService.Object);

            _targetController = new UserController(_serviceProvider.Object);
        }

        #region Methods
        #region GetUsersAsync
        [Test]
        public async Task GetUsersAsync_Success()
        {
            // Arrange
            var svcResult = new ServiceResult<IEnumerable<User>>()
            {
                Success = true
            };

            var users = new List<User>();
            _userService
                .Setup(x => x.GetUsersAsync())
                .Returns(Task.FromResult(users.AsEnumerable()));
            // Act
            var res = await _targetController.GetUsersAsync();

            // Assert
            Assert.True(res != null && res.Success == svcResult.Success);
        }

        #endregion

        #region GetUserPageAsync
        [Test]
        public async Task GetUserPageAsync_Success()
        {
            var svcResult = new ServiceResult<Pagging<User>>() { Success = true };
            var paggingUser = new Pagging<User>();

            _userService
                .Setup(x => x.GetUserPageAsync(It.IsAny<Pagination>()))
                .Returns(Task.FromResult(paggingUser));
            // Act
            var res = await _targetController.GetUserPageAsync(new Pagination());

            // Assert
            Assert.True(res != null && res.Success == svcResult.Success);
        }

        #endregion

        #region InsertUserAsync
        [Test]
        public async Task InsertUserAsync_Success()
        {
            var resInsert = true;
            var svcResult = new ServiceResult<bool>() { Success = resInsert, Data = resInsert };

            _userService
                .Setup(x => x.InsertUserAsync(It.IsAny<User>()))
                .Returns(Task.FromResult(resInsert));
            // Act
            var res = await _targetController.InsertUserAsync(new User());

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }

        [Test]
        public async Task InsertUserAsync_Fail()
        {
            var resInsert = false;
            var svcResult = new ServiceResult<bool>() { Success = resInsert, Data = resInsert };

            _userService
                .Setup(x => x.InsertUserAsync(It.IsAny<User>()))
                .Returns(Task.FromResult(resInsert));
            // Act
            var res = await _targetController.InsertUserAsync(new User());

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }
        #endregion

        #region DeleteUserAsync
        [Test]
        public async Task DeleteUserAsync_Success()
        {
            var resDelete = true;
            var svcResult = new ServiceResult<bool>() { Success = resDelete, Data = resDelete };

            _userService
                .Setup(x => x.DeleteUserAsync(It.IsAny<List<string>>()))
                .Returns(Task.FromResult(resDelete));
            // Act
            var res = await _targetController.DeleteUserAsync(new List<string> { _userId });

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }

        [Test]
        public async Task DeleteUserAsync_Fail()
        {
            var resDelete = false;
            var svcResult = new ServiceResult<bool>() { Success = resDelete, Data = resDelete };

            _userService
                .Setup(x => x.DeleteUserAsync(It.IsAny<List<string>>()))
                .Returns(Task.FromResult(resDelete));
            // Act
            var res = await _targetController.DeleteUserAsync(new List<string> { _userId });

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }
        #endregion

        #region UpdateUserAsync
        [Test]
        public async Task UpdateUserAsync_Success()
        {
            var resInsert = true;
            var svcResult = new ServiceResult<bool>() { Success = resInsert, Data = resInsert };

            _userService
                .Setup(x => x.UpdateUserAsync(It.IsAny<User>()))
                .Returns(Task.FromResult(resInsert));
            // Act
            var res = await _targetController.UpdateUserAsync(new User());

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }

        [Test]
        public async Task UpdateUserAsync_Fail()
        {
            var resInsert = false;
            var svcResult = new ServiceResult<bool>() { Success = resInsert, Data = resInsert };

            _userService
                .Setup(x => x.UpdateUserAsync(It.IsAny<User>()))
                .Returns(Task.FromResult(resInsert));
            // Act
            var res = await _targetController.UpdateUserAsync(new User());

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }
        #endregion

        #region AutheticateAsync
        [Test]
        public async Task AutheticateAsync_Success()
        {
            var resInsert = true;
            var svcResult = new ServiceResult<string>() { Success = resInsert, Data = _jwt };


            _jwtAuthencation
                .Setup(x => x.Autheticate(It.IsAny<UserRequest>()))
                .Returns(Task.FromResult(_jwt));
            // Act
            var res = await _targetController.AutheticateAsync(_userRequest);

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }

        [Test]
        public async Task AutheticateAsync_Fail()
        {
            var resInsert = false;
            var svcResult = new ServiceResult<string>() { Success = resInsert, Data = string.Empty };

            _jwtAuthencation
                .Setup(x => x.Autheticate(It.IsAny<UserRequest>()))
                .Returns(Task.FromResult(string.Empty));
            // Act
            var res = await _targetController.AutheticateAsync(_userRequest);

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }
        #endregion

        #region LoginUser
        [Test]
        public async Task LoginUser_Success()
        {
            var resInsert = true;
            var svcResult = new ServiceResult<UserRespone>() { Success = resInsert, Status = ServiceResultStatus.Ok };
            var userDb = new User();

            _jwtAuthencation
                .Setup(x => x.Autheticate(It.IsAny<UserRequest>()))
                .Returns(Task.FromResult(_jwt));

            _userService
               .Setup(x => x.GetUserByUserNameAsync(It.IsAny<string>()))
               .Returns(Task.FromResult(userDb));

            // Act
            var res = await _targetController.LoginUser(_userRequest);

            // Assert
            Assert.True(res != null && res.Status == svcResult.Status);
        }

        [Test]
        public async Task LoginUser_Fail()
        {
            var resInsert = false;
            var svcResult = new ServiceResult<UserRespone>() { Success = resInsert, Status = ServiceResultStatus.NotFound, Message = "Đăng nhập thất bại" };
            User userDb = null;

            _jwtAuthencation
                .Setup(x => x.Autheticate(It.IsAny<UserRequest>()))
                .Returns(Task.FromResult(_jwt));

            _userService
                .Setup(x => x.GetUserByUserNameAsync(It.IsAny<string>()))
                .Returns(Task.FromResult(userDb));
            // Act
            var res = await _targetController.LoginUser(_userRequest);

            // Assert
            Assert.True(res != null && res.Status == svcResult.Status);
        }

        [Test]
        public async Task LoginUser_Authorized()
        {
            var resInsert = false;
            var svcResult = new ServiceResult<UserRespone>() { Success = resInsert, Status = ServiceResultStatus.Authorized };

            _jwtAuthencation
                .Setup(x => x.Autheticate(It.IsAny<UserRequest>()))
                .Returns(Task.FromResult(string.Empty));
            // Act
            var res = await _targetController.LoginUser(_userRequest);
            // Assert
            Assert.True(res != null && res.Status == svcResult.Status);
        }
        #endregion

        #region RegiterUserAsync
        [Test]
        public async Task RegiterUserAsync_Success()
        {
            var resRegister = true;
            var svcResult = new ServiceResult<InsertStatus>() { Data = InsertStatus.Success };
            User userDb = null;

            _userService
               .Setup(x => x.GetUserByUserNameAsync(It.IsAny<string>()))
               .Returns(Task.FromResult(userDb));

            _userService
               .Setup(x => x.InsertUserAsync(It.IsAny<User>()))
               .Returns(Task.FromResult(resRegister));

            // Act
            var res = await _targetController.RegiterUserAsync(_userRequest);

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }

        [Test]
        public async Task RegiterUserAsync_Fail()
        {
            var resRegister = false;
            var svcResult = new ServiceResult<InsertStatus>() { Data = InsertStatus.Fail };
            User userDb = null;

            _userService
               .Setup(x => x.GetUserByUserNameAsync(It.IsAny<string>()))
               .Returns(Task.FromResult(userDb));

            _userService
               .Setup(x => x.InsertUserAsync(It.IsAny<User>()))
               .Returns(Task.FromResult(resRegister));

            // Act
            var res = await _targetController.RegiterUserAsync(_userRequest);

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }

        [Test]
        public async Task RegiterUserAsync_Duplicate()
        {
            var svcResult = new ServiceResult<InsertStatus>() { Data = InsertStatus.Duplicate };
            var userDb = new User();
            _userService
              .Setup(x => x.GetUserByUserNameAsync(It.IsAny<string>()))
              .Returns(Task.FromResult(userDb));
            // Act
            var res = await _targetController.RegiterUserAsync(_userRequest);
            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }
        #endregion

        #region GetAddressInfosAsync
        [Test]
        public async Task GetAddressInfosAsync_Success()
        {
            var svcResult = new ServiceResult<List<AddressInfo>>() { Data = new List<AddressInfo>() };

            _addressInfoService
                .Setup(x => x.GetAddressInfos(It.IsAny<string>()))
                .Returns(Task.FromResult(svcResult.Data));
            // Act
            var res = await _targetController.GetAddressInfosAsync(_userId);

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }

        [Test]
        public async Task GetAddressInfosAsync_Fail()
        {
            var svcResult = new ServiceResult<List<AddressInfo>>() { Data = null };

            _addressInfoService
                .Setup(x => x.GetAddressInfos(It.IsAny<string>()))
                .Returns(Task.FromResult(svcResult.Data));
            // Act
            var res = await _targetController.GetAddressInfosAsync(_userId);

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }
        #endregion

        #region GetAddressInfoAsync
        [Test]
        public async Task GetAddressInfoAsync_Success()
        {
            var svcResult = new ServiceResult<AddressInfo>() { Data = new AddressInfo() };

            _addressInfoService
                .Setup(x => x.GetAddressInfo(It.IsAny<string>()))
                .Returns(Task.FromResult(svcResult.Data));
            // Act
            var res = await _targetController.GetAddressInfoAsync(_userId);

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }

        [Test]
        public async Task GetAddressInfoAsync_Fail()
        {
            var svcResult = new ServiceResult<AddressInfo>() { Data = null };

            _addressInfoService
                .Setup(x => x.GetAddressInfo(It.IsAny<string>()))
                .Returns(Task.FromResult(svcResult.Data));
            // Act
            var res = await _targetController.GetAddressInfoAsync(_userId);

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }
        #endregion

        #region UpdateAddressInfoAsync
        [Test]
        public async Task UpdateAddressInfoAsync_Success()
        {
            var resUpdate = true;
            var svcResult = new ServiceResult<bool>() { Success = resUpdate, Data = resUpdate };

            _addressInfoService
                .Setup(x => x.UpdateAddressInfo(It.IsAny<AddressInfo>()))
                .Returns(Task.FromResult(resUpdate));
            // Act
            var res = await _targetController.UpdateAddressInfoAsync(new AddressInfo());

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }

        [Test]
        public async Task UpdateAddressInfoAsync_Fail()
        {
            var resUpdate = false;
            var svcResult = new ServiceResult<bool>() { Success = resUpdate, Data = resUpdate };

            _addressInfoService
                .Setup(x => x.UpdateAddressInfo(It.IsAny<AddressInfo>()))
                .Returns(Task.FromResult(resUpdate));
            // Act
            var res = await _targetController.UpdateAddressInfoAsync(new AddressInfo());

            // Assert
            Assert.True(res != null && res.Data == svcResult.Data);
        }
        #endregion
        #endregion
    }
}
