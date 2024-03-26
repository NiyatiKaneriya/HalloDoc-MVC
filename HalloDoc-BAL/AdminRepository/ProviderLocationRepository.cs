using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.AdminRepository
{
    public class ProviderLocationRepository : IProviderLocationRepository
    {
        private readonly ApplicationDbContext _context;

        public ProviderLocationRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        #region Find_Location_Physician
        public async Task<List<PhysicianLocation>> FindPhysicianLocation()
        {


            List<PhysicianLocation> pl = await _context.PhysicianLocations
                                    .OrderByDescending(x => x.PhysicianName)
                        .Select(r => new PhysicianLocation
                        {
                            LocationId = r.LocationId,
                            Longitude = r.Longitude,
                            Latitude = r.Latitude,
                            PhysicianName = r.PhysicianName

                        }).ToListAsync();
            return pl;

        }
        #endregion
    }
}
