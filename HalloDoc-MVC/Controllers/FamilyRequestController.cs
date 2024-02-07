using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_Patient.Controllers
{
    public class FamilyRequestController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
