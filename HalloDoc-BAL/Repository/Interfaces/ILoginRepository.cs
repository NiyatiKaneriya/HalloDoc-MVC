using HalloDoc_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.Interfaces
{
    public interface ILoginRepository
    {
        Task<AspNetUser> aspNetUsers(AspNetUser aspNetUser);
        Task<User> users(string UserName);
         
         Task<Boolean> CheckregisterdAsync(string email);

         Task<Boolean> SavePasswordAsync(string ConfirmPassword, string Password, string EmailDecoded);
    }
}
