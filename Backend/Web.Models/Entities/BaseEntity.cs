using System;

namespace Web.Models.Entities
{
    public class BaseEntity
    {
        public string id { get; set; }
        public DateTime? created_date { get; set; }
        public DateTime? modified_date { get; set; }
    }
}
