using HalloDoc_BAL.Repository.Interfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Collections;

namespace HalloDoc_MVC.Controllers
{
    public class ConciergeRequestController : Controller
    {
        private readonly ICreateRequestsRepository _createRequestsRepository;
        public ConciergeRequestController(ICreateRequestsRepository createRequestsRepository)
        {
            _createRequestsRepository = createRequestsRepository;
        }
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Create(ViewConciergeRequest model)
        {
            
                if (await _createRequestsRepository.CreateConciergeRequest(model))
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewData["error"] = "Can't Process Your Request, Try Again";
                    return View("Index");
                }
        }
            

        

    }
}
