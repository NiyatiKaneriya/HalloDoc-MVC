using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
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
        public Task<IActionResult> Index()
        {
            return Task.FromResult<IActionResult>(View(Request));
        }

    }
}
