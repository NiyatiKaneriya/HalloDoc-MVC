using HalloDoc_BAL.AdminRepository;
using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers.AdminController
{
    [CustomAuthorize("Admin")]
    public class ProvidersController : Controller
    {
        private readonly IActionRepository _actionRepository;
        private readonly IProvidersRepository _providersRepository;
        public ProvidersController( IActionRepository actionRepository, IProvidersRepository providersRepository)
        {
            _actionRepository = actionRepository;
            _providersRepository = providersRepository;
        }

        public IActionResult Index()
        {
            ViewBag.RegionCombobox = _actionRepository.RegionComboBox();

            return View();
        }
        public async Task<IActionResult> GetProviders( int RegionId)
        {
            var requestTableData = _providersRepository.GetProviders(RegionId);
            return PartialView("_ProviderTable", requestTableData);
        }
    }
}
