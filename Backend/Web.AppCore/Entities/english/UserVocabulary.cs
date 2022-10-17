using System;
using System.Collections.Generic;
using System.Text;
using Web.AppCore.Enum;

namespace Web.AppCore.Entities.english
{
    public class UserVocabulary
    {
        /// <summary>
        /// Id khóa chính của Từ vựng người dùng học được
        /// </summary>
        public Guid Id { get; set; }

        public Guid UserId { get; set; }

        public Guid VocabularyId { get; set; }

        /// <summary>
        /// Trạng thái từ người đùng dã học
        /// </summary>
        public StatusStudyVocabulary StatusStudyVocabulary { get; set; } = StatusStudyVocabulary.NewStudy;

        /// <summary>
        /// Thời gian người dùng học từ
        /// </summary>
        public DateTime? CreatedDate { get; set; }

        /// <summary>
        /// Thời gian người dùng học lại từ lần gần nhất
        /// </summary>
        public DateTime? ModifiedDate { get; set; }
    }
}
