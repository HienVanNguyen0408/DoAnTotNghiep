using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;

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
        [HttpGet("categories")]
        public async Task<IEnumerable<BlogCategory>> GetBlogCategoriesAsync()
        {
            try
            {
                // Danh sách Blog
                var blogCategories = await _blogService.GetBlogCategoriesAsync();
                return blogCategories;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetBlogCategoriesAsync::Exception::{ex.Message}");
                return null;
            }
        }

        [HttpPost("categories-pagging")]
        public async Task<Pagging<BlogCategory>> GetBlogCategoryPaggingAsync([FromBody] Pagination pagination)
        {
            try
            {
                var pageResult = await _blogService.GetBlogCategoriesPaggingAsync(pagination);
                return pageResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetBlogCategoryPaggingAsync::Exception::{ex.Message}");
                return null;
            }
        }

        [HttpPost("category-insert")]
        public async Task<bool> InsertBlogCategoryAsync([FromBody] BlogCategory blogCategory)
        {
            try
            {
                var res = await _blogService.InsertBlogCategoryAsync(blogCategory);
                return res;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertBlogCategoryAsync::Exception::{ex.Message}");
                return false;
            }
        }


        [HttpPost("category-delete")]
        public async Task<bool> DeleteBlogCategoryAsync([FromBody] BlogCategory blogCategory)
        {
            try
            {
                var res = await _blogService.DeleteBlogCategoryAsync(blogCategory);
                return res;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteBlogCategoryAsync::Exception::{ex.Message}");
                return false;
            }
        }


        [HttpPost("category-update")]
        public async Task<bool> UpdateBlogCategoryAsync([FromBody] BlogCategory blogCategory)
        {
            try
            {
                var updateRes = await _blogService.UpdateBlogCategoryAsync(blogCategory);
                return updateRes;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateBlogCategoryAsync::Exception::{ex.Message}");
                return false;
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

        [HttpPost("pagging")]
        public async Task<Pagging<Blog>> GetBlogPaggingAsync([FromBody] Pagination pagination)
        {
            try
            {
                // Danh sách Blog
                var pageResult = await _blogService.GetBlogsPaggingAsync(pagination);
                return pageResult;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm GetBlogPaggingAsync::Exception::{ex.Message}");
                return null;
            }
        }

        [HttpPost("insert")]
        public async Task<bool> InsertBlogAsync([FromBody] Blog blog)
        {
            try
            {
                //Thêm bài viết
                var res = await _blogService.InsertBlogAsync(blog);
                return res;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm InsertBlogAsync::Exception::{ex.Message}");
                return false;
            }
        }


        [HttpPost("delete")]
        public async Task<bool> DeleteBlogAsync([FromBody] Blog blog)
        {
            try
            {
                await _blogService.DeleteBlogAsync(blog);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm DeleteBlogAsync::Exception::{ex.Message}");
                return false;
            }
        }


        [HttpPost("update")]
        public async Task<bool> UpdateBlogAsync([FromBody] Blog blog)
        {
            try
            {
                var updateRes = await _blogService.UpdateBlogAsync(blog);
                return updateRes;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm UpdateBlogAsync::Exception::{ex.Message}");
                return false;
            }
        }
        #endregion
    }
}
