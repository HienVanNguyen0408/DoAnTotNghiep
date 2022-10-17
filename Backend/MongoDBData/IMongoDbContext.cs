using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Text;

namespace MongoDBData
{
    public interface IMongoDbContext
    {
        public MongoClient DbClient { get; }
        public IMongoDatabase Database { get; }
    }
}