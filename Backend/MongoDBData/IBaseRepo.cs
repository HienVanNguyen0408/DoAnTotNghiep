using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MongoDBData
{
    public interface IBaseRepo<TDocument> where TDocument : IDocument
    {
        #region Properties
        public IMongoCollection<TDocument> Collection { get; }
        #endregion

        #region Get
        List<TDocument> GetAll(Expression<Func<TDocument, bool>> filter);
        Task<List<TDocument>> GetAllAsync(FilterDefinition<TDocument> filterDefinition);
        Task<List<TDocument>> GetAllAsync(FilterDefinition<TDocument> filterDefinition, SortDefinition<TDocument> sortDefinition = null);
        TDocument GetById(string id);
        Task<TDocument> GetByIdAsync(string id);
        TDocument GetOne(Expression<Func<TDocument, bool>> filter);
        Task<TDocument> GetOneAsync(FilterDefinition<TDocument> filterDefinition);

        Task<List<TDocument>> GetPaginatedAsync(FilterDefinition<TDocument> filterDefinition, SortDefinition<TDocument> sortDefinition = null, int skipNumber = 0, int takeNumber = 50);
        Task<List<TDocument>> GetPaginatedAsync(FilterDefinition<TDocument> filterDefinition, ProjectionDefinition<TDocument> projectionDefinition = null, int skipNumber = 0, int takeNumber = 50);
        Task<long> CountDocumentNumber(FilterDefinition<TDocument> filterDefinition);
        #endregion


        #region Put
        bool UpdateOne(TDocument document, UpdateDefinition<TDocument> updateDefinition);
        Task<bool> UpdateOneAsync(TDocument document, UpdateDefinition<TDocument> updateDefinition);
        Task<bool> UpdateOneAsync<TFiled>(Expression<Func<TDocument,bool>> filter, Expression<Func<TDocument, TFiled>> filed, TFiled value);
        Task<bool> UpdateOneAsync<TFiled>(TDocument document, Expression<Func<TDocument, TFiled>> filed, TFiled value);
        Task<bool> UpdateOneAsync(FilterDefinition<TDocument> filterDefinition,UpdateDefinition<TDocument> updateDefinition);
        Task<bool> UpdateManyAsync(FilterDefinition<TDocument> filterDefinition,UpdateDefinition<TDocument> updateDefinition, bool updateMdfDate = true);

        #endregion

        #region Insert
        void InsertOne(TDocument document);
        Task InsertOneAsync(TDocument document);
        void InsertMany(IEnumerable<TDocument> document);
        Task InsertManyAsync(IEnumerable<TDocument> document);
        #endregion

        #region Delete
        bool DeleteOne(TDocument document);
        Task<bool> DeleteOneAsync(TDocument document);
        Task<long> DeleteOneAsync(FilterDefinition<TDocument> filterDefinition);
        Task<long> DeleteManyAsync(IEnumerable<TDocument> document);    
        Task<long> DeleteManyAsync(FilterDefinition<TDocument> filter);    

        #endregion
    }
}
