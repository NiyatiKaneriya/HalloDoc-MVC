using HalloDoc_BAL.Interfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.Repository
{
    public class ProfileRepository : IProfileRepository
    {
        private readonly ApplicationDbContext _context;


        public ProfileRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public ViewProfile GetProfile(int id)
        {
            var userProfile = _context.Users.FirstOrDefault(u => u.UserId == id);
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

            return viewProfile;
        }
        public async Task<bool> EditProfileAsync(ViewProfile viewProfile, int id, string username)
        {
            if(viewProfile != null)
            {
                try
                {
                    User Updateuser = await _context.Users.FindAsync(id);
                    AspNetUser Updateaspnetuser = await _context.AspNetUsers.FindAsync(username);
                    Updateuser.FirstName = viewProfile.FirstName;
                    Updateuser.LastName = viewProfile.LastName;
                    Updateuser.Mobile = viewProfile.PhoneNumber;
                    Updateuser.Email = viewProfile.Email;
                    Updateuser.State = viewProfile.State;
                    Updateuser.Street = viewProfile.Street;
                    Updateuser.City = viewProfile.City;
                    Updateuser.ZipCode = viewProfile.ZipCode;
                    Updateuser.IntDate = viewProfile.DOB.Day;
                    Updateuser.StrMonth = viewProfile.DOB.Month.ToString();
                    Updateuser.IntYear = viewProfile.DOB.Year;
                    Updateuser.Modifiedby = id;
                    Updateuser.ModifiedDate = DateTime.Now;
                    _context.Update(Updateuser);
                    await _context.SaveChangesAsync();

                   
                }
                catch (DbUpdateConcurrencyException)
                {
                    throw;
                }
                return true;
            }
            return false;
        }

    }
}
