using HalloDoc_DAL.ViewModels.PatientViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.Interfaces
{
    public interface IProfileRepository
    {
        ViewProfile GetProfile(int id);
        Task<bool> EditProfileAsync(ViewProfile viewProfile, int id, string username);


    }
}
