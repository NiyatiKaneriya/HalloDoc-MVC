
using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_BAL.Repository.Interfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using HalloDoc_MVC.Models;
using HalloDoc_MVC.Models.CV;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections;

namespace HalloDoc_MVC.Controllers
{
    public class RequestByPatientController : Controller
    {

        private readonly ICreateRequestsRepository _createRequestsRepository;
        private readonly IActionRepository _actionRepository;
      

        public RequestByPatientController(ICreateRequestsRepository createRequestsRepository, IWebHostEnvironment webHostEnvironment,IActionRepository actionRepository)
        {
           
            _createRequestsRepository = createRequestsRepository;
            _actionRepository = actionRepository;
        }
        public async Task<IActionResult> RequestForMe()
        {
            ViewBag.RegionCombobox =  _actionRepository.RegionComboBox();
            User user = await _createRequestsRepository.RequestForMe(Convert.ToInt32(CV.UserID()));
            DateTime date1 = DateTime.MinValue;
            if (user.IntDate.HasValue || user.IntYear.HasValue)
            {
                var day = user.IntDate;
                int month = Convert.ToInt32(user.StrMonth);
                var year = user.IntYear;

                date1 = new DateTime((int)year, month, (int)day);
            }

            var view = new ViewPatientRequest
            {
                FirstName = user.FirstName,
                LastName = user.LastName,
                Email = user.Email,
                DOB = date1.Date,
                PhoneNumber = user.Mobile,
                Street = user.Street,
                City = user.City,
                State = user.State,
                Zipcode = user.ZipCode,
            };

            return View(view);
        }
        public async Task<IActionResult> CreateForMeAsync(ViewPatientRequest model)
        {

            if (ModelState.IsValid)
            {
                var UserName = CV.UserName();
                if(await _createRequestsRepository.CreateForMe(model, UserName))
                {
                    return RedirectToAction("Index", "Dashboard");
                }
                ViewData["error"] = "Can't Process Your Request, Try Again";
                return RedirectToAction("Index", "Dashboard");
            }
            else
            {
                ViewData["error"] = "Can't Process Your Request, Try Again";
                return RedirectToAction("Index", "Dashboard");
            }
        }
        public async Task<IActionResult> RequestForSomeone()
        {
            ViewBag.RegionCombobox =  _actionRepository.RegionComboBox();
            return View();
        }
        public async Task<IActionResult> CreateForSomeoneAsync(ViewPatientRequest model)
        {

            if (ModelState.IsValid)
            {

                var UserName = CV.UserName();
                if(await _createRequestsRepository.CreateForSomeone(model, UserName))
                {
                    return RedirectToAction("Index", "Dashboard");
                }

                ViewData["error"] = "Can't Process Your Request, Try Again";
                return RedirectToAction("Index","Dashboard");
            }            
            else
            {
                ViewData["error"] = "Can't Process Your Request, Try Again";
                return RedirectToAction("Index","Dashboard");
            }
        }
    }
}
