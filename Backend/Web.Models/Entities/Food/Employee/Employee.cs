using System;
using System.Collections.Generic;
using System.Text;

namespace Web.Models.Entities
{
    /// <summary>
    /// Thông tin của nhân viên
    /// </summary>
    public class Employee : BaseEntity
    {
        public string EmployeeId { get; set; } = GenerateNewId();
        public string FullName { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public int Age { get; set; }
        public string HomeTown { get; set; }

        /// <summary>
        /// Chức vụ
        /// </summary>
        public string Position { get; set; }
    }
}
