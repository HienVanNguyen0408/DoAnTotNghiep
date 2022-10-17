using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;

namespace MongoDBData
{
    public interface IDocument<TKey> where TKey : IEquatable<TKey>
    {
        /// <summary>
        /// Khóa chính
        /// </summary>
        public TKey Id { get; set; }

        /// <summary>
        /// Thời gian tạo
        /// </summary>
        [BsonElement("creDate")]
        public DateTime CreatedDate { get; set; }

        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        [BsonElement("mdfDate")]
        [JsonIgnore]
        public DateTime ModifiedDate { get; set; }

        /// <summary>
        /// Có cập nhật lại ngày tạo và ngày sửa khi update /insert hay k
        /// </summary>
        [BsonIgnore]
        [JsonIgnore]
        public bool IsUpdateDate { get; set; }
    }

    public interface IDocument : IDocument<string>
    {

    }
}
