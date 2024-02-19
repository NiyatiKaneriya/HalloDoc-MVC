using HalloDoc_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace HalloDoc_MVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }
    
        public IActionResult submit_request_screen()
        {
            return View();
        }
       
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult ResetPassword(string? Datetime, string? email)
        {
            //string Decodee = Decode(email);
            //DateTime s = DateTime.ParseExact(Decode(Datetime), "MM/dd/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture);
            //TimeSpan dif = s - DateTime.Now;
            //if (dif.Hours < 24)
            //{
            //    ViewBag.email = Decodee;
            //    return View("ResetPassword");
            //}
            //else
            //{
            //    ViewBag.errormsg = "Url is expaier";
            //}
            return View();
        }
    }
}