using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Net.Mail;
using System.Net;


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
        public IActionResult ResetPassword()
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

        public IActionResult SendEmail( String To, string Subject, string Body)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(_emailConfig.From);
            message.Subject = Subject;
            message.To.Add(new MailAddress(To));
            message.Body = Body;
            message.IsBodyHtml = true;
            using (var smtpClient = new SmtpClient(_emailConfig.SmtpServer))
            {
                smtpClient.Port = 587 ;
                smtpClient.Credentials = new NetworkCredential(_emailConfig.Username, _emailConfig.Password);
                smtpClient.EnableSsl = true;

                smtpClient.Send(message);
            }

            return View("Index");
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

        public async Task<IActionResult> ResetEmail(SendEmailModel sendEmailModel)            
        {
            var email = sendEmailModel.Email;
            if (await CheckregisterdAsync(email))
            {
                var Subject = "Change PassWord";
                var Body = "<html><body> your reset pas link is http://localhost:7242/Login/ResetPassword?Datetime=" + Encode(DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt")) + "&email=" + Encode(sendEmailModel.Email) + " </body></html>"; ;
               //var Body = "<html><body> your reset pas link is http://localhost:7242/Login/ResetPassword?Datetime=" +DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt") + "&email=" + sendEmailModel.Email + " </body></html>"; ;

                SendEmail(sendEmailModel.Email, Subject, Body);



                ViewData["EmailCheck"] = "Your ID Pass Send In Your Mail";
            }
            else
            {
                ViewData["EmailCheck"] = "Your Email Is not registered";
                return View("ForgotPassword");
            }
            return View("Index");
        }

        

        public async Task<bool> CheckregisterdAsync(string email)
        {
          

                var U = await _context.AspNetUsers.FirstOrDefaultAsync(m => m.Email == email);
                if (U != null)
                {
                    return true;
                }
            

            return false;
        }
    }
}