﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.Models.Entities;
namespace PostgresDBData
{
    public class BaseRepo<TEntity> : IBaseRepo<TEntity> where TEntity : class
    {
        protected readonly PostgreSqlContext _context;
        public DbSet<TEntity> entities { get; set; }
        public BaseRepo()
        {
            var contextOptions = new DbContextOptionsBuilder<PostgreSqlContext>()
                .UseNpgsql(@$"{PostgresSettings.ConnectionString}")
                .Options;
            _context = new PostgreSqlContext(contextOptions);
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

        public async Task<bool> DeleteManyAsync(IEnumerable<string> ids)
        {
            if (ids == null || ids.Count() <= 0) return false;
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

        public async Task<bool> DeleteManyAsync(Func<TEntity, bool> predicate)
        {
            var entities = await GetAllAsync(predicate);
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

        public async Task<bool> DeleteOneAsync(Func<TEntity, bool> predicate)
        {
            await Task.CompletedTask;
            var entity = await GetOneAsync(predicate);
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

        public async Task<IEnumerable<TEntity>> InsertManyAsync(IEnumerable<TEntity> entities)
        {
            try
            {
                await _context.AddRangeAsync(entities);
                await _context.SaveChangesAsync(true);
                return entities;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<TEntity> InsertOneAsync(TEntity entity)
        {
            try
            {
                await _context.AddAsync(entity);
                await _context.SaveChangesAsync(true);
                return entity;
            }
            catch (Exception ex)
            {
                return null;
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
            catch (Exception ex)
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
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<Pagging<TEntity>> GetPaggingAsync(Pagination pagination, Func<TEntity, bool> predicate = null)
        {
            try
            {
                var skip = (pagination.PageIndex - 1) * pagination.PageSize;
                var take = pagination.PageSize;
                var entities = await _context.Set<TEntity>().Skip(skip).Take(take).ToListAsync();

                if (predicate != null)
                {
                    entities = entities.Where(predicate).ToList();
                }

                var pageResult = new Pagging<TEntity>() { PageIndex = pagination.PageIndex, PageSize = pagination.PageSize };
                if (entities == null || entities.Count <= 0) return pageResult;


                long totalCount = 0;
                if (predicate != null)
                {
                    totalCount = await GetCountEntity(predicate);
                }
                else
                {
                    totalCount = await GetCountEntity();
                }

                pageResult.Data = entities;
                pageResult.TotalRecord = totalCount;
                pageResult.TotalPages = totalCount % pagination.PageSize == 0 ? totalCount / pagination.PageSize : totalCount / pagination.PageSize + 1;
                return pageResult;
            }
            catch (Exception ex)
            {
                return new Pagging<TEntity>();
            }
        }

        public async Task<long> GetCountEntity(Func<TEntity, bool> predicate = null)
        {
            var entities = await _context.Set<TEntity>().ToListAsync();
            if (predicate != null)
            {
                entities = entities.Where(predicate).ToList();
            }
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
