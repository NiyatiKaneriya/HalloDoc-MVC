using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Globalization;
using Microsoft.AspNetCore.Identity;
using System.Text;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using HalloDoc_BAL.Interfaces;
using HalloDoc_BAL.Repository.Interfaces;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using Microsoft.AspNetCore.Http;

namespace HalloDoc_MVC.Controllers
{
    
    public class LoginController : Controller
    {
        
        private readonly SendEmailModel _emailConfig;
        private readonly ILoginRepository _loginRepository;
        private readonly IJwtService _jwtService;
        public LoginController( SendEmailModel emailConfig, ILoginRepository loginRepository,IJwtService jwtService)
        {
            
            _emailConfig = emailConfig;
            _loginRepository = loginRepository;
            _jwtService = jwtService;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult AccessDenied()
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
            
            UserInfo admin = await _loginRepository.CheckAccessLogin(aspNetUser);
            if (admin != null)
            {
                HttpContext.Session.SetString("UserID",Convert.ToString(admin.UserId));
                HttpContext.Session.SetString("UserName", admin.UserName);
                TempData["error"] = "Correct";
                // SessionUtils.setLogginUser(HttpContext.Session, admin);

                var jwttoken = _jwtService.GenerateJWTAuthetication(admin);
                Response.Cookies.Append("jwt", jwttoken);

                if (admin.Role == "Patient")
                {
                    return RedirectToAction("Index", "Dashboard");
                }
                return RedirectToAction("Index", "AdminDashboard");
            }
            else
            {
                TempData["error"] = "InCorrect Id Or Pass";
                return RedirectToAction("Index", "Login");
            }
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Login");
        }

        public IActionResult SendEmail(String To, string Subject, string Body)
        {

            MailMessage message = new MailMessage();
            message.From = new MailAddress(_emailConfig.From);
            message.Subject = Subject;
            message.To.Add(new MailAddress(To));
            message.Body = Body;
            message.IsBodyHtml = true;
            using (var smtpClient = new SmtpClient(_emailConfig.SmtpServer))
            {
                smtpClient.Port = 587;
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
            if (await _loginRepository.CheckregisterdAsync(email))
            {
                var Subject = "Reset Password";
                var Body = "<html><body> your reset pas link is https://localhost:7242/Login/ResetPassword?Datetime=" + Encode(DateTime.Now.ToString("MM-dd-yyyy hh:mm:ss tt")) + "&email=" + Encode(sendEmailModel.Email) + " </body></html>"; ;

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

        public IActionResult ResetPassword(string? Datetime, string? email)
        {
            string Decodee = Decode(email);

            DateTime s = DateTime.ParseExact(Decode(Datetime), "MM-dd-yyyy hh:mm:ss tt", CultureInfo.InvariantCulture);

            TimeSpan difference = s - (DateTime.Now);

            if (difference.Hours < 24)
            {
                ViewBag.email = Decodee;
                return View("ResetPassword");
            }
            else
            {
                ViewBag.errormsg = "Url is expaier";
            }
            return View();
            
        }
        public async Task<IActionResult> SavePassAsync(string ConfirmPassword, string Password, string Email)
        {
            string Decodee = Decode(Email);

            if(await _loginRepository.SavePasswordAsync(ConfirmPassword, Password, Decodee))
            {

                ViewData["error"] = "Pass is Upadated";
            }
            else
            {
                ViewData["error"] = "Pass is Mismatch";
                return View("ResetPassword");
            }
            return View("Index");
            

        }
    }
}