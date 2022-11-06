using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Request.Download;

namespace Web.AppCore.Interfaces.Services
{
    public interface IImportExcelService
    {
        Task<bool> ImportDataExcelToDBAsync(ExcelRequest request);
    }
}
