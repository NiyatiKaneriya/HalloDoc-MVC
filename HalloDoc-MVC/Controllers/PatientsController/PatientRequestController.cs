using HalloDoc_BAL.Repository.Interfaces;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers
{
    public class PatientRequestController : Controller
    {
        
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly ICreateRequestsRepository _createRequestsRepository;

        public PatientRequestController( IWebHostEnvironment webHostEnvironment, ICreateRequestsRepository createRequestsRepository)
        {
           
            _webHostEnvironment = webHostEnvironment;
            _createRequestsRepository = createRequestsRepository;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> CheckEmailAsync(string email,AspNetUser aspNetUser)
        {
            string message;

            var aspnetuser = await _createRequestsRepository.aspNetUsers(email,aspNetUser);

            if (aspnetuser == null)
            {
                message = "False";
            }
            else
            {
                message = "success";
                var id = aspnetuser.Id;
                var user = await _createRequestsRepository.users(id);

            }
            return Json(new
            {
                Message = message
            });
        }

        public async Task<IActionResult> createAsync(ViewPatientRequest model)
        {
            if ( await _createRequestsRepository.CreatePatientRequest(model))
            {
                return RedirectToAction("index");
            }
            else
            {
                ViewData["error"] = "Can't Process Your Request, Try Again";
                return View("Index");
            }

        }
    }
}
