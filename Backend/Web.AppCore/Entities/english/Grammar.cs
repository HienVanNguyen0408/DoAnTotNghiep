using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using Microsoft.EntityFrameworkCore;
namespace Web.AppCore.Entities
{
    public class Grammar : BaseEntity
    {
        /// <summary>
        /// Id
        /// </summary>
        public Guid GrammarId { get; set; }

        /// <summary>
        /// Loại cấu trúc ngữ pháp
        /// </summary>
        public Guid TypeGrammarId { get; set; }
        public TypeGrammar TypeGrammar { get; set; }


        /// <summary>
        /// Tên loại cấu trúc ngữ pháp
        /// </summary>
        public string TypeGrammarName { get; set; }

        /// <summary>
        /// Path lưu anh mô tả chính cấu trúc ngữ pháp
        /// </summary>
        public string PathImage { get; set; }

        /// <summary>
        /// Path lưu audio mô tả chính cấu trúc ngữ pháp
        /// </summary>
        public string PathAudio { get; set; }

        /// <summary>
        /// Gen bảng quan hệ
        /// </summary>
        public ICollection<ContentGrammar> ContentGrammar { get; set; }
    }

    public class ContentGrammar
    {
        /// <summary>
        ///Id
        /// </summary>
        public Guid ContentGrammarId { get; set; }

        /// <summary>
        /// Id Của grammar
        /// </summary>
        public Guid GrammarId { get; set; }

        public Grammar Grammar { get; set; }


        /// <summary>
        /// Nội dung của content grammar
        /// </summary>
        public string Content { get; set; }

        /// <summary>
        /// Số thứ tự để hiện thị content
        /// </summary>
        public int NumberContent { get; set; }


        /// <summary>
        /// Path lưu anh mô tả cấu trúc ngữ pháp
        /// </summary>
        public string PathImage { get; set; }

        /// <summary>
        /// Path lưu audio mô tả cấu trúc ngữ pháp
        /// </summary>
        public string PathAudio { get; set; }

        /// <summary>
        /// Path lưu video giải thích cấu trúc ngữ pháp
        /// </summary>
        public string PathVideo { get; set; }

        /// <summary>
        /// Thời gian tạo
        /// </summary>
        public DateTime? CreatedDate { get; set; }

        /// <summary>
        /// Thời gian sửa đổi
        /// </summary>
        public DateTime? ModifiedDate { get; set; }

    }
    public class TypeGrammar
    {
        /// <summary>
        /// Id
        /// </summary>
        public Guid TypeGrammarId { get; set; }

        /// <summary>
        /// Tên loại cấu trúc ngữ pháp
        /// </summary>
        public string TypeGrammarName { get; set; }

        /// <summary>
        /// 1-n
        /// </summary>
        public ICollection<Grammar> Grammar { get; set; }
    }
}
