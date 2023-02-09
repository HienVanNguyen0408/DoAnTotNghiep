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
using Web.Models.Respone;
using Web.Storage;
using Web.Utils;

namespace Web.AppCore.Services
{
    public class BlogService : BaseDomainService<BlogService>, IBlogService
    {
        #region Declaration
        private readonly IBlogUoW _blogUoW;
        private readonly IImageUoW _imageUoW;
        private readonly IBlogCategoryUoW _blogCategoryUoW;
        private readonly IStorageClient _storageClient;

        #endregion

        #region Contructor
        public BlogService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _blogUoW = serviceProvider.GetRequiredService<IBlogUoW>();
            _imageUoW = serviceProvider.GetRequiredService<IImageUoW>();
            _blogCategoryUoW = serviceProvider.GetRequiredService<IBlogCategoryUoW>();
            _storageClient = serviceProvider.GetRequiredService<IStorageClient>();
        }

        #endregion

        #region Methods

        #region BlogCategory

        /// <summary>
        /// Xóa loại bài viết
        /// </summary>
        /// <param name="blogCategory"></param>
        /// <returns></returns>
        public async Task<DeleteStatus> DeleteBlogCategoryAsync(BlogCategory blogCategory)
        {
            try
            {
                //Kiểm tra xem đã tồn tại bài viết nào của loại chưa
                var blogs = await _blogUoW.Blogs.GetAllAsync(x => x.blog_category_id == blogCategory.id);
                if (blogs != null && blogs.Count() > 0) return DeleteStatus.Incurred;

                var resDelete = await _blogCategoryUoW.BlogCategories.DeleteOneAsync(blogCategory);
                return resDelete ? DeleteStatus.Success : DeleteStatus.Fail;
            }
            catch (Exception ex)
            {
                return DeleteStatus.Fail;
            }
        }

        /// <summary>
        /// Lấy danh sách loại bài viết
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<BlogCategory>> GetBlogCategoriesAsync()
        {
            try
            {
                var blogCategories = await _blogCategoryUoW.BlogCategories.GetAllAsync();
                return blogCategories;
            }
            catch (Exception ex)
            {
                var blog = new BlogCategory();
                blog.description = $"{ex.Message}";
                var blogs = new List<BlogCategory>();
                blogs.Add(blog);
                return blogs;
            }
        }


        /// <summary>
        /// Lấy danh sách loại bài viết phân trang
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        public async Task<Pagging<BlogCategory>> GetBlogCategoriesPaggingAsync(Pagination pagination)
        {
            if (pagination.Filter.IsNullOrEmptyOrWhiteSpace()) return await _blogCategoryUoW.BlogCategories.GetPaggingAsync(pagination);
            var pageResult = await _blogCategoryUoW.BlogCategories.GetPaggingAsync(pagination, x => x.name.ContainsText(pagination.Filter));
            return pageResult;
        }

        /// <summary>
        /// Lấy thông tin loại bài viết
        /// </summary>
        /// <param name="blogCategoryId"></param>
        /// <returns></returns>
        public async Task<BlogCategory> GetBlogCategoryAsync(string blogCategoryId)
        {
            return await _blogCategoryUoW.BlogCategories.GetByIdAsync(blogCategoryId);
        }

        /// <summary>
        /// Thêm loại bài viết
        /// </summary>
        /// <param name="blogCategory"></param>
        /// <returns></returns>
        public async Task<bool> InsertBlogCategoryAsync(BlogCategory blogCategory)
        {
            var blogCate = await _blogCategoryUoW.BlogCategories.InsertOneAsync(blogCategory);
            return blogCate != null;
        }


        /// <summary>
        /// Cập nhật thông tin loại bài viết
        /// </summary>
        /// <param name="blogCategory"></param>
        /// <returns></returns>
        public async Task<bool> UpdateBlogCategoryAsync(BlogCategory blogCategory)
        {
            return await _blogCategoryUoW.BlogCategories.UpdateOneAsync(blogCategory);
        }
        #endregion


        #region Blog

        /// <summary>
        /// Lấy thông tin bài viết
        /// </summary>
        /// <param name="blogId"></param>
        /// <returns></returns>
        public async Task<BlogRespone> GetBlogAsync(string blogId)
        {
            var blogRespone = new BlogRespone();
            var blog = await _blogUoW.Blogs.GetByIdAsync(blogId);
            if (blog == null) return null;
            //Map dữ liệu
            blogRespone = MapperExtensions.MapperData<Blog, BlogRespone>(blog);
            var pathImages = await GetBase64ImagesBlogAsync(blogId);
            if (pathImages != null && pathImages.CountExt() > 0)
            {
                blogRespone.files = pathImages.SelectExt(x => new FileInfo { path = x }).ToList();
            }

            return blogRespone;
        }

        /// <summary>
        /// Lấy danh sách bài viết
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<Blog>> GetBlogsAsync()
        {
            return await _blogUoW.Blogs.GetAllAsync();
        }

