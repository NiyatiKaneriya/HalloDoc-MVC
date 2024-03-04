using HalloDoc_BAL.Interfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.PatientViewModels;
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


