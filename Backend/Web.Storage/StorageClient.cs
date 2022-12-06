using Amazon;
using Amazon.S3;
using Amazon.S3.Model;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Minio;
using Minio.DataModel;
using Minio.Exceptions;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Web.Storage
{
    public class StorageClient : IStorageClient
    {
        private readonly MinioClient _minioClient;
        private readonly StorageSettings _storageSettings;
        private readonly AmazonS3Client _awsClient;

        [Obsolete]
        public StorageClient(IServiceProvider serviceProvider)
        {
            _storageSettings = serviceProvider.GetRequiredService<IOptions<StorageSettings>>().Value;
            //_client = serviceProvider.GetRequiredService<AmazonS3Client>();
            //_minioClient = new MinioClient()
            //                        .WithEndpoint("localhost:9090")
            //                        .WithCredentials("NVHIEN123", "NVHIEN123")
            //                        .Build();
            var config = new AmazonS3Config
            {
                RegionEndpoint = RegionEndpoint.USEast1,
                ServiceURL = _storageSettings.EndPoint,
                ForcePathStyle = true,
                SignatureVersion = "2"
            };
            _awsClient = new AmazonS3Client(_storageSettings.SecretKey, _storageSettings.Password, config);
        }

        #region Methods
        public async Task<bool> UploadFileAsync(string fullPath, byte[] byteFile)
        {
            try
            {
                Stream stream = new MemoryStream(byteFile);
                var request = new PutObjectRequest()
                {
                    BucketName = _storageSettings.BucketName,
                    InputStream = stream,
                    AutoCloseStream = true,
                    Key = fullPath
                };
                var encodedFilename = Uri.EscapeDataString("fileName");
                request.Metadata.Add("original-filename", encodedFilename);
                request.Headers.ContentDisposition = $"attachment; filename=\"{encodedFilename}\"";
                await _awsClient.PutObjectAsync(request);
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        public async Task<string> GetPathFileDownloadAsync(string fullPath, int seconds = 60 * 60)
        {
            try
            {
                var pathData = _awsClient.GetPreSignedURL(new GetPreSignedUrlRequest()
                {
                    BucketName = _storageSettings.BucketName,
                    Key = fullPath,
                    Expires = DateTime.Now.AddMinutes(seconds)
                });
                return pathData.Replace("https","http");
            }
            catch (Exception ex)
            {
                return string.Empty;
            }
        }

        public async Task<byte[]> DownloadFileAsync(string fullPath)
        {
            try
            {
                GetObjectRequest request = new GetObjectRequest()
                {
                    BucketName = _storageSettings.BucketName,
                    Key = fullPath
                };
                using (GetObjectResponse response = await _awsClient.GetObjectAsync(request))
                using (Stream stream = response.ResponseStream)
                using(MemoryStream ms = new MemoryStream())
                {
                    stream.CopyTo(ms);
                    return ms.ToArray();
                };
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// Lấy file storage dạng base 64
        /// </summary>
        /// <param name="fullPath"></param>
        /// <returns></returns>
        public async Task<string> GetFileStorageAsync(string fullPath)
        {
            try
            {
                GetObjectRequest request = new GetObjectRequest()
                {
                    BucketName = _storageSettings.BucketName,
                    Key = fullPath
                };
                using (GetObjectResponse response = await _awsClient.GetObjectAsync(request))
                using (Stream stream = response.ResponseStream)
                using (MemoryStream ms = new MemoryStream())
                {
                    stream.CopyTo(ms);
                    var byteFile = ms.ToArray();
                    if(byteFile != null && byteFile.Length > 0)
                    {
                        return Convert.ToBase64String(byteFile);
                    }
                };
                return string.Empty;
            }
            catch (Exception ex)
            {
                return string.Empty;
            }
        }

        public async Task<bool> DeleteFileStorageAsync(string fullPath)
        {
            try
            {

                var deleteObjectRequest = new DeleteObjectRequest { BucketName = _storageSettings.BucketName, Key = fullPath };
                var response = _awsClient.DeleteObjectAsync(deleteObjectRequest);
                return response != null;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        #endregion
    }
}
