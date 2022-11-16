using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.Models.Entities;
namespace PostgresDBData
{
    public class BaseRepo<TEntity> : IBaseRepo<TEntity> where TEntity : class
    {
        private readonly PostgreSqlContext _context;
        private readonly PostgresSettings _postgresSettings;
        public DbSet<TEntity> entities { get; set; }
        public BaseRepo(PostgreSqlContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteManyAsync(IEnumerable<TEntity> entities)
        {
            await Task.CompletedTask;
            if (entities == null || entities.Count() <= 0) return false;
            try
            {
                _context.RemoveRange(entities);
                await _context.SaveChangesAsync(true);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> DeleteManyAsync(List<string> ids)
        {
            if (ids == null || ids.Count <= 0) return false;
            var entities = await GetByIdsAsync(ids);
            if (entities == null || entities.Count() <= 0) return false;
            try
            {
                _context.RemoveRange(entities);
                await _context.SaveChangesAsync(true);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> DeleteOneAsync(TEntity entity)
        {
            await Task.CompletedTask;
            if (entity == null) return false;
            var res = _context.Remove<TEntity>(entity);
            await _context.SaveChangesAsync(true);
            return res != null;
        }

        public async Task<bool> DeleteOneAsync(string id)
        {
            if (string.IsNullOrEmpty(id)) return false;
            var entity = await _context.Set<TEntity>().FindAsync(id);
            if (entity == null) return false;
            var res = _context.Remove<TEntity>(entity);
            await _context.SaveChangesAsync(true);
            return res != null;
        }

        public IEnumerable<TEntity> GetAll()
        {
            var entities = _context.Set<TEntity>().ToList();
            return entities;
        }

        public async Task<IEnumerable<TEntity>> GetAllAsync()
        {
            var entities = await _context.Set<TEntity>().ToListAsync();
            return entities;
        }
        public async Task<IEnumerable<TEntity>> GetByIdsAsync(IEnumerable<string> ids)
        {
            var entities = await _context.Set<TEntity>().ToListAsync();
            entities = entities.Where(e => ids.Any(x => x.ToString().Equals(e.ToString()))).ToList();
            return entities;
        }

        public TEntity GetById(string id)
        {
            return _context.Set<TEntity>().Find(id);
        }

        public async Task<TEntity> GetByIdAsync(string id)
        {
            var entity = await _context.Set<TEntity>().FindAsync(id);
            return entity;
        }

        public async Task<bool> InsertManyAsync(IEnumerable<TEntity> entities)
        {
            try
            {
                await _context.AddRangeAsync(entities);
                await _context.SaveChangesAsync(true);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> InsertOneAsync(TEntity entity)
        {
            try
            {
                await _context.AddAsync(entity);
                await _context.SaveChangesAsync(true);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> UpdateManyAsync(IEnumerable<TEntity> entities)
        {
            await Task.CompletedTask;
            try
            {
                _context.UpdateRange(entities);
                await _context.SaveChangesAsync(true);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        public async Task<bool> UpdateOneAsync(TEntity entity)
        {
            await Task.CompletedTask;
            try
            {
                _context.Update(entity);
                await _context.SaveChangesAsync(true);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<Pagging<TEntity>> GetPaggingAsync(Pagination pagination)
        {
            var skip = (pagination.PageIndex - 1) * pagination.PageSize;
            var take = pagination.PageSize;
            var entities = await _context.Set<TEntity>().Take(take).Skip(skip).ToListAsync();
            var pageResult = new Pagging<TEntity>();
            if (entities == null || entities.Count <= 0) return pageResult;

            var totalCount = await GetCountEntity();
            pageResult.Data = entities;
            pageResult.TotalRecord = totalCount;
            pageResult.TotalPages = totalCount % pagination.PageSize == 0 ? totalCount / pagination.PageSize : totalCount / pagination.PageSize + 1;
            return pageResult;
        }

        public async Task<long> GetCountEntity()
        {
            var entities = await _context.Set<TEntity>().ToListAsync();
            return entities.Count();
        }

        /// <summary>
        /// Lấy danh sách dữ liệu theo điều kiện lọc
        /// </summary>
        /// <param name="predicate"></param>
        /// <returns></returns>
        public async Task<IEnumerable<TEntity>> GetAllAsync(Func<TEntity, bool> predicate)
        {
            var entities = await _context.Set<TEntity>().ToListAsync();
            entities = entities.Where(predicate).ToList();
            return entities;
        }

        public async Task<TEntity> GetOneAsync(Func<TEntity, bool> predicate)
        {
            var entities = await _context.Set<TEntity>().ToListAsync();
            var entity = entities.FirstOrDefault(predicate);
            return entity;
        }
    }
}
