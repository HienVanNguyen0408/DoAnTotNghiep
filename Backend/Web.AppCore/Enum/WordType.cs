using System;
using System.Collections.Generic;
using System.Text;

namespace Web.AppCore.Enum
{
    public enum WordType
    {
        /// <summary>
        /// Không xác định
        /// </summary>
        None = 0,
        /// <summary>
        /// Danh từ
        /// </summary>
        Noune = 1,
        /// <summary>
        /// Tính từ
        /// </summary>
        Adjective = 2,
        /// <summary>
        /// Động từ
        /// </summary>
        Verb = 3,

        Adverb = 4,

        Pronouns = 5,
    }
    /// <summary>
    /// Trạng thái đã học từ vựng của người dùng
    /// </summary>
    public enum StatusStudyVocabulary
    {
        /// <summary>
        /// Chưa học
        /// </summary>
        None = 0,

        NewStudy = 1,

        Studied = 2,

    }
}
