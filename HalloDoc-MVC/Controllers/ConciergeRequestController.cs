using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_Patient.Controllers
{
    public class ConciergeRequestController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
