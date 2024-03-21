using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.AdminRepository
{
    public class ProvidersRepository : IProvidersRepository
    {
        private readonly ApplicationDbContext _context;

        public ProvidersRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public  List<ProvidersModel> GetProviders(int RegionId)
        {
            var query = new List<ProvidersModel>();
             query =  (from p in _context.Physicians
                                join pn in _context.PhysicianNotifications
                                on p.PhysicianId equals pn.PhysicianId into pnGroup
                                from pn in pnGroup.DefaultIfEmpty()
                                join r in _context.Roles
                                on p.RoleId equals r.RoleId
                                where (p.RegionId == RegionId || RegionId == 0)
                                select new ProvidersModel
                                {
                                    PhysicianId = p.PhysicianId,
                                    FirstName = p.FirstName,
                                    LastName = p.LastName,
                                    RoleId = (int)p.RoleId,
                                    RoleName = r.Name,
                                    Status = (int)p.Status,
                                    RegionId = (int)p.RegionId,
                                    IsNotificationStopped = pn.IsNotificationStopped
                                }).ToList();
            return query;
        }
    }
}
