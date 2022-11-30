using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Storage
{
    public interface IStorageClient
    {
        Task<bool> UploadFileAsync(string fullPath, byte[] byteFile);
        Task<string> GetPathFileDownloadAsync(string fullPath);
        Task<byte[]> DownloadFileAsync(string fullPath);

        /// <summary>
        /// File dạng base64
        /// </summary>
        /// <param name="fullPath"></param>
        /// <returns></returns>
        Task<string> GetFileStorageAsync(string fullPath);
    }
}
