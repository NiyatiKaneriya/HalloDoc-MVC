using HalloDoc_BAL.AdminRepository.AdminInterfaces;

using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers.AdminController
{
    [CustomAuthorize("Admin")]
    public class AccessController : Controller
    {
        private readonly IAccessRepository _accessRepository;
       
        public AccessController(IAccessRepository accessRepository)
        {
            _accessRepository = accessRepository;
        
        }
        public IActionResult Account()
        {
            return View();
        }

        public IActionResult GetAccounts()
        {
            var data = _accessRepository.GetAccounts();
            return PartialView("_AccountaccessTable",data);
        }
        public IActionResult CreateAccess()
        {
            return View();
        }
    }
}
