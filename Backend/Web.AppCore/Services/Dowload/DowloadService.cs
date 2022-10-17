using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Web.AppCore.Entities;
using Web.AppCore.Interfaces.Services;
namespace Web.AppCore.Services
{
    public class DowloadService : IDownloadService
    {
        /// <summary>
        /// Lưu trữ dữ liệu ở ổ E trên máy window
        /// </summary>
        private readonly string pathDisk = "E:\\Storage-2022\\";
        private readonly string pathData = "C:\\Users\\ADMIN\\Desktop\\Data";

        public async Task<bool> SaveFile(byte[] data, TypeFolder typeFolder, string fileName)
        {
            try
            {
                if (data == null || data.Length <= 0) return false;
                var pathSave = PathSave(typeFolder,fileName);
                if (string.IsNullOrEmpty(pathSave)) return false;
                File.WriteAllBytes(pathSave, data);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="data">data file mới</param>
        /// <param name="typeFolder"></param>
        /// <param name="fileName">tên file mới</param>
        /// <param name="pathFile">path của file cũ trên storage</param>
        /// <returns></returns>
        public async Task<bool> ChangeFile(byte[] data, TypeFolder typeFolder,string fileName, string pathFile)
        {
            try
            {
                // xóa file trc đó trên storage
                if (File.Exists(pathFile))
                {
                    File.Delete(pathFile);
                }
                var pathSave = PathSave(typeFolder, fileName);
                if(string.IsNullOrEmpty(pathSave)) return false;
                File.WriteAllBytes(pathSave, data);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<string> GetDataFileAsync(string pathFile)
        {
            try
            {
                // xóa file trc đó trên storage
                if ( !string.IsNullOrEmpty(pathFile) && File.Exists(pathFile))
                {
                    var byteFile = File.ReadAllBytes(pathFile);
                    if (byteFile == null)
                    {
                        return "";
                    }
                    return Convert.ToBase64String(byteFile);
                }
                return "";
            }
            catch (Exception)
            {
                return "";
            }
        }

        private List<int> GetResultInFile(string text)
        {
            if (string.IsNullOrEmpty(text)) return null;
            var prefix = "Kết quả:";
            string pattern = $"{prefix}\\S+";
            text = RegexMatch(text, pattern).Replace(prefix,"");
            var result = new List<int>();
            text = text.Trim();
            var textRes = text.Split(",");
            if (textRes == null || textRes.Length <= 0) return null;
            foreach (var item in textRes)
            {
                result.Add(GetSerialOption(item));
            }
            return result;
        }
        private List<string> TextQuestions(string text)
        {
            if (string.IsNullOrEmpty(text)) return null;
            var prefix = "\\d+.[\\s+]";
            var suffix = "\\nA.";
            string pattern = $"{prefix}[^\\n]+{suffix}";
            
            var data = Regex.Match(text, pattern);
            text = RegexMatch(text, pattern).Replace(prefix, "");
            var result = new List<string>();
            text = text.Trim();
           
            return result;
        }
        private int GetSerialOption(string option)
        {
            var res = 0;
            switch (option.ToLower())
            {
                case "a":
                    res = 0;
                    break;
                case "b":
                    res = 1;
                    break;
                case "c":
                    res = 2;
                    break;
                case "d":
                    res = 3;
                    break;
                default: res = 0;
                    break;
            }
            return res;
        }

        private string RegexMatch(string content,string pattern)
        {
            return Regex.Match(content, pattern).Groups[0].Value;
        }
        public string PathSave(TypeFolder typeFolder,string fileName)
        {
            try
            {
                if (string.IsNullOrEmpty(fileName)) return "";
                (StorageFileType, string) fileNameCustom = GetFileNameCustom(fileName);
                // Thư mục lưu trữ các file theo từng nhóm
                // Grammar, Vocab, Question ....
                var folderName = pathDisk + GetFolderParent(typeFolder);

                /// Chưa tồn tại tên folder
                if (!Directory.Exists(folderName))
                {
                    Directory.CreateDirectory(folderName);
                }
                ///Thư mục lưu trữ các file bên trong của các nhóm
                var folderChildName = $"{folderName}\\{GetFolderChild(fileNameCustom.Item1)}";
                /// Chưa tồn tại tên folder
                if (!Directory.Exists(folderChildName))
                {
                    Directory.CreateDirectory(folderChildName);
                }
                var pathSave = $"{folderChildName}\\{fileNameCustom.Item2}";
                if (string.IsNullOrEmpty(pathSave))
                {
                    pathSave = pathSave.Replace(@"\",@"\\");
                }
                return pathSave;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public bool RemoveFileStorage(string path)
        {
            if (string.IsNullOrEmpty(path)) return false;
            if (File.Exists(path))
            {
                File.Delete(path);
                return true;
            }
            return false;
        }
        private string GetFolderParent(TypeFolder typeFolder)
        {
            var folderName = "";
            switch (typeFolder)
            {
                case TypeFolder.Question:
                    folderName = "Question";
                    break;
                case TypeFolder.Grammar:
                    folderName = "Grammar";
                    break;
                case TypeFolder.Vocabulary:
                    folderName = "Vocabulary";
                    break;
            }
            return folderName;
        }
        private string GetFolderChild(StorageFileType fileType)
        {
            var folderName = "";
            switch (fileType)
            {
                case StorageFileType.Audio:
                    folderName = "Audio";
                    break;
                case StorageFileType.Image:
                    folderName = "Image";
                    break;
                case StorageFileType.Video:
                    folderName = "Video";
                    break;
                case StorageFileType.Pdf:
                    folderName = "Pdf";
                    break;
            }
            return folderName;
        }
        private (StorageFileType, string) GetFileNameCustom(string fileName)
        {
            if (string.IsNullOrEmpty(fileName)) return (StorageFileType.Image,"");
            var formatImageList = new List<string>
            {
               ".png",".jpg",".svg",".jpeg",".jfif"
            };

            var formatAudioList = new List<string>
            {
               ".mpeg",".ogg",".wav",".mp3"
            };

            var formatVideo = new List<string>
            {
               ".webm",".mkv",".flv",".vob",".ogv",".gifv", ".gif"
            };

            var formatPdf = new List<string>
            {
               ".pdf"
            };
            if (formatImageList.Exists(x => fileName.Contains(x,StringComparison.OrdinalIgnoreCase)))
            {
                return (StorageFileType.Image,$"{DateTime.Now.ToString("hhmmss")}_{fileName}");
            }
            if (formatAudioList.Exists(x => fileName.Contains(x, StringComparison.OrdinalIgnoreCase)))
            {
                return (StorageFileType.Audio, $"{DateTime.Now.ToString("hhmmss")}_{fileName}");
            }
            if (formatVideo.Exists(x => fileName.Contains(x, StringComparison.OrdinalIgnoreCase)))
            {
                return (StorageFileType.Video, $"{DateTime.Now.ToString("hhmmss")}_{fileName}");
            }
            if (formatPdf.Exists(x => fileName.Contains(x, StringComparison.OrdinalIgnoreCase)))
            {
                return (StorageFileType.Pdf, $"{DateTime.Now.ToString("hhmmss")}_{fileName}");
            }
            return (StorageFileType.Image, "");
        }

    }
}
