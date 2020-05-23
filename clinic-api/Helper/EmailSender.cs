using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace clinic_api.Helper
{
    public static class EmailSender
    {
        public static async Task SendEmailAsync(string subject, string message)
        {
            var smtpClient = new SmtpClient
            {
                Host = "smtp.gmail.com", // set your SMTP server name here
                Port = 587, // Port 
                UseDefaultCredentials = false,
                EnableSsl = true,
                Credentials = new NetworkCredential("smartclinic007@gmail.com", "Ssm@rt&C1ini0")
            };

            using (MailMessage mailMessage = new MailMessage("smartclinic007@gmail.com", "smartclinic007@gmail.com")
            {
                Subject = subject,
                Body = message,
                IsBodyHtml = true
            })
            {
                await smtpClient.SendMailAsync(mailMessage);
            }
        }
    }
}
