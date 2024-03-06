using HalloDoc_BAL.Interfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.Repository
{
    public class LoginRepository : ILoginRepository
    {
        private readonly ApplicationDbContext _context;
        

        public LoginRepository(ApplicationDbContext context, SendEmailModel emailConfig)
        {
            _context = context;
        }

        public async Task<AspNetUser> aspNetUsers(AspNetUser aspNetUser)
        {
            AspNetUser? aspnetuser = await _context.AspNetUsers.FirstOrDefaultAsync(u => (u.UserName == aspNetUser.UserName) && (u.PasswordHash == aspNetUser.PasswordHash));

            return aspnetuser;
        }
        public async Task<User> users(string UserName)
        {
            
            User user =await _context.Users.FirstOrDefaultAsync(m => m.Email == UserName);

            return user;
        }
        public async Task<UserInfo> CheckAccessLogin(AspNetUser aspNetUser)
        {
            var user = await _context.AspNetUsers.FirstOrDefaultAsync(u => u.UserName == aspNetUser.UserName);
            UserInfo admin = new UserInfo();
            if (user != null)
            {
                
                    var data = _context.AspNetUserRoles.FirstOrDefault(E => E.UserId == user.Id);
                    var datarole = _context.AspNetRoles.FirstOrDefault(e => e.Id == data.RoleId);


                    admin.UserName = user.UserName;
                    admin.FirstName = admin.FirstName ?? string.Empty;
                    admin.LastName = admin.LastName ?? string.Empty;
                    admin.Role = datarole.Name;
                    if (admin.Role == "Admin")
                    {
                        var admindata = _context.Admins.FirstOrDefault(u => u.AspNetUserId == user.Id);
                        admin.UserId = admindata.AdminId;
                    }
                    else if (admin.Role == "Patient")
                    {
                        var admindata = _context.Users.FirstOrDefault(u => u.Id == user.Id);
                        admin.UserId = admindata.UserId;

                    }
                    else
                    {
                        var admindata = _context.Physicians.FirstOrDefault(u => u.Id == user.Id);
                        admin.UserId = admindata.PhysicianId;
                    }

                    return admin;
               
            }
            else
            {
                return admin;
            }
        }
            public async Task<Boolean> IsBlockedUser(string email)
        {
            var isBlocked = _context.BlockRequests.Where(e => e.Email == email);
            if(isBlocked == null) { return true; } 
            else { return false; }
           
        }
        
        public async Task<Boolean> CheckregisterdAsync(string email)
        {
            var U = await _context.AspNetUsers.FirstOrDefaultAsync(m => m.Email == email);
            if (U != null)
            {
                return true;
            }
            return false;
        }
       
       
       
        public async Task<Boolean> SavePasswordAsync(string ConfirmPassword, string Password, string EmailDecoded)
        {
            if (Password != null)
            {
                if (ConfirmPassword != Password)
                {
                    
                    return false;
                }
                try
                {
                    
                    AspNetUser U = await _context.AspNetUsers.FirstOrDefaultAsync(m => m.Email == EmailDecoded);

                    U.PasswordHash = Password;
                    _context.Update(U);
                    await _context.SaveChangesAsync();
                    
                }
                catch (DbUpdateConcurrencyException)
                {

                }
            }
            return true;
        }


    }
}


