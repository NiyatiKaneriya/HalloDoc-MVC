using HalloDoc_BAL.Interfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using HalloDoc_MVC.Models;
using HalloDoc_MVC.Models.CV;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers
{
    public class DashboardController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IDashboardRepository _DashboardRepository;

        public DashboardController(ApplicationDbContext context, IDashboardRepository dashboardRepository)
        {
            _context = context;
            _DashboardRepository = dashboardRepository;
        }

        //public IActionResult Index => View();
        public IActionResult Index(ViewDashboard viewDashboard)
        { 
            var UserID = Convert.ToInt32(CV.UserID());
            return View(_DashboardRepository.GetRequest(viewDashboard,UserID));
        }

        public IActionResult Documents(int? Requestid)
        {
            return View(_DashboardRepository.GetDocuments(Requestid));
        }

        public IActionResult UploadDoc(int Requestid, IFormFile file)
        {
            string UploadDoc;
            if (file != null)
            {
                string FilePath = "wwwroot\\UploadedFiles\\" + Requestid;
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string newfilename = $"{Path.GetFileNameWithoutExtension(file.FileName)}-{DateTime.Now.ToString("yyyyMMddhhmmss")}.{Path.GetExtension(file.FileName).Trim('.')}";

                string fileNameWithPath = Path.Combine(path, newfilename);
                UploadDoc = FilePath.Replace("wwwroot\\UploadedFiles\\", "/UploadedFiles/") + "/" + newfilename;
                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }

                _DashboardRepository.UploadDocs(Requestid, UploadDoc);
                
                return RedirectToAction("Documents", new { Requestid = Requestid });
               
            }
            else
            {
                return BadRequest("No file Provided for upload");
            }

            
        }
        
    }
}
