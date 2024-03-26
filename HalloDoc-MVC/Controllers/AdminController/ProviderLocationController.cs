using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers.AdminController
{
    public class ProviderLocationController : Controller
    {
        private readonly IProviderLocationRepository _providerLocationRepository;
        
        public ProviderLocationController(IProviderLocationRepository providerLocationRepository)
        {
            _providerLocationRepository = providerLocationRepository;
            
        }
        public async Task<IActionResult> Index()
        {
            ViewBag.Locations = await _providerLocationRepository.FindPhysicianLocation();
            return View();
        }
    }
}
