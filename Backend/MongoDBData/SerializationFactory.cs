using System;
using System.Collections.Generic;
using System.Text;
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.Serialization.Conventions;
using MongoDB.Bson.Serialization.Serializers;

namespace MongoDBData
{
    public class SerializationFactory
    {
        public static bool isInitialize = false;

        public static void Register()
        {
            if (!isInitialize)
            {
                BsonSerializer.RegisterSerializer(DateTimeSerializer.LocalInstance);
                BsonSerializer.RegisterSerializer(new GuidSerializer(GuidRepresentation.Standard));
                BsonSerializer.RegisterSerializer(typeof(decimal),new DecimalSerializer(BsonType.Decimal128));
                BsonSerializer.RegisterSerializer(typeof(decimal?),new NullableSerializer<decimal>(new DecimalSerializer(BsonType.Decimal128)));
                ConventionRegistry.Register("IgnoreExtraElements", new ConventionPack { new IgnoreExtraElementsConvention(true) }, type => true);
                ConventionRegistry.Register("IgnoreIfNull", new ConventionPack { new IgnoreIfNullConvention(true) }, type => true);
                isInitialize = true;
            }
        }
    }
}
