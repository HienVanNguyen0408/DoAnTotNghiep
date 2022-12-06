using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.AppCore.Entities;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;
using Web.Models.Enums;
using Web.Models.Request;
using Web.Models.Respone;

namespace Web.Api.Controllers.BlogEnpoint
{
    public class BlogController : BaseAuthController<BlogController>
    {
        private const string TAG = "BlogController";
        private readonly IBlogService _blogService;
        public BlogController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _blogService = GetRequiredService<IBlogService>();
        }


        #region BlogCategory


        /// <summary>
        /// Danh sách loại bài viết
        /// </summary>
        /// <returns></returns>
        [HttpGet("categories")]
        public async Task<ServiceResult<IEnumerable<BlogCategory>>> GetBlogCategoriesAsync()
        {
            var svcResult = new ServiceResult<IEnumerable<BlogCategory>>();
            try
            {
                // Danh sách loại bài viết
                var blogCategories = await _blogService.GetBlogCategoriesAsync();
                svcResult = new ServiceResult<IEnumerable<BlogCategory>>
                {
                    Data = blogCategories,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetBlogCategoriesAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        /// <summary>
        /// Lấy danh sách loại bài viết phân trang
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        [HttpPost("category-pagging")]
        public async Task<ServiceResult<Pagging<BlogCategory>>> GetBlogCategoryPaggingAsync([FromBody] Pagination pagination)
        {
            var svcResult = new ServiceResult<Pagging<BlogCategory>>();
            try
            {
                var pageResult = await _blogService.GetBlogCategoriesPaggingAsync(pagination);
                svcResult = new ServiceResult<Pagging<BlogCategory>>
                {
                    Data = pageResult,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetBlogCategoryPaggingAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Thêm thông tin loại bài viết
        /// </summary>
        /// <param name="blogCategory"></param>
        /// <returns></returns>
        [HttpPost("category-insert")]
        public async Task<ServiceResult<bool>> InsertBlogCategoryAsync([FromBody] BlogCategory blogCategory)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var resInsert = await _blogService.InsertBlogCategoryAsync(blogCategory);
                svcResult = new ServiceResult<bool>
                {
                    Data = resInsert,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertBlogCategoryAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Xóa thông tin loại bài viết
        /// </summary>
        /// <param name="blogCategory"></param>
        /// <returns></returns>
        [HttpPost("category-delete")]
        public async Task<ServiceResult<DeleteStatus>> DeleteBlogCategoryAsync([FromBody] BlogCategory blogCategory)
        {
            var svcResult = new ServiceResult<DeleteStatus>();
            try
            {
                var resDelete = await _blogService.DeleteBlogCategoryAsync(blogCategory);
                svcResult = new ServiceResult<DeleteStatus>
                {
                    Data = resDelete,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteBlogCategoryAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Cập nhật thông tin loại bài viết
        /// </summary>
        /// <param name="blogCategory"></param>
        /// <returns></returns>
        [HttpPost("category-update")]
        public async Task<ServiceResult<bool>> UpdateBlogCategoryAsync([FromBody] BlogCategory blogCategory)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var updateRes = await _blogService.UpdateBlogCategoryAsync(blogCategory);
                svcResult = new ServiceResult<bool>
                {
                    Data = updateRes,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateBlogCategoryAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Chi tiết loại bài viết
        /// </summary>
        /// <param name="blogCategoryId"></param>
        /// <returns></returns>
        [HttpGet("category/{blogCategoryId}")]
        public async Task<ServiceResult<BlogCategory>> GetBlogCategoryAsync(string blogCategoryId)
        {
            var svcResult = new ServiceResult<BlogCategory>();
            try
            {
                var blog = await _blogService.GetBlogCategoryAsync(blogCategoryId);
                svcResult = new ServiceResult<BlogCategory>
                {
                    Data = blog,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetBlogCategoryAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }
        #endregion

        #region Blog
        /// <summary>
        /// Lấy danh bài viết
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IEnumerable<Blog>> GetBlogsAsync()
        {
            try
            {
                // Danh sách Blog
                var blogs = await _blogService.GetBlogsAsync();
                return blogs;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetBlogsAsync::Exception::{ex.Message}");
                return null;
            }
        }

        /// <summary>
        /// Chi tiết bài viết
        /// </summary>
        /// <returns></returns>
        [HttpGet("{blogId}")]
        public async Task<ServiceResult<BlogRespone>> GetBlogAsync(string blogId)
        {
            var svcResult = new ServiceResult<BlogRespone>();
            try
            {
                var blog = await _blogService.GetBlogAsync(blogId);
                svcResult = new ServiceResult<BlogRespone>
                {
                    Data = blog,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetBlogAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        /// <summary>
        /// Danh sách bài viết theo phân trang
        /// </summary>
        /// <param name="pagination"></param>
        /// <returns></returns>
        [HttpPost("pagging")]
        public async Task<ServiceResult<Pagging<BlogRespone>>> GetBlogPaggingAsync([FromBody] Pagination pagination)
        {
            var svcResult = new ServiceResult<Pagging<BlogRespone>>();
            try
            {
                // Danh sách Blog
                var pageResult = await _blogService.GetBlogsPaggingAsync(pagination);
                svcResult = new ServiceResult<Pagging<BlogRespone>>
                {
                    Data = pageResult,
                    Success = true,
                    Status = ServiceResultStatus.Ok
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetBlogPaggingAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }
        
        [HttpPost("insert")]
        public async Task<ServiceResult<bool>> InsertBlogAsync([FromBody] BlogRequest blog)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                //Thêm bài viết
                var resInsert = await _blogService.InsertBlogAsync(blog);
                svcResult = new ServiceResult<bool>
                {
                    Data = resInsert,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertBlogAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }


        [HttpPost("delete")]
        public async Task<ServiceResult<bool>> DeleteBlogAsync([FromBody] Blog blog)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var resDelete = await _blogService.DeleteBlogAsync(blog);
                svcResult = new ServiceResult<bool>
                {
                    Data = resDelete,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteBlogAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }
        
        [HttpPost("delete-many")]
        public async Task<ServiceResult<bool>> DeleteBlogsAsync([FromBody] List<Blog> blogs)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var resDelete = await _blogService.DeleteBlogsAsync(blogs);
                svcResult = new ServiceResult<bool>
                {
                    Data = resDelete,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteBlogsAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }

        [HttpPost("update")]
        public async Task<ServiceResult<bool>> UpdateBlogAsync([FromBody] BlogRequest blog)
        {
            var svcResult = new ServiceResult<bool>();
            try
            {
                var updateRes = await _blogService.UpdateBlogAsync(blog);
                svcResult = new ServiceResult<bool>
                {
                    Data = updateRes,
                    Status = ServiceResultStatus.Ok,
                    Success = true
                };
                return svcResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateBlogAsync::Exception::{ex.Message}");
                return svcResult;
            }
        }
        #endregion
    }
}
