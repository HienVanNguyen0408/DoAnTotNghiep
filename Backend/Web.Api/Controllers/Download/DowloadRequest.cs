using System;
using System.Buffers.Text;
using Web.AppCore.Entities;

namespace Web.Api.Controllers
{
    public class DowloadRequest
    {
        /// <summary>
        /// data của file
        /// </summary>
        public byte[] data { get; set; }

        /// <summary>
        /// Loại folder 
        /// Vocab, Grammar ....
        /// </summary>
        //public TypeFolder FolderType { get; set; }

        /// <summary>
        /// Tên file
        /// </summary>
        public string FileName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string Base64File { get; set; }

    }
}
