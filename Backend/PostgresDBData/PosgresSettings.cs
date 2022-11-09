using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PostgresDBData
{
    public class PosgresSettings
    {
        public const string NAME = "PosgresSettings";

        public string ConnectionString { get; set; } = "User ID=nvhien;Password=nvhien;Host=localhost;Port=5432;Database=postgres;";
    }
}
