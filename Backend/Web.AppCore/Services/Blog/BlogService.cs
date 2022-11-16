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
    public class BlogService : BaseDomainService<BlogService>, IBlogService
    {
        #region Declaration
        private readonly IBlogUoW _blogUoW;
        private readonly IBlogCategoryUoW _blogCategoryUoW;
        #endregion

        #region Contructor
        public BlogService(IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _blogUoW = serviceProvider.GetRequiredService<IBlogUoW>();
            _blogCategoryUoW = serviceProvider.GetRequiredService<IBlogCategoryUoW>();
        }

        #endregion

        #region Methods

        #region BlogCategory
        public async Task<bool> DeleteBlogCategoryAsync(BlogCategory blogCategory)
        {
            return await _blogCategoryUoW.BlogCategories.DeleteOneAsync(blogCategory);
        }

        public async Task<IEnumerable<BlogCategory>> GetBlogCategoriesAsync()
        {
            return await _blogCategoryUoW.BlogCategories.GetAllAsync();
        }

        public async Task<Pagging<BlogCategory>> GetBlogCategoriesPaggingAsync(Pagination pagination)
        {
            var pageResult = await _blogCategoryUoW.BlogCategories.GetPaggingAsync(pagination);
            return pageResult;
        }

        public async Task<BlogCategory> GetBlogCategoryAsync(string blogCategoryId)
        {
            return await _blogCategoryUoW.BlogCategories.GetByIdAsync(blogCategoryId);
        }

        public async Task<bool> InsertBlogCategoryAsync(BlogCategory blogCategory)
        {
            return await _blogCategoryUoW.BlogCategories.InsertOneAsync(blogCategory);
        }

        public async Task<bool> UpdateBlogCategoryAsync(BlogCategory blogCategory)
        {
            return await _blogCategoryUoW.BlogCategories.UpdateOneAsync(blogCategory);
        }
        #endregion


        #region Blog

        public async Task<Blog> GetBlogAsync(string blogId)
        {
            return await _blogUoW.Blogs.GetByIdAsync(blogId);
        }

        public async Task<IEnumerable<Blog>> GetBlogsAsync()
        {
            return await _blogUoW.Blogs.GetAllAsync();
        }

        public async Task<Pagging<Blog>> GetBlogsPaggingAsync(Pagination pagination)
        {
            var pageResult = await _blogUoW.Blogs.GetPaggingAsync(pagination);
            return pageResult;
        }

        public async Task<bool> InsertBlogAsync(Blog blog)
        {
            return await _blogUoW.Blogs.InsertOneAsync(blog);
        }

        public async Task<bool> UpdateBlogAsync(Blog blog)
        {
            return await _blogUoW.Blogs.UpdateOneAsync(blog);
        }
        public async Task<bool> DeleteBlogAsync(Blog blog)
        {
            return await _blogUoW.Blogs.DeleteOneAsync(blog);
        }

        #endregion

        #endregion
    }
}
