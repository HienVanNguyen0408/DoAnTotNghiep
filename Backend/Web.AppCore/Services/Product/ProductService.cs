using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;
using Web.Models.Enums;
using Web.Models.Request;

namespace Web.AppCore.Services
{
    public class ProductService : BaseDomainService<ProductService>, IProductService
    {
        #region Declaration
        private readonly IProductUoW _productUoW;
        private readonly IProductCategoryUoW _productCategoryUoW;
        private readonly ISizeUoW _sizeUoW;
        private readonly IColorUoW _colorUoW;
        private readonly IOrderItemUoW _orderItemUoW;
        private readonly IImageUoW _imageUow;
        #endregion

        #region Contructor
        public ProductService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _productUoW = serviceProvider.GetRequiredService<IProductUoW>();
            _productCategoryUoW = serviceProvider.GetRequiredService<IProductCategoryUoW>();
            _sizeUoW = serviceProvider.GetRequiredService<ISizeUoW>();
            _colorUoW = serviceProvider.GetRequiredService<IColorUoW>();
            _orderItemUoW = serviceProvider.GetRequiredService<IOrderItemUoW>();
            _imageUow = serviceProvider.GetRequiredService<IImageUoW>();
        }

        #endregion

        #region Methods

        #region ProductCategory
        /// <summary>
        /// Xóa loại sản phẩm
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<DeleteStatus> DeleteProductCategoryAsync(ProductCategoryRequest request)
        {
            try
            {
                //Xóa sản phẩm của loại sp
                if (request.products == null || request.products.Count() <= 0)
                {
                    request.products = await _productUoW.Products.GetAllAsync(x => x.product_category_id == request.id);
                }

                if (request.products != null && request.products.Count() > 0)
                {
                    var products = await _productUoW.Products.GetAllAsync(x => x.product_category_id == request.id);
                    var deleteStatus = await DeleteProductsAsync(request.products);

                    //Lỗi/phát sinh đơn hàng của sản phẩm
                    if (deleteStatus != DeleteStatus.Success) return deleteStatus;
                }

                //Xóa loại sản phẩm
                var resDelete = await _productCategoryUoW.ProductCategories.DeleteOneAsync(request);
                return resDelete ? DeleteStatus.Success : DeleteStatus.Fail;
            }
            catch (Exception ex)
            {
                return DeleteStatus.Fail;
            }
        }

        /// <summary>
        /// Danh sách loại sản phẩm
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<ProductCategory>> GetProductCategoriesAsync()
        {
            return await _productCategoryUoW.ProductCategories.GetAllAsync();
        }

        /// <summary>
        /// Danh sách loại sản phẩm phân trang
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        public async Task<Pagging<ProductCategory>> GetProductCategoriesPaggingAsync(Pagination pagination)
        {
            return await _productCategoryUoW.ProductCategories.GetPaggingAsync(pagination);
        }

        /// <summary>
        /// Thông tin chi tiết của loại sản phẩm
        /// </summary>
        /// <param name="productCategoryId"></param>
        /// <returns></returns>
        public async Task<ProductCategory> GetProductCategoryAsync(string productCategoryId)
        {
            return await _productCategoryUoW.ProductCategories.GetByIdAsync(productCategoryId);
        }

        /// <summary>
        /// Thêm loại sản phẩm
        /// </summary>
        /// <param name="productCategory"></param>
        /// <returns></returns>
        public async Task<bool> InsertProductCategoryAsync(ProductCategory productCategory)
        {
            var productCategoryInsert = await _productCategoryUoW.ProductCategories.InsertOneAsync(productCategory);
            return productCategoryInsert != null;
        }

        /// <summary>
        /// Cập nhật thông tin loại sản phẩm
        /// </summary>
        /// <param name="productCategory"></param>
        /// <returns></returns>
        public async Task<bool> UpdateProductCategoryAsync(ProductCategory productCategory)
        {
            return await _productCategoryUoW.ProductCategories.UpdateOneAsync(productCategory);
        }
        #endregion

