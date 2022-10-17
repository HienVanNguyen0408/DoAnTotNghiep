using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using Web.Models.LibraryClass;
using MailKit.Security;
using Microsoft.Extensions.Options;
using MimeKit;
using Microsoft.Extensions.DependencyInjection;
using Web.Models.Entities;

namespace Web.Infrastructure.Services
{
    public class SendMailClient : BaseClass<SendMailClient>, ISendMailClient
    {

        #region Declaration
        private const string TAG = "SendMailClient";
        protected SmtpClient _smtpClient;
        protected EmailSettings _emailSettings;
        #endregion
        public SendMailClient(IOptions<EmailSettings> options,IServiceProvider serviceProvider) : base(serviceProvider)
        {
            _emailSettings = options.Value;
        }

        /// <summary>
        /// Gửi Email
        /// </summary>
        /// <param name="from">Địa chỉ email gửi</param>
        /// <param name="to">Địa chỉ email nhận</param>
        /// <param name="subject">Chủ đề của email</param>
        /// <param name="body">Nội dung (hỗ trợ HTML) của email</param>
        /// <param name="client">SmtpClient - kết nối smtp để chuyển thư</param>
        /// <returns>Task</returns>
        public async Task<bool> SendMail(string from, string to, string subject, string body, SmtpClient client)
        {
            // Tạo nội dung Email
            MailMessage message = new MailMessage(
                from: from,
                to: to,
                subject: subject,
                body: body
            );
            message.BodyEncoding = System.Text.Encoding.UTF8;
            message.SubjectEncoding = System.Text.Encoding.UTF8;
            message.IsBodyHtml = true;
            message.ReplyToList.Add(new MailAddress(from));
            message.Sender = new MailAddress(from);

            try
            {
                await client.SendMailAsync(message);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError($"{TAG}::Lỗi hàm SendMail::Exception::{ex.Message}");
                return false;
            }
        }
        /// <summary>
        /// Gửi Email sử dụng máy chủ SMTP cài đặt localhost
        /// </summary>
        public async Task<bool> SendMailLocalSmtp(string from, string to, string subject, string body)
        {
            using (SmtpClient client = new SmtpClient("localhost"))
            {
                return await SendMail(from, to, subject, body, client);
            }
        }

        /// <summary>
        /// Gửi email sử dụng máy chủ SMTP Google (smtp.gmail.com)
        /// </summary>
        public async Task<bool> SendMailGoogleSmtp(string from, string to, string subject, string body, string gmailsend, string gmailpassword)
        {

            MailMessage message = new MailMessage(
                from: from,
                to: to,
                subject: subject,
                body: body
            );
            message.BodyEncoding = System.Text.Encoding.UTF8;
            message.SubjectEncoding = System.Text.Encoding.UTF8;
            message.IsBodyHtml = true;
            message.ReplyToList.Add(new MailAddress(from));
            message.Sender = new MailAddress(from);

            // Tạo SmtpClient kết nối đến smtp.gmail.com
            using (SmtpClient client = new SmtpClient("smtp.gmail.com"))
            {
                client.Port = 587;
                client.Credentials = new NetworkCredential(gmailsend, gmailpassword);
                client.EnableSsl = true;
                return await SendMail(from, to, subject, body, client);
            }
        }


        // Gửi email, theo nội dung trong mailContent
        public async Task SendMailAsync(MailContent mailContent)
        {
            var email = new MimeMessage();
            email.Sender = new MailboxAddress(_emailSettings.DisplayName, _emailSettings.Mail);
            email.From.Add(new MailboxAddress(_emailSettings.DisplayName, _emailSettings.Mail));
            email.To.Add(MailboxAddress.Parse(mailContent.To));
            email.Subject = mailContent.Subject;


            var builder = new BodyBuilder();
            builder.HtmlBody = mailContent.Body;
            email.Body = builder.ToMessageBody();

            // dùng SmtpClient của MailKit
            using var smtp = new MailKit.Net.Smtp.SmtpClient();

            try
            {
                smtp.Connect(_emailSettings.Host, _emailSettings.Port, SecureSocketOptions.StartTls);
                smtp.Authenticate(_emailSettings.Mail, _emailSettings.Password);
                await smtp.SendAsync(email);
            }
            catch (Exception ex)
            {
                // Gửi mail thất bại, nội dung email sẽ lưu vào thư mục mailssave
                System.IO.Directory.CreateDirectory("mailssave");
                var emailsavefile = string.Format(@"mailssave/{0}.eml", Guid.NewGuid());
                await email.WriteToAsync(emailsavefile);
                _logger.LogInformation($"{TAG}::Lỗi hàm SendMailAsync ::Lỗi gửi mail, lưu tại - {emailsavefile}::Exception::{ex.Message}");
            }

            smtp.Disconnect(true);

            _logger.LogInformation($"{TAG}::Hàm SendMailAsync::send mail to " + mailContent.To);

        }
        public async Task SendMailAsync(string email, string subject, string htmlMessage)
        {
            await SendMailAsync(new MailContent()
            {
                To = email,
                Subject = subject,
                Body = htmlMessage
            });
        }

    }
}
