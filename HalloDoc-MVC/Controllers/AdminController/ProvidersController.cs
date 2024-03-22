using HalloDoc_BAL.AdminRepository;
using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using HalloDoc_MVC.Models.CV;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers.AdminController
{
    [CustomAuthorize("Admin")]
    public class ProvidersController : Controller
    {
        private readonly IActionRepository _actionRepository;
        private readonly IProvidersRepository _providersRepository;
        private readonly IAdminProfileRepository _adminProfileRepository;
        public ProvidersController( IActionRepository actionRepository, IAdminProfileRepository adminProfileRepository, IProvidersRepository providersRepository)
        {
            _actionRepository = actionRepository;
            _providersRepository = providersRepository;
            _adminProfileRepository = adminProfileRepository;
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
        public IActionResult EditPhysician(int physicianid)
        {
            ViewBag.RegionCombobox = _actionRepository.RegionComboBox();
            ViewBag.RoleComboBox = _adminProfileRepository.RoleComboBox();
            var data = _providersRepository.GetEditPhysician(physicianid);
            return View(data);
        }
    }
}
