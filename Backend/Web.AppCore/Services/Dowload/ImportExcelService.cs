using Aspose.Cells;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using Web.AppCore.Interfaces.Services;
using Web.Models.Entities;
using Web.Models.Request.Download;

namespace Web.AppCore.Services
{
    public class ImportExcelService : IImportExcelService
    {
        private readonly ICustomerService _customerService;
        public ImportExcelService(ICustomerService customerService)
        {
            _customerService = customerService;
        }
        public async Task<bool> ImportDataExcelToDBAsync(ExcelRequest request)
        {
            try
            {
                if (request.FileData == null || request.FileData.Length <= 0) return false;
                var customers = new List<Customer>();
                //var dir = "";
                //// load spreadsheet file
                //var baseDir = Directory.GetCurrentDirectory();
                //var fileName = "data.csv";
                Stream stream = new MemoryStream(request.FileData);
                var workbook = new Workbook(stream);
                var ws = workbook.Worksheets[0];
                //Duyệt qua các dòng
                for (int row = 1; row < 7044; row++)
                {
                    var customer = new Customer();
                    customer.CustomerId = $"{Guid.NewGuid()}";
                    customer.CustomerCode = ws.Cells[row, 0].Value.ToString();
                    customer.Gender = ws.Cells[row, 1].Value.ToString();
                    customer.SeniorCitizen = (int)ws.Cells[row, 2].Value;
                    customer.Partner = ws.Cells[row, 3].Value.ToString();
                    customer.Dependents = ws.Cells[row, 4].Value.ToString();
                    customer.Tenure = (int)ws.Cells[row, 5].Value;
                    customer.PhoneService = ws.Cells[row, 6].Value.ToString();
                    customer.MultipleLines = ws.Cells[row, 7].Value.ToString();
                    customer.InternetService = ws.Cells[row, 8].Value.ToString();
                    customer.OnlineSecurity = ws.Cells[row, 9].Value.ToString();
                    customer.OnlineBackup = ws.Cells[row, 10].Value.ToString();
                    customer.DeviceProtection = ws.Cells[row, 11].Value.ToString();
                    customer.TechSupport = ws.Cells[row, 12].Value.ToString();
                    customer.StreamingTV = ws.Cells[row, 13].Value.ToString();
                    customer.StreamingMovies = ws.Cells[row, 14].Value.ToString();
                    customer.Contract = ws.Cells[row, 15].Value.ToString();
                    customer.PaperlessBilling = ws.Cells[row, 16].Value.ToString();
                    customer.PaymentMethod = ws.Cells[row, 17].Value.ToString();
                    customer.MonthlyCharges = ws.Cells[row, 18].Value.ToString();
                    customer.TotalCharges = ws.Cells[row, 19].Value.ToString();
                    customer.Churn = ws.Cells[row, 20].Value.ToString();
                    customers.Add(customer);
                }
                //var res = await _customerService.InsertManyCustomersAsync(customers);
                return false;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
