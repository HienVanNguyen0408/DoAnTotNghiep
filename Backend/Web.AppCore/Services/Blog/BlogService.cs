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
        public async Task<Blog> GetBlogAsync(string blogId)
        {
            return await _blogUoW.Blogs.GetByIdAsync(blogId);
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
        public async Task<Pagging<Blog>> GetBlogsPaggingAsync(Pagination pagination)
        {
            var pageResult = await _blogUoW.Blogs.GetPaggingAsync(pagination);
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
                    var fileInfo = new FileInfo()
                    {
                        cotent_type = request.content_type,
                        data = request.data,
                        file_name = request.file_name
                    };

                    var image = new Image()
                    {
                        path = GlobalConstant.GetFullPathBlog($"{blogInsert.id}", FileExtensions.GetFileExtention(FileType.Image)),
                        is_picked = true,
                        blog_id = blogInsert.id
                    };

                    //Thêm thông tin file vào DB
                    var insertImage = await _imageUoW.Images.InsertOneAsync(image);
                    if (insertImage == null) return false;

                    //Thêm ảnh vào storage
                    await _storageClient.UploadFileAsync(image.path, fileInfo.data);
                }
                return blogInsert != null;
            }
            catch (Exception exx)
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

        #endregion

        #endregion
    }
}
