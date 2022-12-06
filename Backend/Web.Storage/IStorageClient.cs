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

        /// <summary>
        /// Lấy path download image
        /// </summary>
        /// <param name="fullPath"></param>
        /// <param name="seconds">Thời gian tạm của path lấy từ storage, tính bằng giây</param>
        /// <returns></returns>
        Task<string> GetPathFileDownloadAsync(string fullPath, int seconds = 60 * 60);
        Task<byte[]> DownloadFileAsync(string fullPath);

        /// <summary>
        /// File dạng base64
        /// </summary>
        /// <param name="fullPath"></param>
        /// <returns></returns>
        Task<string> GetFileStorageAsync(string fullPath);


        Task<bool> DeleteFileStorageAsync(string fullPath);
    }
}
