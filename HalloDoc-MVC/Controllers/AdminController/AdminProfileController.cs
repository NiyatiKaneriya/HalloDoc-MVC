using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers.AdminController
{
    public class AdminProfileController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
