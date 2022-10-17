using System;
using System.Collections.Generic;
using System.Text;

namespace Web.AppCore.Entities
{
    public class StorageFile
    {
        /// <summary>
        /// Id
        /// </summary>
        public Guid StorageFileId { get; set; }

        /// <summary>
        /// Nơi lưu trữ file
        /// </summary>
        public string PathStorageFile { get; set; }

        /// <summary>
        /// Tên file
        /// </summary>
        public string FileName { get; set; }

        /// <summary>
        /// Loại file
        /// </summary>
        public StorageFileType FileType { get; set; } = StorageFileType.None;
    }

    public enum StorageFileType
    {
        None = 0,
        Image = 1,
        Audio = 2,
        Video = 3,
        Pdf = 4,
    }

    /// <summary>
    /// Loại folder lưu file
    /// </summary>
    public enum TypeFolder{
        Grammar = 1,
        Vocabulary = 2,
        Question = 3,
    }
}
