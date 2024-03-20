using HalloDoc_BAL.AdminRepository.AdminInterfaces;
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
        private readonly IActionRepository _actionRepository;
        public ConciergeRequestController(ICreateRequestsRepository createRequestsRepository,IActionRepository actionRepository)
        {
            _createRequestsRepository = createRequestsRepository;
            _actionRepository = actionRepository;
        }
        public async Task<IActionResult> Index()
        {
            ViewBag.RegionCombobox =  _actionRepository.RegionComboBox();
            return View();
        }

        public async Task<IActionResult> Create(ViewConciergeRequest model)
        {
            
                if (ModelState.IsValid && await _createRequestsRepository.CreateConciergeRequest(model))
                {
                    
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewData["error"] = "Can't Process Your Request, Try Again";
                    return RedirectToAction("Index");
                }
        }
            

        

    }
}
