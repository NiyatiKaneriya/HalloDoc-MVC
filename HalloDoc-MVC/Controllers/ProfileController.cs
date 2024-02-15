using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using HelloDoc.Models.CV;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

namespace HalloDoc_MVC.Controllers
{
    public class ProfileController : Controller
    {
        private readonly ApplicationDbContext _context;


        public ProfileController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            //var userId = CV.UserID();

            var userProfile = _context.Users.FirstOrDefault(u => u.UserId == Convert.ToInt32(CV.UserID()));
            DateTime date1 = DateTime.MinValue;
            if (userProfile.IntDate.HasValue || userProfile.IntYear.HasValue)
            {
                var day = userProfile.IntDate;
                int month = Convert.ToInt32(userProfile.StrMonth);
                var year = userProfile.IntYear;

                date1 = new DateTime((int)year, month, (int)day);
            }            

            var viewProfile = new ViewProfile
                {          
                    FirstName = userProfile.FirstName,
                    LastName = userProfile.LastName,
                    Email = userProfile.Email,
                    DOB = date1.Date,
                    PhoneNumber = userProfile.Mobile,
                    Street = userProfile.Street,
                    City = userProfile.City,
                    State = userProfile.State,
                    ZipCode = userProfile.ZipCode,
                };                
            
             return View(viewProfile);
        }


        public async Task<IActionResult> EditAsync(ViewProfile viewProfile)
        {
            try
            {
                User Updateuser = await _context.Users.FindAsync(Convert.ToInt32(CV.UserID()));

                Updateuser.FirstName = viewProfile.FirstName;
                Updateuser.LastName = viewProfile.LastName;
                Updateuser.Mobile = viewProfile.PhoneNumber;
                Updateuser.Email = viewProfile.Email;
                Updateuser.State = viewProfile.State;
                Updateuser.Street = viewProfile.Street;
                Updateuser.City = viewProfile.City;
                Updateuser.ZipCode = viewProfile.ZipCode;
                //DOB
                Updateuser.IntDate = viewProfile.DOB.Day;
                Updateuser.StrMonth = viewProfile.DOB.Month.ToString();
                Updateuser.IntYear = viewProfile.DOB.Year;
                //Updateuser.Modifiedby = CV.UserName;
                Updateuser.ModifiedDate = DateTime.Now;
                _context.Update(Updateuser);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {                
                 throw;                
            }
            return RedirectToAction("Index");
        }
        private bool UserExists(object id)
        {
            throw new NotImplementedException();
        }
    }
}
