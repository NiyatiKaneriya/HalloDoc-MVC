using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.Repository.Interfaces
{
    public interface ICreateRequestsRepository
    {
        public Task<AspNetUser> aspNetUsers(string email, AspNetUser aspNetUser);
        public Task<User> users(string id);
        public Task<Boolean> CreatePatientRequest(ViewPatientRequest model);
        public Task<Boolean> CreateFamilyRequest(ViewFamilyRequest model);
        public Task<Boolean> CreateConciergeRequest(ViewConciergeRequest model);
        public Task<Boolean> CreateBusinessPartnerRequest(ViewBusinessPartnerRequest model);
        public Task<Boolean> CreateForSomeone(ViewPatientRequest model, string UserName);
        public Task<Boolean> CreateForMe(ViewPatientRequest model, string UserName);
        public Task<User> RequestForMe(int UserId);


    }
}
