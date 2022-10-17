using Web.AppCore.Enum;

namespace Web.AppCore.Entities
{
    public class UserRespone
    {
        public string UserId { get; set; }
        public string UserName { get; set; }
        public Role Role { get; set; }
        public bool IsLoginGoogle { get; set; } = false;
    }
}
