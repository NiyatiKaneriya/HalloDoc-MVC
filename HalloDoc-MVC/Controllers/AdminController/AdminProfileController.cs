using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;
using HalloDoc_MVC.Models.CV;
using HalloDoc_BAL.AdminRepository;
using HalloDoc_DAL.ViewModels.AdminViewModels;

namespace HalloDoc_MVC.Controllers.AdminController
{
    public class AdminProfileController : Controller
    {
       
        private readonly IAdminProfileRepository _adminProfileRepository;
        private readonly IActionRepository _actionRepository;
        public AdminProfileController(IAdminProfileRepository adminProfileRepository, IActionRepository actionRepository)
        {

            _adminProfileRepository = adminProfileRepository;
            _actionRepository = actionRepository;
        }
        public IActionResult Index()
        {
            ViewBag.RoleComboBox =  _adminProfileRepository.RoleComboBox();
            ViewBag.RegionCombobox = _actionRepository.RegionComboBox();
            var data = _adminProfileRepository.getProfileData(CV.AspNetUserID());
            return View(data);
        }
        public IActionResult ResetPasswordProfile(string password)
        {
            _adminProfileRepository.ResetPasswordProfile(CV.AspNetUserID(), password);
            return RedirectToAction("Index");
        }
        public IActionResult EditAdminInfo(AdminProfileModel model)
        {
            _adminProfileRepository.EditAdminInfo(model, CV.AspNetUserID());
            return RedirectToAction("Index");
        }
        public IActionResult EditBillingInfo(AdminProfileModel model)
        {
            _adminProfileRepository.EditBillingInfo(model,CV.AspNetUserID());
            return RedirectToAction("Index");
        }
    }
}
