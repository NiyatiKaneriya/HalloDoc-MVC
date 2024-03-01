using HalloDoc_BAL.Repository.Interfaces;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;


namespace HalloDoc_MVC.Controllers
{
    public class BusinessPartnerRequestController : Controller
    {
       private readonly ICreateRequestsRepository _createrequestsRepository;
        public BusinessPartnerRequestController(ICreateRequestsRepository createRequestsRepository)
        {
            _createrequestsRepository = createRequestsRepository;
        }
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Create(ViewBusinessPartnerRequest model)
        {

                if (await _createrequestsRepository.CreateBusinessPartnerRequest(model))
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
