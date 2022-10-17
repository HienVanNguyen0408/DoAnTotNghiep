using Microsoft.Extensions.Options;
using MongoDB.Driver;
using System;

namespace MongoDBData
{
    public class MongoDbContext : IMongoDbContext
    {
        #region Declaration
        private MongoDbSettings _mongoDbSetting;
        private MongoClient _client;
        private IMongoDatabase _database = null;
        #endregion

        #region Contructor
        public MongoDbContext(IOptions<MongoDbSettings> options)
        {
            _mongoDbSetting = options.Value;
            Initialize(_mongoDbSetting.ConnectionString);
        }
        public MongoDbContext(MongoDbSettings mongoDBSettings, string connectionString)
        {
            _mongoDbSetting = mongoDBSettings;
            Initialize(connectionString);
        }
        #endregion

        #region Properties
        public MongoClient DbClient => _client;
        public IMongoDatabase Database => _database;
        #endregion
        #region Methods
        private void Initialize(string connectionString)
        {
            if (string.IsNullOrEmpty(connectionString))
            {
                throw new ArgumentNullException("Mongo connection string is null");
            }
            var mongoUrl = new MongoUrl(connectionString);
            var settings = MongoClientSettings.FromUrl(mongoUrl);
            var dbName = mongoUrl.DatabaseName;
            _client = new MongoClient(settings);
            _database = _client.GetDatabase(dbName);
        }
        #endregion

    }
}
