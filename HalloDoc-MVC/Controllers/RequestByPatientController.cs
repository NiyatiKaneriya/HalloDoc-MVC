using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers
{
    public class RequestByPatientController : Controller
    {
        public IActionResult RequestForMe()
        {
            return View();
        }
        public IActionResult RequestForSomeone()
        {
            return View();
        }
    }
}
