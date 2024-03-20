using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_BAL.Repository.Interfaces;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;


namespace HalloDoc_MVC.Controllers
{
    public class BusinessPartnerRequestController : Controller
    {
       private readonly ICreateRequestsRepository _createrequestsRepository;
        private readonly IActionRepository _actionRepository;
        public BusinessPartnerRequestController(ICreateRequestsRepository createRequestsRepository,IActionRepository actionRepository)
        {
            _createrequestsRepository = createRequestsRepository;
            _actionRepository = actionRepository;
        }
        public async Task<IActionResult> Index()
        {
            ViewBag.RegionCombobox =  _actionRepository.RegionComboBox();
            return View();
        }

        public async Task<IActionResult> Create(ViewBusinessPartnerRequest model)
        {

                if (ModelState.IsValid && await _createrequestsRepository.CreateBusinessPartnerRequest(model))
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
