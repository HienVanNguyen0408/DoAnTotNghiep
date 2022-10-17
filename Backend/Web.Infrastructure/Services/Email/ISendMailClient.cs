using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using Web.Models.Entities;

namespace Web.Infrastructure.Services
{
    public interface ISendMailClient
    {
        /// <summary>
        /// Gửi mail
        /// </summary>
        /// <param name="from">Địa chỉ mail gửi</param>
        /// <param name="to">Địa chỉ mail đến</param>
        /// <param name="subject">Tiêu đề</param>
        /// <param name="body">Nội dung</param>
        /// <param name="client"></param>
        /// <returns></returns>
        //Task<bool> SendMail(string from, string to, string subject, string body, SmtpClient client);

        /// <summary>
        /// Gửi mail local smtp
        /// </summary>
        /// <param name="from">Địa chỉ mail gửi</param>
        /// <param name="to">Địa chỉ mail đến</param>
        /// <param name="subject">Tiêu đề</param>
        /// <param name="body">Nội dung</param>
        /// <returns></returns>
        Task<bool> SendMailLocalSmtp(string from, string to, string subject, string body);

        /// <summary>
        /// Gửi email đến google SMTP
        /// </summary>
        /// <param name="from">Địa chỉ mail gửi</param>
        /// <param name="to">Địa chỉ mail đến</param>
        /// <param name="subject">Tiêu đề</param>
        /// <param name="body">Nội dung</param>
        /// <param name="gmailsend"></param>
        /// <param name="gmailpassword"></param>
        /// <returns></returns>
        Task<bool> SendMailGoogleSmtp(string from, string to, string subject, string body, string gmailsend, string gmailpassword);


        Task SendMailAsync(MailContent mailContent);
        Task SendMailAsync(string email, string subject, string htmlMessage);
    }
}
