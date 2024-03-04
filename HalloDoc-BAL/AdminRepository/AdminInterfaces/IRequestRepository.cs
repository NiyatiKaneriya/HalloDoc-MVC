using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;

using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.AdminRepository.AdminInterfaces
{
    public interface IRequestRepository
    {
        public Task<int> NewCount();
        public Task<int> ActiveCount();
        public Task<int> PendingCount();
        public Task<int> ConcludeCount();
        public Task<int> ToCloseCount();
        public Task<int> UnpaidCount();
        public Task<List<ViewDashboradList>> RequestTableAsync(int state, int requesttype);
        





    }
}
