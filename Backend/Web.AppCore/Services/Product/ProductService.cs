using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;

namespace Web.AppCore.Services
{
    public class ProductService : BaseDomainService<ProductService>, IProductService
    {
        #region Declaration
        private readonly IProductUoW _productUoW;
        private readonly IProductCategoryUoW _productCategoryUoW;
        private readonly ISizeUoW _sizeUoW;
        private readonly IColorUoW _colorUoW;
        #endregion

        #region Contructor
        public ProductService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _productUoW = serviceProvider.GetRequiredService<IProductUoW>();
            _productCategoryUoW = serviceProvider.GetRequiredService<IProductCategoryUoW>();
            _sizeUoW = serviceProvider.GetRequiredService<ISizeUoW>();
            _colorUoW = serviceProvider.GetRequiredService<IColorUoW>();
        }

        #endregion

        #region Methods
        public async Task<bool> DeleteProductAsync(Product product)
        {
            //Xóa sản phẩm

            //Xóa image đang của sản phẩm 
            return false;
        }

        public async Task<bool> DeleteProductCategoryAsync(ProductCategory productCategory)
        {
            try
            {
                //Xóa sản phẩm của loại sản phẩm
                //Danh sách sản phẩm của loại sản phẩm
                var products = await _productUoW.Products.GetAllAsync(x => x.product_category_id == productCategory.id);
                //Chỉ xóa dữ liệu vẫn để thông tin id của sản phẩm
                products = products.Select(x => new Product() { id = x.id });
                await _productUoW.Products.UpdateManyAsync(products);

                //Xóa loại sản phẩm
                await _productCategoryUoW.ProductCategories.DeleteOneAsync(productCategory);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<Product> GetProductAsync(string productId)
        {
            return await _productUoW.Products.GetByIdAsync(productId);
        }

        public async Task<IEnumerable<ProductCategory>> GetProductCategoriesAsync()
        {
            return await _productCategoryUoW.ProductCategories.GetAllAsync();
        }

        public async Task<Pagging<ProductCategory>> GetProductCategoriesPaggingAsync(Pagination pagination)
        {
            return await _productCategoryUoW.ProductCategories.GetPaggingAsync(pagination);
        }

        public async Task<ProductCategory> GetProductCategoryAsync(string productCategoryId)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<Product>> GetProductsAsync()
        {
            throw new NotImplementedException();
        }

        public async Task<Pagging<Product>> GetProductsPaggingAsync(Pagination pagination)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> InsertProductAsync(Product product)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> InsertProductCategoryAsync(ProductCategory productCategory)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> UpdateProductAsync(Product product)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> UpdateProductCategoryAsync(ProductCategory productCategory)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
