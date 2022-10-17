using System;
using System.Collections.Generic;
using System.Text;
using Web.AppCore.Enum;

namespace Web.AppCore.Entities
{
    public class UserInfo
    {
        /// <summary>
        /// Id người dùng
        /// </summary>
        public string UserId { get; set; }
        /// <summary>
        ///  Tên tài khoản
        /// </summary>
        /// 
        public string UserName { get; set; }
        /// <summary>
        ///  Mật khẩu
        /// </summary>
        public string Password { get; set; }
        
        /// <summary>
        /// Email
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// Họ và tên
        /// </summary>
        public string FullName { get; set; }
       
        /// <summary>
        /// Số điện thoại
        /// </summary>
        public string PhoneNumber { get; set; }

        public int TypeLogin { get; set; }

        public int Age { get; set; }
        public int LevelEnglish { get; set; }

        /// <summary>
        /// quyen
        /// </summary>
        public Role Role { get; set; } = Role.User;

        /// <summary>
        /// Thời gian tạo
        /// </summary>
        public DateTime? CreatedDate { get; set; }
        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        public DateTime? ModifiedDate { get; set; }
    }
    public class UserExam
    {
        public string UserExamId { get; set; }
        public string UserId { get; set; }
        public string ExamId { get; set; }
        public int ScoreListen { get; set; }
        public int ScoreRead { get; set; }
        public string Evaluate { get; set; }

        /// <summary>
        /// Thời gian tạo
        /// </summary>
        public DateTime? CreatedDate { get; set; }
        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        public DateTime? ModifiedDate { get; set; }

    }

    public class OptionSelect
    {
        public string OptionSelectId { get; set; }
        public string ExamUserId { get; set; }
        public string Option { get; set; }
        public string QuestionId { get; set; }
        /// <summary>
        /// Thời gian tạo
        /// </summary>
        public DateTime? CreatedDate { get; set; }
        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        public DateTime? ModifiedDate { get; set; }

    }
}
