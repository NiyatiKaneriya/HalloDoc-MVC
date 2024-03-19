using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_BAL.Interfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using HalloDoc_MVC.Models;
using HalloDoc_MVC.Models.CV;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

namespace HalloDoc_MVC.Controllers
{
    public class ProfileController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IProfileRepository _profileRepository;
        private readonly IActionRepository _actionRepository;


        public ProfileController(ApplicationDbContext context,IProfileRepository profileRepository,IActionRepository actionRepository)
        {
            _context = context;
            _profileRepository = profileRepository;
            _actionRepository = actionRepository;
        }
        public async Task<IActionResult> Index()
        {
            ViewBag.RegionCombobox = await _actionRepository.RegionComboBox();
            var userId = Convert.ToInt32(CV.UserID()); 
            return View(_profileRepository.GetProfile(userId));
        }


        public async Task<IActionResult> EditAsync(ViewProfile viewProfile)
        {
            //try
            //{
            //    User Updateuser = await _context.Users.FindAsync(Convert.ToInt32(CV.UserID()));
            //    AspNetUser Updateaspnetuser = await _context.AspNetUsers.FindAsync( CV.UserName());
            //    Updateuser.FirstName = viewProfile.FirstName;
            //    Updateuser.LastName = viewProfile.LastName;
            //    Updateuser.Mobile = viewProfile.PhoneNumber;
            //    Updateuser.Email = viewProfile.Email;
            //    Updateuser.State = viewProfile.State;
            //    Updateuser.Street = viewProfile.Street;
            //    Updateuser.City = viewProfile.City;
            //    Updateuser.ZipCode = viewProfile.ZipCode;
            //    //DOB
            //    Updateuser.IntDate = viewProfile.DOB.Day;
            //    Updateuser.StrMonth = viewProfile.DOB.Month.ToString();
            //    Updateuser.IntYear = viewProfile.DOB.Year;
            //    //Updateuser.Modifiedby = CV.UserName;
            //    Updateuser.ModifiedDate = DateTime.Now;
            //    _context.Update(Updateuser);
            //    await _context.SaveChangesAsync();

            //    Updateaspnetuser.PhoneNumber = viewProfile.PhoneNumber;
            //    _context.Update(Updateaspnetuser);
            //    await _context.SaveChangesAsync();
            //}
            //catch (DbUpdateConcurrencyException)
            //{                
            //     throw;                
            //}
            var userId = Convert.ToInt32(CV.UserID());
            var username = CV.UserName();
            if (await _profileRepository.EditProfileAsync(viewProfile, userId, username))
            {
                return RedirectToAction("Index");
            }
            
            return RedirectToAction("Index");
        }
        private bool UserExists(object id)
        {
            throw new NotImplementedException();
        }
    }
}
