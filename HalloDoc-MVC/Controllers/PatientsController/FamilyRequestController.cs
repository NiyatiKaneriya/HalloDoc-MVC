using HalloDoc_BAL.Repository.Interfaces;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers
{
    public class FamilyRequestController : Controller
    {

        private readonly ICreateRequestsRepository _createRequestsRepository;
        public FamilyRequestController(ICreateRequestsRepository createRequestsRepository)
        {
         
            _createRequestsRepository = createRequestsRepository;
        }
        public IActionResult Index()
        {
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
