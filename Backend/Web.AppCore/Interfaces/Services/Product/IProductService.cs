using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities;

namespace Web.AppCore.Interfaces.Services
{
    public interface IProductService : IBaseDomainService
    {
        #region ProductCategory

        /// <summary>
        /// Lấy danh sản Loại sản phẩm
        /// </summary>
        /// <returns></returns>
        Task<IEnumerable<ProductCategory>> GetProductCategoriesAsync();

        /// <summary>
        /// Lấy danh sách Loại sản phẩm theo điều kiện phân trang
        /// </summary>
        /// <returns></returns>
        Task<Pagging<ProductCategory>> GetProductCategoriesPaggingAsync(Pagination pagination);

        /// <summary>
        /// Lấy thông tin Loại sản phẩm theo Id
        /// </summary>
        /// <param name="ProductCategoryId"></param>
        /// <returns></returns>
        Task<ProductCategory> GetProductCategoryAsync(string productCategoryId);

        /// <summary>
        /// Thêm Loại sản phẩm
        /// </summary>
        /// <param name="ProductCategory"></param>
        /// <returns></returns>
        Task<bool> InsertProductCategoryAsync(ProductCategory productCategory);

        /// <summary>
        /// Cập nhật thông tin Loại sản phẩm
        /// </summary>
        /// <param name="ProductCategory"></param>
        /// <returns></returns>
        Task<bool> UpdateProductCategoryAsync(ProductCategory productCategory);

        /// <summary>
        /// Xóa Loại sản phẩm
        /// </summary>
        /// <param name="ProductCategory"></param>
        /// <returns></returns>
        Task<bool> DeleteProductCategoryAsync(ProductCategory productCategory);
        #endregion


        #region Product
        /// <summary>
        /// Lấy danh sách sản phẩm
        /// </summary>
        /// <returns></returns>
        Task<IEnumerable<Product>> GetProductsAsync();

        /// <summary>
        /// Lấy danh sách sản phẩm theo điều kiện phân trang
        /// </summary>
        /// <returns></returns>
        Task<Pagging<Product>> GetProductsPaggingAsync(Pagination pagination);

        /// <summary>
        /// Lấy thông tin sản phẩm theo Id
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        Task<Product> GetProductAsync(string productId);

        /// <summary>
        /// Thêm Loại sản phẩm
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        Task<bool> InsertProductAsync(Product product);

        /// <summary>
        /// Cập nhật thông tin sản phẩm
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        Task<bool> UpdateProductAsync(Product product);

        /// <summary>
        /// Xóa sản phẩm
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        Task<bool> DeleteProductAsync(Product product);
        #endregion

    }
}
