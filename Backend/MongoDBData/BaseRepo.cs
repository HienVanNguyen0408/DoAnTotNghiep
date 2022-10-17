using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace MongoDBData
{
    public class BaseRepo<TDocument> : IBaseRepo<TDocument> where TDocument : IDocument
    {
        #region Declaration
        protected readonly IMongoDbContext _dbContext;
        protected readonly IMongoCollection<TDocument> _collection;
        public const string FieldId = "_id";

        #endregion

        #region Properties
        public IMongoCollection<TDocument> Collection { 
            get { return _collection; }
        }

        #region Contructor
        public BaseRepo(IMongoDbContext dbContext)
        {
            _dbContext = dbContext;
            _collection = _dbContext.Database.GetCollection<TDocument>(GetCollectionName());
        }

        /// <summary>
        /// Cập nhật giờ khi insert
        /// </summary>
        /// <param name="document"></param>
        private void UpdateTimeWhenInsert(TDocument document)
        {
            if(document != null && document.IsUpdateDate)
            {
                var currentDate = DateTime.Now;
                document.CreatedDate = currentDate;
                document.ModifiedDate = currentDate;
            }
        }


        #endregion
        private string GetCollectionName()
        {
            return typeof(TDocument).Name;  
        }

        #endregion
        public virtual async Task<long> CountDocumentNumber(FilterDefinition<TDocument> filterDefinition)
        {
            return await _collection.CountDocumentsAsync(filterDefinition);
        }

        public virtual async Task<long> DeleteManyAsync(IEnumerable<TDocument> documents)
        {
            if(!documents.Any()) return 0;
            var idsDelete = documents.Select(e => e.Id).ToArray();
            return (await _collection.DeleteManyAsync(x => idsDelete.Contains(x.Id))).DeletedCount;
        }

        public virtual async Task<long> DeleteManyAsync(FilterDefinition<TDocument> filter)
        {
            return (await _collection.DeleteManyAsync(filter)).DeletedCount;
        }

        public virtual bool DeleteOne(TDocument document)
        {
            var filter = Builders<TDocument>.Filter.Eq(x => x.Id,document.Id);
            return (_collection.DeleteOne(filter)).DeletedCount > 0;
        }

        public virtual async Task<bool> DeleteOneAsync(TDocument document)
        {
            var filter = Builders<TDocument>.Filter.Eq(x => x.Id, document.Id);
            return ( await _collection.DeleteOneAsync(filter)).DeletedCount > 0;
        }

        public virtual async Task<long> DeleteOneAsync(FilterDefinition<TDocument> filterDefinition)
        {
            return (await _collection.DeleteOneAsync(filterDefinition)).DeletedCount;
        }

        public virtual List<TDocument> GetAll(Expression<Func<TDocument, bool>> filter)
        {
            return _collection.Find(filter).ToList();
        }

        public virtual async Task<List<TDocument>> GetAllAsync(FilterDefinition<TDocument> filterDefinition)
        {
            return await _collection.Find(filterDefinition).ToListAsync();
        }

        public virtual async Task<List<TDocument>> GetAllAsync(FilterDefinition<TDocument> filterDefinition, SortDefinition<TDocument> sortDefinition = null)
        {
            return await _collection.Find(filterDefinition).Sort(sortDefinition).ToListAsync();
        }

        public TDocument GetById(string id)
        {
            var filter = Builders<TDocument>.Filter.Eq(FieldId, id);
            return _collection.Find(filter).FirstOrDefault();
        }

        public virtual async Task<TDocument> GetByIdAsync(string id)
        {
            var filter = Builders<TDocument>.Filter.Eq(FieldId, id);
            return await _collection.Find(filter).FirstOrDefaultAsync();
        }

        public virtual TDocument GetOne(Expression<Func<TDocument, bool>> filter)
        {
            return _collection.Find(filter).FirstOrDefault();
        }

        public virtual async Task<TDocument> GetOneAsync(FilterDefinition<TDocument> filterDefinition)
        {
            return await _collection.Find(filterDefinition).FirstOrDefaultAsync();
        }

        public virtual async Task<List<TDocument>> GetPaginatedAsync(FilterDefinition<TDocument> filterDefinition, SortDefinition<TDocument> sortDefinition = null, int skipNumber = 0, int takeNumber = 50)
        {
            return await _collection.Find(filterDefinition).Sort(sortDefinition).Skip(skipNumber).Limit(takeNumber).ToListAsync();
        }

        public virtual async Task<List<TDocument>> GetPaginatedAsync(FilterDefinition<TDocument> filterDefinition, ProjectionDefinition<TDocument> projectionDefinition = null, int skipNumber = 0, int takeNumber = 50)
        {
            var bsonList = await _collection.Find(filterDefinition).Project(projectionDefinition).Skip(skipNumber).Limit(takeNumber).ToListAsync();
            var documents = new List<TDocument>();  
            foreach (BsonDocument bsonOjb in bsonList)
            {
                var document = BsonSerializer.Deserialize<TDocument>(bsonOjb);
                documents.Add(document);
            }
            return documents;
        }

        public virtual void InsertMany(IEnumerable<TDocument> documents)
        {
            if (!documents.Any()) return;
            _collection.InsertMany(documents);
        }

        public virtual async Task InsertManyAsync(IEnumerable<TDocument> documents)
        {
            if (!documents.Any()) return;
            await _collection.InsertManyAsync(documents);
        }

        public virtual void InsertOne(TDocument document)
        {
            UpdateTimeWhenInsert(document);
            _collection.InsertOne(document);    
        }

        public virtual async Task InsertOneAsync(TDocument document)
        {
            UpdateTimeWhenInsert(document);
            await _collection.InsertOneAsync(document);
        }

        public virtual async Task<bool> UpdateManyAsync(FilterDefinition<TDocument> filterDefinition, UpdateDefinition<TDocument> updateDefinition, bool updateMdfDate = true)
        {
            var updateRes = await _collection.UpdateManyAsync(filterDefinition, updateDefinition);
            return updateRes.ModifiedCount > 1;
        }

        public virtual bool UpdateOne(TDocument document, UpdateDefinition<TDocument> updateDefinition)
        {
            var filter = Builders<TDocument>.Filter.Eq(FieldId,document.Id);
            updateDefinition = updateDefinition.Set(s => s.ModifiedDate , DateTime.Now);
            var updateRes = _collection.UpdateOne(filter,updateDefinition);
            return updateRes.ModifiedCount == 1;
        }

        public virtual async Task<bool> UpdateOneAsync(TDocument document, UpdateDefinition<TDocument> updateDefinition)
        {
            var filter = Builders<TDocument>.Filter.Eq(FieldId, document.Id);
            updateDefinition = updateDefinition.Set(s => s.ModifiedDate, DateTime.Now);
            var updateRes = await _collection.UpdateOneAsync(filter, updateDefinition);
            return updateRes.ModifiedCount == 1;
        }

        public virtual async Task<bool> UpdateOneAsync<TFiled>(Expression<Func<TDocument, bool>> filter, Expression<Func<TDocument, TFiled>> filed, TFiled value)
        {
            UpdateDefinition<TDocument> update = Builders<TDocument>.Update.Set(filed, value).Set(s => s.ModifiedDate, DateTime.Now);
            var updateRes = await _collection.UpdateOneAsync(filter, update);
            return updateRes.ModifiedCount == 1;
        }

        public virtual async Task<bool> UpdateOneAsync<TFiled>(TDocument document, Expression<Func<TDocument, TFiled>> filed, TFiled value)
        {
            var filter = Builders<TDocument>.Filter.Eq(FieldId, document.Id);
            UpdateDefinition<TDocument> update = Builders<TDocument>.Update.Set(filed, value).Set(s => s.ModifiedDate, DateTime.Now);
            var updateRes = await _collection.UpdateOneAsync(filter, update);
            return updateRes.ModifiedCount == 1;
        }

        public virtual async Task<bool> UpdateOneAsync(FilterDefinition<TDocument> filterDefinition, UpdateDefinition<TDocument> updateDefinition)
        {
            var updateRes = await _collection.UpdateOneAsync(filterDefinition, updateDefinition);
            return updateRes.ModifiedCount == 1;
        }
    }
}
