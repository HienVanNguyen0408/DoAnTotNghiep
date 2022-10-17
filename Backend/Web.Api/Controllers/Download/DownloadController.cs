using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;

namespace Web.Api.Controllers
{
    [ApiController]
    [Route("api/v1/[Controller]")]
    public class DownloadController : Controller
    {
        private readonly IDownloadService _downloadService;

        public DownloadController(IDownloadService downloadService)
        {
            _downloadService = downloadService; 
        }

        [HttpPost]
        public async Task<bool> SaveFile([FromBody] DowloadRequest dowloadRequest)
        {
            return await _downloadService.SaveFile(dowloadRequest.data,dowloadRequest.FolderType,dowloadRequest.FileName);
        }

        [HttpGet]
        public async Task<string> InsertDataAuto([FromQuery] string path)
        {
            return await _downloadService.GetDataFileAsync(path);
        }
    }
}
