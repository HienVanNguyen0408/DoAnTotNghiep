using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;
using Web.Models.Enums;
using Web.Models.Request;
using Web.Models.Respone;
using Web.Storage;
using Web.Utils;

namespace Web.AppCore.Services
{
    public class ProductService : BaseDomainService<ProductService>, IProductService
    {
        #region Declaration
        private const string TAG = "ProductService";
        private readonly IProductUoW _productUoW;
        private readonly IProductCategoryUoW _productCategoryUoW;
        private readonly ISizeUoW _sizeUoW;
        private readonly IColorUoW _colorUoW;
        private readonly IOrderItemUoW _orderItemUoW;
        private readonly IImageUoW _imageUoW;
        private readonly IStorageClient _storageClient;
        #endregion

        #region Contructor
        public ProductService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _productUoW = serviceProvider.GetRequiredService<IProductUoW>();
            _productCategoryUoW = serviceProvider.GetRequiredService<IProductCategoryUoW>();
            _sizeUoW = serviceProvider.GetRequiredService<ISizeUoW>();
            _colorUoW = serviceProvider.GetRequiredService<IColorUoW>();
            _orderItemUoW = serviceProvider.GetRequiredService<IOrderItemUoW>();
            _imageUoW = serviceProvider.GetRequiredService<IImageUoW>();
            _storageClient = serviceProvider.GetRequiredService<IStorageClient>();
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
            if (pagination.Filter.IsNullOrEmptyOrWhiteSpace()) return await _productCategoryUoW.ProductCategories.GetPaggingAsync(pagination);
            var pageResult = await _productCategoryUoW.ProductCategories.GetPaggingAsync(pagination, x => x.name.ContainsText(pagination.Filter));
            return pageResult;
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

