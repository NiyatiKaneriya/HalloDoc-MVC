using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace HalloDoc_Patient.Controllers
{
    public class LoginController : Controller
    {
        private readonly ApplicationDbContext _context;
        public LoginController(ApplicationDbContext context)
        {
            _context = context;
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

    }
}