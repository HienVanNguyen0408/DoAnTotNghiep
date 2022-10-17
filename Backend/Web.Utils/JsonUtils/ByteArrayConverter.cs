using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace Web.Utils
{
    public static class ByteArrayConverter
    {
        public static byte[] Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
        {
            short[] sByteArray = JsonSerializer.Deserialize<short[]>(ref reader);
            byte[] value = new byte[sByteArray.Length];
            for (int i = 0; i < sByteArray.Length; i++)
            {
                value[i] = (byte)sByteArray[i];
            }

            return value;
        }

        public static void Write(Utf8JsonWriter writer, byte[] value, JsonSerializerOptions options)
        {
            writer.WriteStartArray();
            foreach (var val in value)
            {
                writer.WriteNumberValue(val);
            }
            writer.WriteEndArray();
        }
    }

}
