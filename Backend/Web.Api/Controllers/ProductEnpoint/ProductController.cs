using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using Web.AppCore.Entities;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;
using Web.Models.Enums;
using Web.Models.Request;

namespace Web.Api.Controllers
{
    public class ProductController : BaseAuthController<ProductController>
    {
        private const string TAG = "ProductController";
        private readonly IProductService _productService;
        public ProductController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _productService = GetRequiredService<IProductService>();
        }

        #region Methods
        #region ProductCategory

        /// <summary>
        /// Thêm loại sản phẩm
        /// </summary>
        /// <param name="productCategory"></param>
        /// <returns></returns>
        [HttpPost("insert-productcategory")]
        public async Task<ServiceResult<bool>> InsertProductCategoryAsync([FromBody] ProductCategory productCategory)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var res = await _productService.InsertProductCategoryAsync(productCategory);
                svcResult = new ServiceResult<bool>
                {
                    Data = res,
                    Success = res,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertProductCategoryAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        /// <summary>
        /// Cập nhật loại sản phẩm
        /// </summary>
        /// <param name="productCategory"></param>
        /// <returns></returns>
        [HttpPost("update-productcategory")]
        public async Task<ServiceResult<bool>> UpdateProductCategoryAsync([FromBody] ProductCategory productCategory)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var res = await _productService.UpdateProductCategoryAsync(productCategory);
                svcResult = new ServiceResult<bool>
                {
                    Data = res,
                    Success = res,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateProductCategoryAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        /// <summary>
        /// Xóa loại sản phẩm
        /// </summary>
        /// <param name="productCategory"></param>
        /// <returns></returns>
        [HttpPost("delete-productcategory")]
        public async Task<ServiceResult<DeleteStatus>> DeleteProductCategoryAsync([FromBody] ProductCategoryRequest productCategory)
        {
            var svcResult = new ServiceResult<DeleteStatus>();
            try
            {
                var deleteRes = await _productService.DeleteProductCategoryAsync(productCategory);
                svcResult = new ServiceResult<DeleteStatus>
                {
                    Data = deleteRes,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };

                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteProductCategoryAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        /// <summary>
        /// Lấy danh sách phân trang loại sản phẩm
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        [HttpPost("pagging-productcategory")]
        public async Task<ServiceResult<Pagging<ProductCategory>>> GetPageProductCategoryAsync([FromBody] Pagination pagination)
        {
            var svcResult = new ServiceResult<Pagging<ProductCategory>>();
            try
            {
                var productCategoryPage = await _productService.GetProductCategoriesPaggingAsync(pagination);
                svcResult = new ServiceResult<Pagging<ProductCategory>>
                {
                    Data = productCategoryPage,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetPageProductCategoryAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        [HttpPost("productcategories")]
        public async Task<ServiceResult<IEnumerable<ProductCategory>>> GetProductCategoriesAsync()
        {
            var svcResult = new ServiceResult<IEnumerable<ProductCategory>>();
            try
            {
                var productCategoryPage = await _productService.GetProductCategoriesAsync();
                svcResult = new ServiceResult<IEnumerable<ProductCategory>>
                {
                    Data = productCategoryPage,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetProductCategoriesAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        [HttpGet("productcategory/{productCategoryId}")]
        public async Task<ServiceResult<ProductCategory>> GetProductCategoryAsync(string productCategoryId)
        {
            var svcResult = new ServiceResult<ProductCategory>();
            try
            {
                var productCategory = await _productService.GetProductCategoryAsync(productCategoryId);
                svcResult = new ServiceResult<ProductCategory>
                {
                    Data = productCategory,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetProductCategoryAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        #endregion

        #region Product

        /// <summary>
        /// Thêm sản phẩm
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        [HttpPost("insert")]
        public async Task<ServiceResult<bool>> InsertProductAsync([FromBody] ProductRequest product)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var res = await _productService.InsertProductAsync(product);
                svcResult = new ServiceResult<bool>
                {
                    Data = res,
                    Success = res,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertProductAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        /// <summary>
        /// Cập nhật sản phẩm
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        [HttpPost("update")]
        public async Task<ServiceResult<bool>> UpdateProductAsync([FromBody] ProductRequest product)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var res = await _productService.UpdateProductAsync(product);
                svcResult = new ServiceResult<bool>
                {
                    Data = res,
                    Success = res,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateProductAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        /// <summary>
        /// Xóa sản phẩm
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        [HttpPost("delete")]
        public async Task<ServiceResult<DeleteStatus>> DeleteProductAsync([FromBody] Product product)
        {
            var svcResult = new ServiceResult<DeleteStatus>();
            try
            {
                var deleteRes = await _productService.DeleteProductAsync(product);
                svcResult = new ServiceResult<DeleteStatus>
                {
                    Data = deleteRes,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };

                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteProductAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Xóa nhiều sản phẩm
        /// </summary>
        /// <param name="products"></param>
        /// <returns></returns>
        [HttpPost("delete-many")]
        public async Task<ServiceResult<DeleteStatus>> DeleteProductsAsync([FromBody] IEnumerable<Product> products)
        {
            var svcResult = new ServiceResult<DeleteStatus>();
            try
            {
                var deleteRes = await _productService.DeleteProductsAsync(products);
                svcResult = new ServiceResult<DeleteStatus>
                {
                    Data = deleteRes,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };

                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteProductsAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Lấy danh sách sản phẩm phân trang
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        [HttpPost("pagging")]
        public async Task<ServiceResult<Pagging<Product>>> GetPageProductAsync([FromBody] Pagination pagination)
        {
            var svcResult = new ServiceResult<Pagging<Product>>();
            try
            {
                var productPage = await _productService.GetProductsPaggingAsync(pagination);
                svcResult = new ServiceResult<Pagging<Product>>
                {
                    Data = productPage,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetPageProductAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Lấy thông tin sản phẩm
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        [HttpGet("{productId}")]
        public async Task<ServiceResult<Product>> GetProductAsync(string productId)
        {
            var svcResult = new ServiceResult<Product>();
            try
            {
                var productCategory = await _productService.GetProductAsync(productId);
                svcResult = new ServiceResult<Product>
                {
                    Data = productCategory,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetProductAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        #endregion
        #endregion
    }
}