                var images = await _imageUoW.Images.GetAllAsync(x => x.product_id == product.id);
                if (images.CountExt() > 0)
                {
                    //Xóa ảnh
                    await DeleteImagesProductAsync(product.id, images.SelectExt(x => x.path).ToList());
                }
                //Xóa thông tin màu sắc, size của sản phẩm
                await _imageUoW.Images.DeleteManyAsync(x => x.product_id == product.id);

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
                await _imageUoW.Images.DeleteManyAsync(x => products.Any(p => p.id == x.product_id));
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
        public async Task<Pagging<ProductRespone>> GetProductsPaggingAsync(Pagination pagination, bool isAdmin)
        {
            var pageResult = new Pagging<ProductRespone>();
            try
            {
                var productPage = new Pagging<Product>();
                if (pagination.Filter.IsNullOrEmptyOrWhiteSpace())
                {
                    productPage = await _productUoW.Products.GetPaggingAsync(pagination);
                }
                else
                {
                    productPage = await _productUoW.Products.GetPaggingAsync(pagination, x => x.product_name.ContainsText(pagination.Filter));
                }

                if (productPage != null)
                {
                    pageResult = new Pagging<ProductRespone>
                    {
                        Data = productPage.Data != null ? productPage.Data.Select(product => MapperExtensions.MapperData<Product, ProductRespone>(product)).ToList() : null,
                        PageIndex = productPage.PageIndex,
                        PageSize = productPage.PageSize,
                        TotalPages = productPage.TotalPages,
                        TotalRecord = productPage.TotalRecord
                    };

                    if (!isAdmin)
                    {
                        //Lấy thông tin ảnh
                        if (pageResult.Data != null && pageResult.Data.CountExt() > 0)
                        {
                            for (int index = 0; index < pageResult.Data.CountExt(); index++)
                            {
                                var product = pageResult.Data[index];
                                //// Lấy thông tin file
                                if (product.files == null) product.files = new List<FileInfo>();

                                var pathImagesProduct = FileExtensions.GetPathProductLocal();
                                var base64Images = await GetBase64ImagesProductLocalAsync(productId: product.id);
                                if (base64Images.CountExt() <= 0)
                                {
                                    base64Images = await GetBase64ImagesProductAsync(product.id);
                                    if (base64Images != null && base64Images.CountExt() > 0)
                                    {
                                        product.files = base64Images.SelectExt(x => new FileInfo { path = x }).ToList();
                                        if (product.files.CountExt() <= 0) continue;
                                        pageResult.Data[index].files = product.files;
                                    }
                                }
                                else
                                {
                                    product.files = base64Images.SelectExt(x => new FileInfo { path = x }).ToList();
                                    if (product.files.CountExt() <= 0) continue;
                                    pageResult.Data[index].files = product.files;
                                }

                                //Lấy thông tin màu sắc - size - số lượng
                                var colors = await _colorUoW.Colors.GetAllAsync(x => x.product_id == product.id);
                                if (colors.CountExt() > 0) { pageResult.Data[index].colors = colors.ToList(); }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                _logger.LogWarning(ex, $"{TAG}::Lỗi hàm GetProductsPaggingAsync::Exception::{ex.Message}");
            }

            return pageResult;
        }

        /// <summary>
        /// Thêm sản phẩm
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        public async Task<bool> InsertProductAsync(ProductRequest request)
        {
            try
            {
                var product = (Product)request;
                var productInsert = await _productUoW.Products.InsertOneAsync(product);

                if (productInsert != null)
                {
                    if (request.files.CountExt() > 0)
                    {
                        await InsertImagesAsync(request.files, request.id);
                    }

                    ///Cập nhật các thông tin màu size của sản phẩm
                    if (request.colors.CountExt() > 0)
                    {
                        //Cập nhật Id của product
                        request.colors.ForEach(x => x.product_id = productInsert.id);
                        var insertColos = await _colorUoW.Colors.InsertManyAsync(request.colors);
                        if (insertColos.CountExt() > 0)
                        {
                            productInsert.quantity = request.colors.SumExt(x => x.amount);
                            await _productUoW.Products.UpdateOneAsync(productInsert);
                        }
                    }
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
        public async Task<bool> UpdateProductAsync(ProductRequest productRequest)
        {
            var product = MapperExtensions.MapperData<ProductRequest, Product>(productRequest);
            var productUpdate = await _productUoW.Products.UpdateOneAsync(product);
            if (!productUpdate) return false;

            //Không có file nào 
            if (productRequest.files == null || productRequest.files.CountExt() <= 0) return productUpdate;

            var files = productRequest.files.Where(x => !x.path.IsNullOrEmptyOrWhiteSpace()).ToList();

            var images = await _imageUoW.Images.GetAllAsync(x => x.product_id == productRequest.id);

            //Cập nhật thông tin màu sắc - size
            var updateColors = await UpdateColorProduct(product, productRequest.colors);

            if (updateColors)
            {
                await _productUoW.Products.UpdateOneAsync(product);
            }
            return productUpdate;
        }

        /// <summary>
        /// Lấy thông tin sản phẩm
        /// </summary>
        /// <param name="productId"></param>
        /// <returns></returns>
        public async Task<ProductRespone> GetProductAsync(string productId)
        {
            var productRespone = new ProductRespone();
            var product = await _productUoW.Products.GetByIdAsync(productId);
            if (product == null) return null;
            //Map dữ liệu
            productRespone = MapperExtensions.MapperData<Product, ProductRespone>(product);

            //// Lấy thông tin file
            if (productRespone.files == null) productRespone.files = new List<FileInfo>();

            var pathImagesProduct = FileExtensions.GetPathProductLocal();
            var base64Images = await GetBase64ImagesProductLocalAsync(productId: product.id);
            if (base64Images.CountExt() <= 0)
            {
                base64Images = await GetBase64ImagesProductAsync(product.id);
                if (base64Images != null && base64Images.CountExt() > 0)
                {
                    productRespone.files = base64Images.SelectExt(x => new FileInfo { path = x }).ToList();
                }
            }
            else
            {
                productRespone.files = base64Images.SelectExt(x => new FileInfo { path = x }).ToList();
            }

            //Lấy thông tin màu sắc - size - số lượng
            var colors = await _colorUoW.Colors.GetAllAsync(x => x.product_id == product.id);
            if (colors.CountExt() > 0) { productRespone.colors = colors.ToList(); }
            return productRespone;
        }
        #endregion


        /// <summary>
        /// Thêm nhiều ảnh của bài viết
        /// </summary>
        /// <param name="fileInfos"></param>
        /// <param name="blogId"></param>
        /// <returns></returns>
        private async Task<bool> InsertImagesAsync(List<FileInfo> fileInfos, string productId)
        {
            try
            {
                if (fileInfos.CountExt() <= 0) return false;
                var imagesInsert = fileInfos.Select((x, index) => new Image()
                {
                    path = GlobalConstant.GetFullPathProduct($"{productId}_{Guid.NewGuid()}", FileExtensions.GetFileExtention(FileType.Image)),
                    product_id = productId,
                    is_picked = true
                }).ToList();
                //Thêm thông tin file vào DB
                var insertImage = await _imageUoW.Images.InsertManyAsync(imagesInsert);
                if (insertImage.CountExt() > 0)
                {
                    for (int index = 0; index < fileInfos.CountExt(); index++)
                    {
                        var byteFile = ConvertExtensions.ConvertFromBase64(fileInfos[index].path);
                        var insertStorage = await _storageClient.UploadFileAsync(imagesInsert[index].path, byteFile);
                        if (insertStorage)
                        {
                            var keyPathStorage = GetKeyCachedProductImages(productId);
                            //Lưu cached 1 ngày
                            await _cached.SetAsync(keyPathStorage, insertImage.SelectExt(x => x.path).ToList(), 60 * 60 * 24);
                        }
                    }
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        private async Task<bool> UpdateColorProduct(Product product, List<Color> colors)
        {
            try
            {
                if (colors.CountExt() <= 0) return false;
                //Cập nhật Id của product
                colors.ForEach(x => x.product_id = product.id);

                var colorsDb = await _colorUoW.Colors.GetAllAsync(x => x.product_id == product.id);
                if (colorsDb.CountExt() <= 0) return false;
                var quantity = 0;
                // Dữ liệu nằm trong dữ liệu gửi lên, không nằm trong DB
                var colorsInsert = colors.WhereExt(x => !colorsDb.ToList().Exists(c => x.id.Equals(c.id))).ToList();
                if (colorsInsert.CountExt() > 0)
                {
                    await _colorUoW.Colors.InsertManyAsync(colorsInsert);
                    quantity += colorsInsert.SumExt(x => x.amount);
                }

                //Dữ liệu cập nhật
                var colorsUpdate = colors.WhereExt(x => colorsDb.ToList().Exists(c => x.id.Equals(c.id))).ToList();
                if (colorsUpdate.CountExt() > 0)
                {
                    await _colorUoW.Colors.UpdateManyAsync(colorsUpdate);
                    quantity += colorsUpdate.SumExt(x => x.amount);
                }

                // Dữ liệu nằm trong DB - không nằm trong dữ liệu gửi lên
                var colorsDelete = colorsDb.ToList().WhereExt(x => !colors.Exists(c => x.id.Equals(c.id))).ToList();
                if (colorsDelete.CountExt() > 0)
                {
                    await _colorUoW.Colors.DeleteManyAsync(colorsDelete);
                }
                product.quantity = quantity;
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        private async Task<bool> DeleteImagesProductAsync(string productId, List<string> paths)
        {
            try
            {
                var deleteImages = await _imageUoW.Images.DeleteManyAsync(x => x.product_id == productId);
                if (deleteImages)
                {
                    //Xóa ảnh blog khỏi cached
                    var keyCached = GetKeyCachedProductImages(productId);
                    await _cached.RemoveAsync(keyCached);
                    if (paths.CountExt() > 0)
                    {
                        foreach (var path in paths)
                        {
                            //Xóa ảnh khỏi storage
                            await _storageClient.DeleteFileStorageAsync(path);
                        }
                    }
                    return true;
                }
            }
            catch (Exception ex)
            {
            }
            return false;
        }

        private async Task<List<string>> GetBase64ImagesProductLocalAsync(string productId)
        {
            var images = new List<string>();
            var pathImagesProduct = $"{FileExtensions.GetPathProductLocal()}\\{productId}";
            var checkFolderExist = FileExtensions.CheckFolderExist(pathImagesProduct);
            if (!checkFolderExist) return images;

            System.IO.DirectoryInfo dir = new System.IO.DirectoryInfo(pathImagesProduct);

            var filesInfolder = dir.GetFiles("*.jpeg");
            if (filesInfolder == null || filesInfolder.CountExt() <= 0) return images;
            foreach (var file in filesInfolder)
            {
                byte[] fileData = FileExtensions.GetDataFile(file.FullName);
                var base64Image = Convert.ToBase64String(fileData);
                base64Image = $"data:image/jpeg;base64,{base64Image}";
                if (!base64Image.IsNullOrEmptyOrWhiteSpace()) images.Add(base64Image);
            }
            return images;
        }

        private async Task<List<string>> GetBase64ImagesProductAsync(string productId)
        {
            try
            {
                //Key cached lưu các path trong DB của image
                var cachedKeyImages = GetKeyCachedProductImages(productId);
                var pathDbImages = await _cached.GetAsync<List<string>>(cachedKeyImages);
                var idImages = new List<string>();

                //Lấy thông tin image từ DB
                if (pathDbImages == null || pathDbImages.CountExt() <= 0)
                {
                    var images = await _imageUoW.Images.GetAllAsync(x => x.product_id == productId);
                    if (images != null && images.CountExt() > 0)
                    {
                        pathDbImages = images.SelectExt(x => x.path).ToList();
                        idImages = images.SelectExt(x => x.id).ToList();
                    }
                }

                if (pathDbImages == null || pathDbImages.Count() <= 0) return new List<string>();

                //Thời gian lưu thông tin path trong DB của các ảnh bài viết
                var timeCached = 60 * 60 * 24;
                await _cached.SetAsync(cachedKeyImages, pathDbImages, timeCached);

                var base64Images = new List<string>();
                //Lấy thông tin path image trên storage
                foreach (var path in pathDbImages)
                {
                    var byteImage = await _storageClient.DownloadFileAsync(path);
                    if (byteImage != null && byteImage.Length > 0)
                    {
                        var base64Image = Convert.ToBase64String(byteImage);
                        base64Image = $"data:image/jpeg;base64,{base64Image}";
                        if (!base64Image.IsNullOrEmptyOrWhiteSpace())
                        {
                            base64Images.Add(base64Image);
                            var pathProductLocal = $"{FileExtensions.GetPathProductLocal()}\\{productId}";
                            if (!FileExtensions.CheckFolderExist(pathProductLocal))
                            {
                                FileExtensions.CreateFolder(pathProductLocal);
                            }
                            //Write filde to local
                            System.IO.File.WriteAllBytes($"{pathProductLocal}\\{FileExtensions.GetFileNameByPathProduct(path)}.jpeg", byteImage);
                        }
                    }
                }

                return base64Images;
            }
            catch (Exception ex)
            {
                return new List<string>();
            }
        }
        private string GetKeyCachedProductImages(string productId) => $"product_images_{productId}";

        private string GetKeyCachedProductImagesBase64(string productId) => $"product_images_base_{productId}";

        #endregion
    }
}
