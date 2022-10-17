using MongoDB.Bson;
using MongoDBData;
using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    public class BaseEntity : Document, ICloneable
    {

        public object Clone()
        {
            return this.MemberwiseClone();
        }

        /// <summary>
        /// Gen Id
        /// </summary>
        /// <returns></returns>
        public static string GenerateNewId() => $"{ObjectId.GenerateNewId()}";
    }
}
