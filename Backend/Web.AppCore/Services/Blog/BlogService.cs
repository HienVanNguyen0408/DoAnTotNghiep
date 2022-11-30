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
            return await _blogCategoryUoW.BlogCategories.GetAllAsync();
        }


        /// <summary>
        /// Lấy danh sách loại bài viết phân trang
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        public async Task<Pagging<BlogCategory>> GetBlogCategoriesPaggingAsync(Pagination pagination)
        {
            var pageResult = await _blogCategoryUoW.BlogCategories.GetPaggingAsync(pagination);
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
            if (blog != null)
            {
                blogRespone = (BlogRespone)blog;

                var pathImages = await GetPathImagesBlogAsync(blogId);
                if (pathImages != null && pathImages.CountExt() > 0)
                {
                    blogRespone.images.AddRange(pathImages);
                }
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
                var blogPage = await _blogUoW.Blogs.GetPaggingAsync(pagination);
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
                            if (blog.images == null) blog.images = new List<string>();
                            var pathImages = await GetPathImagesBlogAsync(blog.id);
                            if (pathImages != null && pathImages.CountExt() > 0)
                            {
                                blog.images.AddRange(pathImages);
                            }
                            pageResult.Data[index].images = blog.images;

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
                        var images = new List<Image>();
                        images = request.files.Select((x, index) => new Image()
                        {
                            path = GlobalConstant.GetFullPathBlog($"{blogInsert.id}_{index}", FileExtensions.GetFileExtention(FileType.Image)),
                            blog_id = blogInsert.id,
                            is_picked = true
                        }).ToList();
                        //Thêm thông tin file vào DB
                        var insertImage = await _imageUoW.Images.InsertManyAsync(images);
                        if (insertImage == null) return false;
                        for (int index = 0; index < request.files.CountExt(); index++)
                        {
                            await _storageClient.UploadFileAsync(images[index].path, request.files[index].data);
                        }
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
        public async Task<bool> UpdateBlogAsync(Blog blog)
        {
            return await _blogUoW.Blogs.UpdateOneAsync(blog);
        }

        /// <summary>
        /// Xóa bài viết
        /// </summary>
        /// <param name="blog"></param>
        /// <returns></returns>
        public async Task<bool> DeleteBlogAsync(Blog blog)
        {
            return await _blogUoW.Blogs.DeleteOneAsync(blog);
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
                var cachedKeyImages = $"blog_{blogId}";
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
                        pathStorage = await _storageClient.GetPathFileDownloadAsync(path);
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
        #endregion

        #endregion
    }
}