        /// <summary>
        /// Lấy danh sách bài viết phân trang
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        public async Task<Pagging<BlogRespone>> GetBlogsPaggingAsync(Pagination pagination)
        {
            var pageResult = new Pagging<BlogRespone>();
            try
            {
                var blogPage = new Pagging<Blog>();
                if (pagination.Filter.IsNullOrEmptyOrWhiteSpace())
                {
                    blogPage = await _blogUoW.Blogs.GetPaggingAsync(pagination);
                }
                else
                {
                    blogPage = await _blogUoW.Blogs.GetPaggingAsync(pagination, x => x.title.ContainsText(pagination.Filter));
                }

                if (blogPage != null)
                {
                    pageResult = new Pagging<BlogRespone>
                    {
                        Data = blogPage.Data != null ? blogPage.Data.Select(blog => MapperExtensions.MapperData<Blog, BlogRespone>(blog)).ToList() : null,
                        PageIndex = blogPage.PageIndex,
                        PageSize = blogPage.PageSize,
                        TotalPages = blogPage.TotalPages,
                        TotalRecord = blogPage.TotalRecord
                    };

                    //Lấy thông tin ảnh
                    if (pageResult.Data != null && pageResult.Data.CountExt() > 0)
                    {
                        var blogs = pageResult.Data;
                        for (int index = 0; index < pageResult.Data.CountExt(); index++)
                        {
                            var blog = pageResult.Data[index];
                            if (blog.files == null) blog.files = new List<FileInfo>();
                            var base64Images = await GetBase64ImagesBlogAsync(blog.id);
                            if (base64Images != null && base64Images.CountExt() > 0)
                            {
                                blog.files = base64Images.SelectExt(x => new FileInfo { path = x }).ToList();
                            }
                            pageResult.Data[index].files = blog.files;
                        }

                    }
                }
            }
            catch (Exception ex)
            {
            }

            return pageResult;
        }

