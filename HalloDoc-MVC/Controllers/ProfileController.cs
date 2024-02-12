using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers
{
    public class ProfileController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
