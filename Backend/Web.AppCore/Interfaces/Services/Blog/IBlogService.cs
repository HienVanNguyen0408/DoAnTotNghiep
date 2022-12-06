using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities;
using Web.Models.Enums;
using Web.Models.Request;
using Web.Models.Respone;

namespace Web.AppCore.Interfaces.Services
{
    public interface IBlogService : IBaseDomainService
    {
        #region BlogCategory

        /// <summary>
        /// Lấy danh sách loại bài viết 
        /// </summary>
        /// <returns></returns>
        Task<IEnumerable<BlogCategory>> GetBlogCategoriesAsync();

        /// <summary>
        /// Lấy danh sách loại bài viết theo điều kiện phân trang
        /// </summary>
        /// <returns></returns>
        Task<Pagging<BlogCategory>> GetBlogCategoriesPaggingAsync(Pagination pagination);

        /// <summary>
        /// Lấy thông tin loại bài viết theo Id
        /// </summary>
        /// <param name="blogCategoryId"></param>
        /// <returns></returns>
        Task<BlogCategory> GetBlogCategoryAsync(string blogCategoryId);

        /// <summary>
        /// Thêm loại bài viết
        /// </summary>
        /// <param name="blogCategory"></param>
        /// <returns></returns>
        Task<bool> InsertBlogCategoryAsync(BlogCategory blogCategory);

        /// <summary>
        /// Cập nhật thông tin loại bài viết
        /// </summary>
        /// <param name="blogCategory"></param>
        /// <returns></returns>
        Task<bool> UpdateBlogCategoryAsync(BlogCategory blogCategory);

        /// <summary>
        /// Xóa loại bài viết
        /// </summary>
        /// <param name="blogCategory"></param>
        /// <returns></returns>
        Task<DeleteStatus> DeleteBlogCategoryAsync(BlogCategory blogCategory);
        #endregion


        #region Blog
        /// <summary>
        /// Lấy danh sách bài viết 
        /// </summary>
        /// <returns></returns>
        Task<IEnumerable<Blog>> GetBlogsAsync();

        /// <summary>
        /// Lấy danh sách bài viết theo điều kiện phân trang
        /// </summary>
        /// <returns></returns>
        Task<Pagging<BlogRespone>> GetBlogsPaggingAsync(Pagination pagination);

        /// <summary>
        /// Lấy thông tin bài viết theo Id
        /// </summary>
        /// <param name="blogId"></param>
        /// <returns></returns>
        Task<BlogRespone> GetBlogAsync(string blogId);

        /// <summary>
        /// Thêm loại bài viết
        /// </summary>
        /// <param name="blog"></param>
        /// <returns></returns>
        Task<bool> InsertBlogAsync(BlogRequest blog);

        /// <summary>
        /// Cập nhật thông tin bài viết
        /// </summary>
        /// <param name="blog"></param>
        /// <returns></returns>
        Task<bool> UpdateBlogAsync(BlogRequest blogRequest);

        /// <summary>
        /// Xóa bài viết
        /// </summary>
        /// <param name="blog"></param>
        /// <returns></returns>
        Task<bool> DeleteBlogAsync(Blog blog);
        Task<bool> DeleteBlogsAsync(List<Blog> blogs);
        #endregion


    }
}
