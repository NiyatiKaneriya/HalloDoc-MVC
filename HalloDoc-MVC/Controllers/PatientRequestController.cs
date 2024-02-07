using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_Patient.Controllers
{
    public class PatientRequestController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
