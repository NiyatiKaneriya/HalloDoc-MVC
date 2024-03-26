using HalloDoc_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.AdminRepository.AdminInterfaces
{
    public interface IProviderLocationRepository
    {
        public Task<List<PhysicianLocation>> FindPhysicianLocation();

    }
}
