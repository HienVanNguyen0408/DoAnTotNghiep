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
        private readonly IImportExcelService _importExcelService;

        public DownloadController(IDownloadService downloadService, IImportExcelService importExcelService)
        {
            _downloadService = downloadService;
            _importExcelService = importExcelService;
        }

        [HttpPost]
        public async Task<bool> SaveFile([FromBody] DowloadRequest dowloadRequest)
        {
            return await _downloadService.SaveFile(dowloadRequest.data, dowloadRequest.FolderType, dowloadRequest.FileName);
        }

        [HttpGet]
        public async Task<string> InsertDataAuto([FromQuery] string path)
        {
            return await _downloadService.GetDataFileAsync(path);
        }
        
        [HttpPost("excel")]
        public async Task<string> TestImportExcel([FromQuery] string path)
        {
            await _importExcelService.ImportDataExcelToDBAsync();
            return string.Empty;
        }
    }
}
