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
        #endregion
    }
}
