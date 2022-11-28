using System;

namespace Web.Models.Entities
{
    public class BaseEntity
    {
        public string id { get; set; } = $"{Guid.NewGuid()}";
        public DateTime? created_date { get; set; }
        public DateTime? modified_date { get; set; }
    }
}
