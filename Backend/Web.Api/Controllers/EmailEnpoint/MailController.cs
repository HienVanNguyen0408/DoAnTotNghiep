using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using Web.Infrastructure.Services;
using Web.Models.Entities;
using Microsoft.Extensions.Logging;
namespace Web.Api.Controllers
{
    public class EmailController : BaseAuthController<EmailController>
    {
        #region Declaration
        private const string TAG = "MailController";
        protected ISendMailClient _mailClient;
        #endregion
        public EmailController(ISendMailClient mailClient, IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _mailClient = mailClient;
        }

        #region Methods

        [HttpGet]
        public async Task<bool> SendEmailAsync([FromBody] MailContent mailContent)
        {
            try
            {
                await _mailClient.SendMailAsync(mailContent);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm SendEmailAsync::Exception::{ex.Message}");
                return false;
            }
        }


        [HttpGet("send-email")]
        public async Task<bool> SendEmailAsync([FromQuery] string to, [FromQuery] string subject, [FromQuery] string body)
        {
            try
            {
                await _mailClient.SendMailAsync(to,subject,body);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm SendEmailAsync::Exception::{ex.Message}");
                return false;
            }
        }
        #endregion
    }
}
