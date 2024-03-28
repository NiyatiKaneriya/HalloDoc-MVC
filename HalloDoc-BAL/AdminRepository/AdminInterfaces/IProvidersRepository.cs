using HalloDoc_DAL.ViewModels.AdminViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.AdminRepository.AdminInterfaces
{
    public interface IProvidersRepository
    {
        public List<ProvidersModel> GetProviders(int RegionId);
        public EditCreatePhysician GetEditPhysician(int physicianid);
        public Boolean CreatePhysicianAcc(EditCreatePhysician model);
        public bool EditPhysicianPassword(string password, int PhysicianId);
        public bool EditPhysicianInfo(EditCreatePhysician model, string id);
        public bool EditPhysicianMailing(EditCreatePhysician model, string id);
    }
}
