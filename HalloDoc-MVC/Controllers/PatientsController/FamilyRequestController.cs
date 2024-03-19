using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_BAL.Repository.Interfaces;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers
{
    public class FamilyRequestController : Controller
    {

        private readonly ICreateRequestsRepository _createRequestsRepository;
        private readonly IActionRepository _actionRepository;
        public FamilyRequestController(ICreateRequestsRepository createRequestsRepository,IActionRepository actionRepository)
        {
         
            _createRequestsRepository = createRequestsRepository;
            _actionRepository = actionRepository;
        }
        public async Task<IActionResult> Index()
        {
            ViewBag.RegionCombobox = await _actionRepository.RegionComboBox();
            return View();
        }

        public async Task<IActionResult> Create(ViewFamilyRequest model)
        {

            if (ModelState.IsValid)
            {
                await _createRequestsRepository.CreateFamilyRequest(model);
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
