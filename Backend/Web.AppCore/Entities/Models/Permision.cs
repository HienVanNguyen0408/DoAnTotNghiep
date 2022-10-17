using System;

namespace Web.AppCore.Entities
{
    public class Permision
    {
        public string PermisionId { get; set; }
        public string PermisionName { get; set; }
        public string Description { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
    public class UserPermision
    {
        public string UserPermisionId { get; set; }
        public string UserId { get; set; }
        public string PermisionId { get; set; }
        public int License { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
    public class PermisionDetail
    {
        public string PermisionDetailId { get; set; }
        public string PermisionId { get; set; }
        public ActionCode ActionCode { get; set; }
        public int CheckCode { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
    public enum ActionCode
    {
        VIEW = 0,
        CREATE = 1,
        EDIT = 2,
        DELETE = 3,
    }
}
