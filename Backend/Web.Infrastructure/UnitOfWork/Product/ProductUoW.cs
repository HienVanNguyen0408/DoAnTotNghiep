using PostgresDBData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Repository;
using Web.Models.Entities;
using Web.Models.Request;
using Web.Utils;

namespace Web.Infrastructure.UnitOfWork
{
    public class ProductUoW : BaseUnitOfWork<ProductUoW>, IProductUoW
    {
        public ProductUoW(IServiceProvider serviceProvider) : base(serviceProvider)
        {

        }

        public async Task<Pagging<Product>> GetProductsPaggingAsync(ProductFilterRequest request)
        {
            try
            {
                var skip = (request.PageIndex - 1) * request.PageSize;
                var take = request.PageSize;
                var products = await Products.GetAllAsync();
                if (products.CountExt() <= 0) return new Pagging<Product>() { PageIndex = request.PageIndex, PageSize = request.PageSize, Data = new List<Product>() };

                if (!request.CategoryId.IsNullOrEmptyOrWhiteSpace())
                {
                    products = products.Where(x => x.product_category_id == request.CategoryId).ToList();
                }

                if (request.SalePrice != null && request.SalePrice > 0)
                {
                    products = products.Where(x => x.sale_price <= request.SalePrice).ToList();
                }

                if (!request.Filter.IsNullOrEmptyOrWhiteSpace())
                {
                    products = products.Where(x => x.product_name.ContainsText(request.Filter)).ToList();
                }

                if (!request.Sort.IsNullOrEmptyOrWhiteSpace())
                {
                    var sortCondition = request.Sort.Split(";");
                    if (sortCondition != null && sortCondition.Length > 0)
                    {
                        request.OrderBy = sortCondition[0] == "default" ? request.OrderBy : sortCondition[0];
                        if (sortCondition.Length > 1)
                        {
                            request.SortType = sortCondition[1] == "asc" ? SortType.ASC : SortType.DESC;
                        }
                    }
                }

                if (!request.OrderBy.IsNullOrEmptyOrWhiteSpace())
                {
                    if (request.SortType == SortType.DESC)
                    {
                        products = products.AsQueryable().OrderByDescendingCustom(request.OrderBy).ToList();
                    }
                    else
                    {
                        products = products.AsQueryable().OrderByCustom(request.OrderBy).ToList();
                    }
                }
                long totalCount = products.CountExt();
                products = products.Skip(skip).Take(take);
                var pageResult = new Pagging<Product>() { PageIndex = request.PageIndex, PageSize = request.PageSize };
                if (products == null || products.CountExt() <= 0) return pageResult;

                pageResult.Data = products.ToList();
                pageResult.TotalRecord = totalCount;
                pageResult.TotalPages = totalCount % request.PageSize == 0 ? totalCount / request.PageSize : totalCount / request.PageSize + 1;
                return pageResult;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return new Pagging<Product>();
            }
        }
    }
}
