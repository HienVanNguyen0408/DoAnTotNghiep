using Web.Models.Enums;

namespace Web.Models.Entities
{
    public class Subcriber : BaseEntity
    {
        public string SubcriberId { get; set; } = GenerateNewId();
        public string Code { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public SubcriberType MyProperty { get; set; }
    }
}
