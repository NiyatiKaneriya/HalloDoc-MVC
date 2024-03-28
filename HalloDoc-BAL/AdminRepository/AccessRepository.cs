using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.AdminRepository
{
    public class AccessRepository : IAccessRepository
    {
        private readonly ApplicationDbContext _context;

        public AccessRepository(ApplicationDbContext context)
        {
            _context = context;
        }
      
        public List<RoleModel> GetAccounts()
        {
            var query = new List<RoleModel>();
            query = (from r in _context.Roles
                    select new RoleModel
                    {
                        Name = r.Name,
                        AccountType = r.AccountType,
                        RoleId = r.RoleId,
                    }).ToList();
            return query;
        }

    }
}
