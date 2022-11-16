using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities;

namespace PostgresDBData
{
    public interface IBaseRepo<TEntity> where TEntity : class
    {
        #region Properties
        #endregion

        #region Get
        Task<long> GetCountEntity();
        IEnumerable<TEntity>GetAll();
        Task<IEnumerable<TEntity>> GetAllAsync();
        Task<IEnumerable<TEntity>> GetAllAsync(Func<TEntity,bool> predicate);
        Task<TEntity> GetOneAsync(Func<TEntity,bool> predicate);
        Task<Pagging<TEntity>> GetPaggingAsync(Pagination pagination);
        Task<IEnumerable<TEntity>> GetByIdsAsync(IEnumerable<string> ids);
        TEntity GetById(string id);
        Task<TEntity>GetByIdAsync(string id);
        #endregion


        #region Put
        Task<bool> UpdateOneAsync(TEntity entity);
        Task<bool> UpdateManyAsync(IEnumerable<TEntity> entities);

        #endregion

        #region Insert
        Task<bool> InsertOneAsync(TEntity entity);
        Task<bool> InsertManyAsync(IEnumerable<TEntity>entity);
        #endregion

        #region Delete
        Task<bool> DeleteOneAsync(TEntity entity);
        Task<bool> DeleteOneAsync(string id);
        Task<bool> DeleteManyAsync(IEnumerable<TEntity>entity);
        Task<bool> DeleteManyAsync(List<string> ids);
        #endregion
    }
}
