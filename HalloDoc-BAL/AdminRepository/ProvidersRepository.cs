using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static HalloDoc_DAL.ViewModels.AdminViewModels.EditCreatePhysician;
using static HalloDoc_DAL.ViewModels.AdminViewModels.EditCreatePhysician.Regions;

namespace HalloDoc_BAL.AdminRepository
{
    public class ProvidersRepository : IProvidersRepository
    {
        private readonly ApplicationDbContext _context;

        public ProvidersRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        #region Providers for index table
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
                                    Physician = p.FirstName + " " + p.LastName,
                                    email = p.Email,
                                    PhoneNumber = p.Mobile,
                                    RoleId = (int)p.RoleId,
                                    RoleName = r.Name,
                                    Status = (int)p.Status,
                                    RegionId = (int)p.RegionId,
                                    IsNotificationStopped = pn.IsNotificationStopped
                                }).ToList();
            return query;
        }
        #endregion

        #region GetPhysician for edit

        public EditCreatePhysician GetEditPhysician(int physicianid)
        {
            var id = _context.Physicians.Where(e => e.PhysicianId == physicianid).Select(e=> e.Id).FirstOrDefault();
            var query = (from r in _context.Physicians
                         join As in _context.AspNetUsers
                         on r.Id equals As.Id into aspGroup
                         from asp in aspGroup.DefaultIfEmpty()
                         where r.Id == id
                         select new EditCreatePhysician
                         {
                             RoleId = Convert.ToString(r.RoleId),
                             PhysicianId = r.PhysicianId,
                             UserName = asp.UserName,
                             Address1 = r.Address1,
                             Address2 = r.Address2,
                             altPhone = r.AltPhone,
                             city = r.City,
                             Aspnetuserid = r.Id,
                             Createdby = r.CreatedBy,
                             Email = r.Email,
                             NPINumber= r.Npinumber,
                             MedicalLicense=r.MedicalLicense,
                             ConfirmedEmail = r.Email,
                             Createddate = r.CreatedDate,
                             PhoneNumber = r.Mobile,
                             Modifiedby = r.ModifiedBy,
                             Modifieddate = r.ModifiedDate,
                             Regionid = r.RegionId,
                             LastName = r.LastName,
                             FirstName = r.FirstName,
                             status = (int)r.Status,
                             zipcode = r.Zip
                         }).FirstOrDefault();
            List<Regions> regions = new List<Regions>();

            regions = _context.PhysicianRegions
                  .Where(r => r.PhysicianId == query.PhysicianId)
                  .Select(req => new Regions()
                  {
                      Regionid = req.RegionId
                  }).ToList();

            query.Regionids = regions;
            return query;

        }
        #endregion
    }
}
