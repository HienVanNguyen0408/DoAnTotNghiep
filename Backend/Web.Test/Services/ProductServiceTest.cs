using Microsoft.Extensions.DependencyInjection;
using Moq;
using NUnit.Framework;
using PostgresDBData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.AppCore.Services;
using Web.Infrastructure.UnitOfWork;
using Web.Models.Entities;
using Web.Models.Enums;
using Web.Models.Request;
using Web.Storage;

namespace Web.Test.Services
{
    public class ProductServiceTest : BaseServiceTest<ProductService>
    {
        protected ProductService _targetSvc;
        protected Mock<ProductServiceTest> _targetMock;
        protected Mock<IProductService> _productSvc;
        protected Mock<IProductUoW> _productUoW;
        protected Mock<IProductCategoryUoW> _productCategoryUoW;
        protected Mock<IColorUoW> _colorUoW;
        protected Mock<IOrderItemUoW> _orderItemUoW;
        protected Mock<IImageUoW> _imageUoW;
        protected Mock<IStorageClient> _storageClient;
        protected BaseRepo<Product> _repoProduct;

        [SetUp]
        public override void SetUp()
        {
            base.SetUp();

            _productUoW = new Mock<IProductUoW>();
            _productSvc = new Mock<IProductService>();
            _productCategoryUoW = new Mock<IProductCategoryUoW>();
            _colorUoW = new Mock<IColorUoW>();
            _orderItemUoW = new Mock<IOrderItemUoW>();
            _imageUoW = new Mock<IImageUoW>();
            _storageClient = new Mock<IStorageClient>();
            _targetMock = new Mock<ProductServiceTest>();
            _repoProduct = new BaseRepo<Product>();

            _serviceProvider.Setup(x => x.GetService(typeof(IProductUoW))).Returns(_productUoW.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IProductService))).Returns(_productSvc.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IProductCategoryUoW))).Returns(_productCategoryUoW.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IColorUoW))).Returns(_colorUoW.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IOrderItemUoW))).Returns(_orderItemUoW.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IImageUoW))).Returns(_imageUoW.Object);
            _serviceProvider.Setup(x => x.GetService(typeof(IStorageClient))).Returns(_storageClient.Object);

            _targetSvc = new ProductService(_serviceProvider.Object);
        }

        #region Methods
        #region DeleteProductCategoryAsync
        [Test]
        public async Task DeleteProductCategoryAsync_Fail()
        {
            // Arrange
            var result = DeleteStatus.Fail;
            var productCategory = new ProductCategoryRequest
            {
                products = new List<Product>()
            };
            var resDelete = false;
            _productUoW
                .Setup(x => x.Products.DeleteOneAsync(It.IsAny<Product>()))
                .Returns(Task.FromResult(resDelete));

            _productSvc
                .Setup(x => x.DeleteProductCategoryAsync(It.IsAny<ProductCategoryRequest>()))
                .Returns(Task.FromResult(result));
            // Act
            var res = await _targetSvc.DeleteProductCategoryAsync(productCategory);

            // Assert
            Assert.True(res == result);
        }
        #endregion

        #endregion
    }
}