        #region Product

        /// <summary>
        /// Xóa thông tin 1 sản phẩm
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        public async Task<DeleteStatus> DeleteProductAsync(Product product)
        {
            try
            {
                //Kiểm tra xem sản phẩm đã phát sinh đơn hàng chưa
                //Phát sinh thì không cho phép xóa 
                var orderItems = await _orderItemUoW.OrderItems.GetAllAsync(x => x.product_id == product.id);
                //Đã phát sinh đơn hàng
                if (orderItems != null && orderItems.Count() > 0) return DeleteStatus.Incurred;

                //Xóa image đang của sản phẩm 
                await _imageUow.Images.DeleteManyAsync(x => x.product_id == product.id);
                //Delete image trên storage

                //Xóa sản phẩm
                var resDelete = await _productUoW.Products.DeleteOneAsync(product);
                return resDelete ? DeleteStatus.Success : DeleteStatus.Fail;
            }
            catch (Exception ex)
            {
                return DeleteStatus.Fail;
            }
        }

        /// <summary>
        /// Xóa nhiều sản phẩm
        /// </summary>
        /// <param name="products"></param>
        /// <returns></returns>
        public async Task<DeleteStatus> DeleteProductsAsync(IEnumerable<Product> products)
        {
            try
            {
                if (products == null && products.Count() <= 0) return DeleteStatus.None;

                //Kiểm tra xem sản phẩm đã phát sinh đơn hàng chưa
                //Phát sinh thì không cho phép xóa 
                var orderItems = await _orderItemUoW.OrderItems.GetAllAsync(x => products.Any(p => p.id == x.product_id));
                //Đã phát sinh đơn hàng
                if (orderItems != null && orderItems.Count() > 0) return DeleteStatus.Incurred;

                //Xóa image đang của sản phẩm 
                await _imageUow.Images.DeleteManyAsync(x => products.Any(p => p.id == x.product_id));
                //Delete image trên storage

                //Xóa sản phẩm
                var resDelete = await _productUoW.Products.DeleteManyAsync(products);
                return resDelete ? DeleteStatus.Success : DeleteStatus.Fail;
            }
            catch (Exception ex)
            {
                return DeleteStatus.Fail;
            }
        }

        /// <summary>
        /// Danh sách sản phẩm
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<Product>> GetProductsAsync()
        {
            return await _productUoW.Products.GetAllAsync();
        }

        /// <summary>
        /// Danh sách sản phẩm phân trang
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        public async Task<Pagging<Product>> GetProductsPaggingAsync(Pagination pagination)
        {
            return await _productUoW.Products.GetPaggingAsync(pagination);
        }

        /// <summary>
        /// Thêm sản phẩm
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        public async Task<bool> InsertProductAsync(ProductRequest product)
        {
            try
            {
                var productInsert = await _productUoW.Products.InsertOneAsync(product);
                //Thêm thông tin ảnh của product
                if (product.images != null && product.images.Count() > 0)
                {
                    product.images.ToList().ForEach(x => x.product_id = product.id);
                    //Thêm vào DB
                    await _imageUow.Images.InsertManyAsync(product.images);
                    //Thêm ảnh vào storage
                }
                return productInsert != null;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        /// <summary>
        /// Cập nhật thông tin sản phẩm
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        public async Task<bool> UpdateProductAsync(ProductRequest product)
        {
            //Cập nhật ảnh trên storage
            //Cập nhật ảnh trong DB
            return await _productUoW.Products.UpdateOneAsync(product);
        }

        /// <summary>
        /// Lấy thông tin sản phẩm
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        public async Task<Product> GetProductAsync(string productId)
        {
            return await _productUoW.Products.GetByIdAsync(productId);
        }
        #endregion
        
        #endregion
    }
}
