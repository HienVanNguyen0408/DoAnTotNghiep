namespace MongoDBData
{
    public class MongoDbSettings
    {
        public const string CONFIG_NAME = "MongoDbSettings";
        public string ConnectionString { get; set; } = "mongodb://localhost:27017/web_dev";
    }
}
