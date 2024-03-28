using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.AdminRepository.AdminInterfaces
{
    public interface IAccessRepository
    {
        public List<RoleModel> GetAccounts();
    }
}
