using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Net.Mail;
using System.Net;
using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_BAL.Interfaces;

namespace HalloDoc_MVC.Controllers
{
    
    public class SendAgreementController : Controller
    {
        private readonly SendEmailModel _emailConfig;
        private readonly IActionRepository _actionRepository;
        public SendAgreementController( SendEmailModel emailConfig, IActionRepository actionRepository)
        {
            _emailConfig = emailConfig;
            _actionRepository = actionRepository;
        }
        public IActionResult ReviewAgreement(string Requestid, string? name)
        {
           
            string DecodeeRequestid = Decode(Requestid);
            string DecodeeName = Decode(name);
            if (_actionRepository.IsAgreementValid(Convert.ToInt32(DecodeeRequestid)))
            {
                ViewBag.Requestid = DecodeeRequestid;
                ViewBag.Name = DecodeeName;
                return View();
            }
            
           return RedirectToAction("Index","Login");
        }
        public string Encode(string encodeMe)
        {
            byte[] encoded = System.Text.Encoding.UTF8.GetBytes(encodeMe);
            return Convert.ToBase64String(encoded);
        }
        public string Decode(string decodeMe)
        {
            byte[] encoded = Convert.FromBase64String(decodeMe);
            return System.Text.Encoding.UTF8.GetString(encoded);
        }
        public IActionResult SendAgreement(string email, int RequestId, SendEmailModel sendEmailModel)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(_emailConfig.From);
            message.Subject = "Accept the Agreement";
            message.To.Add(new MailAddress(email));
            //message.Body = "Please Accept the Agreement to process your Request.";
            var Body = "<html><body> Please Click on this link to review the agreement <a href='https://localhost:44312/SendAgreement/ReviewAgreement?Requestid=" + Encode(sendEmailModel.Requestid) + "&name=" + Encode(sendEmailModel.name) + "'>click</a> </body></html>"; ;
            message.Body = Body;
            message.IsBodyHtml = true;
            using (var smtpClient = new SmtpClient(_emailConfig.SmtpServer))
            {
                smtpClient.Port = 587;
                smtpClient.Credentials = new NetworkCredential(_emailConfig.Username, _emailConfig.Password);
                smtpClient.EnableSsl = true;

                smtpClient.Send(message);
            }

            return RedirectToAction("Index","AdminDashboard");
        }
        public IActionResult SendLink(string FirstName, string LastName, string email,  SendEmailModel sendEmailModel)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(_emailConfig.From);
            message.Subject = "Submit the Request";
            message.To.Add(new MailAddress(email));
            //message.Body = "Please Accept the Agreement to process your Request.";
            var Body = "<html><body>Hello, " + FirstName + " "+ LastName+ "<br>  Please submit a request through this <a href='https://localhost:44312/Home/submit_request_screen'>link</a> </body></html>"; ;
            message.Body = Body;
            message.IsBodyHtml = true;
            using (var smtpClient = new SmtpClient(_emailConfig.SmtpServer))
            {
                smtpClient.Port = 587;
                smtpClient.Credentials = new NetworkCredential(_emailConfig.Username, _emailConfig.Password);
                smtpClient.EnableSsl = true;

                smtpClient.Send(message);
            }

            return RedirectToAction("Index", "AdminDashboard");
        }
        public IActionResult Accept(int RequestId)
        {
            _actionRepository.Accept(RequestId);
            return RedirectToAction("Index", "Login");
        }
        public IActionResult CancelAgreement(int RequestId,string? Notes)
        {
            _actionRepository.CancelAgreement(RequestId,Notes);
            return RedirectToAction("Index", "Login");
        }
    }
}
