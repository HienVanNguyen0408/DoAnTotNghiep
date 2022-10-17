using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Text.Json.Serialization;

namespace MongoDBData
{
    public class Document : IDocument
    {
        /// <summary>
        /// Khóa chính
        /// </summary>
        [BsonElement("_id")]
        [JsonIgnore]
        public string Id { get; set; } = $"{ObjectId.GenerateNewId()}";
        /// <summary>
        /// Thời gian tạo
        /// </summary>
        [BsonElement("creDate")]
        [JsonIgnore]
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        [BsonElement("mdfDate")]
        [JsonIgnore]
        public DateTime ModifiedDate { get; set; } = DateTime.Now;
        /// <summary>
        /// Có cập nhật lại ngày tạo và ngày sửa khi update /insert hay k
        /// </summary>
        [BsonIgnore]
        [JsonIgnore]
        public bool IsUpdateDate { get; set; }
    }
}