        /// <summary>
        /// Thêm  bài viết
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public async Task<bool> InsertBlogAsync(BlogRequest request)
        {
            try
            {
                var blog = (Blog)request;
                var blogInsert = await _blogUoW.Blogs.InsertOneAsync(blog);

                if (blogInsert != null)
                {
                    if (request.files != null && request.files.CountExt() > 0)
                    {
                        await InsertImagesAsync(request.files, request.id);
                    }
                }
                return blogInsert != null;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        /// <summary>
        /// Cập nhật bài viết
        /// </summary>
        /// <param name="blog"></param>
        /// <returns></returns>
        public async Task<bool> UpdateBlogAsync(BlogRequest blogRequest)
        {
            var blog = MapperExtensions.MapperData<BlogRequest, Blog>(blogRequest);
            var blogUpdate = await _blogUoW.Blogs.UpdateOneAsync(blog);
            if (!blogUpdate) return false;

            //Không có file nào 
            if (blogRequest.files == null || blogRequest.files.CountExt() <= 0) return blogUpdate;

            var files = blogRequest.files.Where(x => !x.path.IsNullOrEmptyOrWhiteSpace()).ToList();

            var images = await _imageUoW.Images.GetAllAsync(x => x.blog_id == blogRequest.id);

            if (images.CountExt() > 0)
            {
                var deleteImages = await DeleteImagesBlogAsync(blogRequest.id, images.SelectExt(x => x.path).ToList());
                if (deleteImages)
                {
                    await InsertImagesAsync(blogRequest.files, blogRequest.id);
                }
            }
            else
            {
                await InsertImagesAsync(blogRequest.files, blogRequest.id);
            }

            return blogUpdate;
        }

        /// <summary>
        /// Xóa bài viết
        /// </summary>
        /// <param name="blog"></param>
        /// <returns></returns>
        public async Task<bool> DeleteBlogAsync(Blog blog)
        {
            //Xóa ảnh
            var images = await _imageUoW.Images.GetAllAsync(x => x.blog_id == blog.id);
            if (images.CountExt() > 0)
            {
                await DeleteImagesBlogAsync(blog.id, images.SelectExt(x => x.path).ToList());
            }

            return await _blogUoW.Blogs.DeleteOneAsync(blog);
        }


        public async Task<bool> DeleteBlogsAsync(List<Blog> blogs)
        {
            try
            {
                if (blogs.CountExt() <= 0) return false;

                foreach (var blog in blogs)
                {
                    //Xóa ảnh
                    var images = await _imageUoW.Images.GetAllAsync(x => x.blog_id == blog.id);
                    if (images.CountExt() > 0)
                    {
                        await DeleteImagesBlogAsync(blog.id, images.SelectExt(x => x.path).ToList());
                    }
                }
                return await _blogUoW.Blogs.DeleteManyAsync(blogs);
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Lấy danh sách đường dẫn file ảnh trên storage
        /// </summary>
        /// <param name="blogId">Id bài viết</param>
        /// <returns></returns>
        private async Task<List<string>> GetPathImagesBlogAsync(string blogId)
        {
            try
            {
                //Key cached lưu các path trong DB của image
                var cachedKeyImages = GetKeyCachedBlogImages(blogId);
                var pathDbImages = await _cached.GetAsync<List<string>>(cachedKeyImages);
                //Lấy thông tin image từ DB
                if (pathDbImages == null || pathDbImages.CountExt() <= 0)
                {
                    var images = await _imageUoW.Images.GetAllAsync(x => x.blog_id == blogId);
                    if (images != null && images.CountExt() > 0)
                    {
                        pathDbImages = images.SelectExt(x => x.path).ToList();
                    }
                }

                if (pathDbImages == null || pathDbImages.Count() <= 0) return new List<string>();

                //Thời gian lưu thông tin path trong DB của các ảnh bài viết
                var timeCached = 60 * 60 * 24;
                await _cached.SetAsync(cachedKeyImages, pathDbImages, timeCached);

                var paths = new List<string>();
                //Lấy thông tin path image trên storage
                foreach (var path in pathDbImages)
                {
                    var keyPathStorage = $"{path}";
                    var pathStorage = await _cached.GetAsync<string>(keyPathStorage);

                    //Lấy path download từ Cached
                    if (!pathStorage.IsNullOrEmptyOrWhiteSpace())
                    {
                        paths.Add(pathStorage);
                    }
                    else
                    {
                        //Lấy path file ảnh từ storage
                        pathStorage = await _storageClient.GetPathFileDownloadAsync(path, timeCached);
                        if (!pathStorage.IsNullOrEmptyOrWhiteSpace()) paths.Add(pathStorage);
                        //Lưu cached 1 ngày
                        await _cached.SetAsync(keyPathStorage, pathStorage, timeCached);
                    }
                }

                return paths;
            }
            catch (Exception ex)
            {
                return new List<string>();
            }
        }

        /// <summary>
        /// Lấy danh sách đường dẫn file ảnh trên storage
        /// </summary>
        /// <param name="blogId">Id bài viết</param>
        /// <returns></returns>
        private async Task<List<string>> GetBase64ImagesBlogAsync(string blogId)
        {
            try
            {
                //Key cached lưu các path trong DB của image
                var cachedKeyImages = GetKeyCachedBlogImages(blogId);
                var pathDbImages = await _cached.GetAsync<List<string>>(cachedKeyImages);
                var idImages = new List<string>();

                //Lấy thông tin image từ DB
                if (pathDbImages == null || pathDbImages.CountExt() <= 0)
                {
                    var images = await _imageUoW.Images.GetAllAsync(x => x.blog_id == blogId);
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
                        if (!base64Image.IsNullOrEmptyOrWhiteSpace()) base64Images.Add(base64Image);
                    }
                }

                return base64Images;
            }
            catch (Exception ex)
            {
                return new List<string>();
            }
        }
        private async Task<List<string>> GetPathImagesByPathsAsync(List<string> paths)
        {
            try
            {
                if (paths == null || paths.CountExt() <= 0) return new List<string>();
                var pathsStorage = new List<string>();
                //Lấy thông tin path image trên storage
                foreach (var path in paths)
                {
                    var timeCached = 60 * 60 * 24;
                    //Lấy path file ảnh từ storage
                    var pathStorage = await _storageClient.GetPathFileDownloadAsync(path, timeCached);
                    if (!pathStorage.IsNullOrEmptyOrWhiteSpace()) pathsStorage.Add(pathStorage);
                }

                return pathsStorage;
            }
            catch (Exception ex)
            {
                return new List<string>();
            }
        }

        /// <summary>
        /// Thêm nhiều ảnh của bài viết
        /// </summary>
        /// <param name="fileInfos"></param>
        /// <param name="blogId"></param>
        /// <returns></returns>
        private async Task<bool> InsertImagesAsync(List<FileInfo> fileInfos, string blogId)
        {
            try
            {
                if (fileInfos.CountExt() <= 0) return false;
                var imagesInsert = fileInfos.Select((x, index) => new Image()
                {
                    path = GlobalConstant.GetFullPathBlog($"{blogId}_{Guid.NewGuid()}", FileExtensions.GetFileExtention(FileType.Image)),
                    blog_id = blogId,
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
                            var keyPathStorage = GetKeyCachedBlogImages(blogId);
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

        private async Task<bool> DeleteImagesBlogAsync(string blogId, List<string> paths)
        {
            try
            {
                var deleteImages = await _imageUoW.Images.DeleteManyAsync(x => x.blog_id == blogId);
                if (deleteImages)
                {
                    //Xóa ảnh blog khỏi cached
                    var keyCached = GetKeyCachedBlogImages(blogId);
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

        private string GetKeyCachedBlogImages(string blogId) => $"blog_images_{blogId}";
        private string GetKeyCachedBlogImagesBase64(string blogId) => GlobalConstant.GetFullPathBlog($"{blogId}_{Guid.NewGuid()}", FileExtensions.GetFileExtention(FileType.Image));
        #endregion

        #endregion
    }
}
