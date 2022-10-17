using System;
using System.Collections.Generic;
using System.Text;
using Web.AppCore.Enum;

namespace Web.AppCore.Entities
{
    public class Vocabulary
    {
        /// <summary>
        /// Id
        /// </summary>
        public Guid VocabularyId { get; set; }
        /// <summary>
        /// Tiếng anh
        /// </summary>
        public string EnglishName { get; set; }
        /// <summary>
        /// Nghĩa tiếng việt
        /// </summary>
        public string VietnameseName { get; set; }

        /// <summary>
        /// Phát âm
        /// </summary>
        public string Pronounce { get; set; }

        /// <summary>
        /// Loại từ
        /// </summary>
        public WordType  WordType { get; set; } = WordType.None;

        /// <summary>
        /// Path lưu trữ audio của từ
        /// </summary>
        public string PathAudio { get; set; }

        /// <summary>
        /// Path ảnh mô tả về từ vựng
        /// </summary>
        public string PathImage { get; set; }

        /// <summary>
        /// Mô tả từ vựng
        /// </summary>
        public string Discription { get; set; }

        /// <summary>
        /// Thời gian tạo từ
        /// </summary>
        public DateTime? CreatedDate { get; set; }
        /// <summary>
        /// Thời gian sửa từ
        /// </summary>
        public DateTime? ModifiedDate { get; set; }

        /// <summary>
        /// Gen bảng quan hệ
        /// </summary>
        public ICollection<Synonyms> Synonyms { get; set; }
        public ICollection<Example> Example { get; set; }
    }
    /// <summary>
    /// Từ đồng nghĩa
    /// </summary>
    public class Synonyms
    {
        /// <summary>
        /// Id từ vựng từ đồng nghĩa: 
        /// </summary>
        public Guid SynonymsId { get; set; }

        /// <summary>
        /// Id của từ đồng nghĩa
        /// </summary>
        public Guid VocabularyId { get; set; }
        public Vocabulary Vocabulary { get; set; }

        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        public DateTime? CreatedDate { get; set; }

        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        public DateTime? ModifiedDate { get; set; }
    }

    /// <summary>
    /// Ví dụ cho việc học từ vựng
    /// </summary>
    public class Example
    {
        /// <summary>
        /// Id
        /// </summary>
        public Guid ExampleId { get; set; }
        
        /// <summary>
        /// Id của từ vựng
        /// </summary>
        public Guid VocabularyId { get; set; }
        public Vocabulary Vocabulary { get; set; }

        /// <summary>
        /// Nội dung của ví dụ 
        /// </summary>
        public string ContentExample { get; set; }

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
