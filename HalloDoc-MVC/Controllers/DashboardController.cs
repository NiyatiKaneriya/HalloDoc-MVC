using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HelloDoc.Models.CV;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers
{
    public class DashboardController : Controller
    {
        private readonly ApplicationDbContext _context;


        public DashboardController(ApplicationDbContext context)
        {
            _context = context;
        }

        //public IActionResult Index => View();
        public IActionResult Index()
        {
            var Request = _context.Requests.Where(r => r.UserId == Convert.ToInt32(CV.UserID())).ToList();

            return View(Request);
        }

    }
}
