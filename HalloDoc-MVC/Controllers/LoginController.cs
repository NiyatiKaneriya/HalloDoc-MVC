using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Net.Mail;
using System.Net;
using Humanizer;

namespace HalloDoc_Patient.Controllers
{
    public class LoginController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly SendEmailModel _emailConfig;
        public LoginController(ApplicationDbContext context, SendEmailModel emailConfig)
        {
            _context = context;
            _emailConfig = emailConfig;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> checkLoginAsync(AspNetUser aspNetUser)
        {
            var user = _context.AspNetUsers.FirstOrDefault(u => (u.UserName == aspNetUser.UserName) && (u.PasswordHash == aspNetUser.PasswordHash));
            if (user != null)
            {
                HttpContext.Session.SetString("UserName", user.UserName.ToString());
                var Ua = await _context.Users.FirstOrDefaultAsync(m => m.Id == user.Id);
                HttpContext.Session.SetString("UserID", Ua.UserId.ToString());

                //var userRequests = _context.Requests.Where(r => r.UserId == U.UserId).ToList();
                return RedirectToAction("Index", "Dashboard");
            }
            else
            {
                ViewData["error"] = "Invalid Id Pass";
                return View("Index");
            }
        }
        public  IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Login");
        }

        public IActionResult SendEmail(SendEmailModel sendEmailModel)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(_emailConfig.From);
            message.Subject = "Reset Password";
            message.To.Add(new MailAddress(sendEmailModel.Email));
            message.Body = "This is your new password 12345";
            message.IsBodyHtml = true;
            using (var smtpClient = new SmtpClient(_emailConfig.SmtpServer))
            {
                smtpClient.Port = 587 ;
                smtpClient.Credentials = new NetworkCredential(_emailConfig.Username, _emailConfig.Password);
                smtpClient.EnableSsl = true;

                smtpClient.Send(message);
            }

            return View();
        }

    }
}