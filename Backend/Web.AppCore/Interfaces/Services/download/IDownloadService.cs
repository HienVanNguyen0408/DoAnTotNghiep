using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Web.AppCore.Entities;

namespace Web.AppCore.Interfaces.Services
{
    public interface IDownloadService
    {
        Task<bool> SaveFile(byte[] data, TypeFolder typeFolder, string fileName);
        string PathSave(TypeFolder typeFolder, string fileName);
        bool RemoveFileStorage(string path);
        Task<bool> ChangeFile(byte[] data, TypeFolder typeFolder, string fileName, string pathFile);

        Task<string> GetDataFileAsync(string pathFile);
    }
}
