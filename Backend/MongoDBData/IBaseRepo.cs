using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MongoDBData
{
    public interface IBaseRepo<T>
    {
        #region Properties
        public IMongoCollection<T> Collection { get; }
        #endregion

        #region Get
        List<T> GetAll(Expression<Func<T, bool>> filter);
        Task<List<T>> GetAllAsync(FilterDefinition<T> filterDefinition);
        Task<List<T>> GetAllAsync(FilterDefinition<T> filterDefinition, SortDefinition<T> sortDefinition = null);
        T GetById(string id);
        Task<T> GetByIdAsync(string id);
        T GetOne(Expression<Func<T, bool>> filter);
        Task<T> GetOneAsync(FilterDefinition<T> filterDefinition);

        Task<List<T>> GetPaginatedAsync(FilterDefinition<T> filterDefinition, SortDefinition<T> sortDefinition = null, int skipNumber = 0, int takeNumber = 50);
        Task<List<T>> GetPaginatedAsync(FilterDefinition<T> filterDefinition, ProjectionDefinition<T> projectionDefinition = null, int skipNumber = 0, int takeNumber = 50);
        Task<long> CounTNumber(FilterDefinition<T> filterDefinition);
        #endregion


        #region Put
        bool UpdateOne(T document, UpdateDefinition<T> updateDefinition);
        Task<bool> UpdateOneAsync(T document, UpdateDefinition<T> updateDefinition);
        Task<bool> UpdateOneAsync<TFiled>(Expression<Func<T,bool>> filter, Expression<Func<T, TFiled>> filed, TFiled value);
        Task<bool> UpdateOneAsync<TFiled>(T document, Expression<Func<T, TFiled>> filed, TFiled value);
        Task<bool> UpdateOneAsync(FilterDefinition<T> filterDefinition,UpdateDefinition<T> updateDefinition);
        Task<bool> UpdateManyAsync(FilterDefinition<T> filterDefinition,UpdateDefinition<T> updateDefinition, bool updateMdfDate = true);

        #endregion

        #region Insert
        void InsertOne(T document);
        Task InsertOneAsync(T document);
        void InsertMany(IEnumerable<T> document);
        Task InsertManyAsync(IEnumerable<T> document);
        #endregion

        #region Delete
        bool DeleteOne(T document);
        Task<bool> DeleteOneAsync(T document);
        Task<long> DeleteOneAsync(FilterDefinition<T> filterDefinition);
        Task<long> DeleteManyAsync(IEnumerable<T> document);    
        Task<long> DeleteManyAsync(FilterDefinition<T> filter);    

        #endregion
    }
}
