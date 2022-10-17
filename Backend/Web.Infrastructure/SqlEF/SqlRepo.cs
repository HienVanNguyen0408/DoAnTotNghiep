//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace Web.Infrastructure.Repository
//{
//    internal class SqlRepo
//    {


//        /// <summary>
//        /// Lấy thông tin của 1 bản ghi theo id
//        /// </summary>
//        /// <param name="entityId"></param>
//        /// <returns></returns>
//        public T GetOne(Guid entityId)
//        {
//            return _mysqlContext.Set<T>().Find(entityId);
//        }

//        public async Task<T> GetOneAsync(Guid entityId)
//        {
//            return await _mysqlContext.Set<T>().FindAsync(entityId);
//        }

//        /// <summary>
//        /// Lấy thông tin của nhiều bản ghi theo list id 
//        /// </summary>
//        /// <param name="entityId"></param>
//        /// <returns></returns>
//        public IEnumerable<T> GetMany(IEnumerable<Guid> entityIds)
//        {
//            var entities = _mysqlContext.Set<T>().ToList().Where(e => entityIds.Any(x => x.ToString().Equals(e.ToString())));
//            return entities;
//        }

//        /// <summary>
//        /// Thêm 1 bản ghi
//        /// </summary>
//        /// <param name="entity"></param>
//        /// <returns></returns>
//        public bool InsertOne(T entity)
//        {
//            var res = _mysqlContext.Add<T>(entity);
//            _mysqlContext.SaveChanges();
//            return res != null;
//        }

//        public async Task<bool> InsertOneAsync(T entity)
//        {
//            var res = await _mysqlContext.AddAsync<T>(entity);
//            _mysqlContext.SaveChanges();
//            return res != null;
//        }


//        /// <summary>
//        /// Insert nhiều bản ghi
//        /// </summary>
//        /// <param name="entities"></param>
//        /// <returns></returns>
//        public bool InsertMany(IEnumerable<T> entities)
//        {
//            try
//            {
//                _mysqlContext.AddRange(entities);
//                _mysqlContext.SaveChanges();
//                return true;
//            }
//            catch (Exception)
//            {
//                return false;
//            }
//        }
//        public async Task<bool> InsertManyAsync(IEnumerable<T> entities)
//        {
//            try
//            {
//                await _mysqlContext.AddRangeAsync(entities);
//                _mysqlContext.SaveChanges();
//                return true;
//            }
//            catch (Exception)
//            {
//                return false;
//            }
//        }

//        /// <summary>
//        /// Cập nhật một bản ghi
//        /// </summary>
//        /// <param name="entity"></param>
//        /// <returns></returns>
//        public bool UpdateOne(T entity)
//        {
//            if (entity == null) return false;
//            var res = _mysqlContext.Update<T>(entity);
//            _mysqlContext.SaveChanges();
//            return res != null;
//        }

//        /// <summary>
//        /// Cập nhật nhiều bản ghi
//        /// </summary>
//        /// <param name="entities"></param>
//        /// <returns></returns>
//        public bool UpdateManyAsync(IEnumerable<T> entities)
//        {
//            try
//            {
//                _mysqlContext.UpdateRange(entities);
//                _mysqlContext.SaveChanges();
//                return true;
//            }
//            catch (Exception)
//            {
//                return false;
//            }
//        }


//        public bool DeleteOne(Guid entityId)
//        {
//            if (string.IsNullOrEmpty(entityId.ToString())) return false;
//            var entity = _mysqlContext.Find<T>(entityId);
//            if (entity == null) return false;
//            var res = _mysqlContext.Remove<T>(entity);
//            _mysqlContext.SaveChanges();
//            return res != null;
//        }
//        public async Task<bool> DeleteOneAsync(Guid entityId)
//        {
//            if (string.IsNullOrEmpty(entityId.ToString())) return false;
//            var entity = await _mysqlContext.FindAsync<T>(entityId);
//            if (entity == null) return false;
//            var res = _mysqlContext.Remove<T>(entity);
//            _mysqlContext.SaveChanges();
//            return res != null;
//        }

//        public bool DeleteMany(IEnumerable<Guid> entityIds)
//        {
//            if (entityIds == null || entityIds.Count() <= 0) return false;
//            var entities = _mysqlContext.Set<T>().ToList().Where(e => entityIds.Count(x => x.ToString().Equals(e.ToString())) > 0);
//            if (entities == null || entities.Count() <= 0) return false;
//            try
//            {
//                _mysqlContext.RemoveRange(entities);
//                _mysqlContext.SaveChanges();
//                return true;
//            }
//            catch (Exception)
//            {
//                return false;
//            }
//        }
//        public Pagging<T> GetPagination<T>(Pagination pagination) where T : class
//        {
//            var res = _mysqlContext.Set<T>().ToList();
//            res.Skip(pagination.PageIndex).Take(pagination.PageSize).ToList();
//            if (!string.IsNullOrEmpty(pagination.FieldSearch))
//            {
//                if (!string.IsNullOrEmpty(pagination.TextSearch))
//                {
//                    res = res.Filter(pagination.FieldSearch, pagination.TextSearch);

//                }
//            }
//            if (!string.IsNullOrEmpty(pagination.OrderBy))
//            {
//                res = res.AsQueryable().OrderByCustom(pagination.OrderBy).ToList();
//            }
//            var result = new Pagging<T>
//            {
//                Data = res,
//                PageIndex = pagination.PageIndex,
//                PageSize = pagination.PageSize,
//                TotalRecord = res.Count(),
//                TotalPages = res.Count() % pagination.PageSize == 0 ? (int)res.Count() / pagination.PageSize : (int)res.Count() / pagination.PageSize + 1
//            };
//            return result;
//        }
//    }
//}
