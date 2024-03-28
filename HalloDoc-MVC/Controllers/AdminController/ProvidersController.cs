using HalloDoc_BAL.AdminRepository;
using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Mvc;
using HalloDoc_MVC.Models.CV;
using Microsoft.Diagnostics.Runtime;
using HalloDoc_DAL.Models;

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
        public IActionResult CreatePhysician()
        {
            ViewBag.RoleComboBox = _adminProfileRepository.RoleComboBox();
            ViewBag.RegionCombobox = _actionRepository.RegionComboBox();
            return View();
        }
        public IActionResult CreatePhysicianAcc(EditCreatePhysician model)
        {
            _providersRepository.CreatePhysicianAcc(model);
            return RedirectToAction("Index");
        }
       
        public IActionResult EditPhysicianPassword(string password,int PhysicianId)
        {
            if (_providersRepository.EditPhysicianPassword(password, PhysicianId))
            {
                ViewData["result"] = "password updated successfully.";
                return RedirectToAction("EditPhysician", new { PhysicianId = PhysicianId });
            }
            else
            {
                ViewData["result"] = "password is not updated, there is some error .";
                return RedirectToAction("EditPhysician", new { PhysicianId = PhysicianId });
            }

        }
        public IActionResult EditPhysicianInfo(EditCreatePhysician formData)
        {
            string id = CV.AspNetUserID();
            if (_providersRepository.EditPhysicianInfo(formData,id))
            {
                ViewData["result"] = "info updated.";
                return RedirectToAction("EditPhysician", new { PhysicianId = formData.PhysicianId });
            }
            else
            {
                ViewData["result"] = "info not updated, there is some error .";
                return RedirectToAction("EditPhysician", new { PhysicianId = formData.PhysicianId });
            }

        }
        public IActionResult EditPhysicianMailing(EditCreatePhysician formData)
        {
            string id = CV.AspNetUserID();
            if (_providersRepository.EditPhysicianMailing(formData, id))
            {
                ViewData["result"] = "info updated.";
                return RedirectToAction("EditPhysician", new { PhysicianId = formData.PhysicianId });
            }
            else
            {
                ViewData["result"] = "info not updated, there is some error .";
                return RedirectToAction("EditPhysician", new { PhysicianId = formData.PhysicianId });
            }

        }

    }
}
