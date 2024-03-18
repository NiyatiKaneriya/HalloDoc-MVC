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
using static HalloDoc_DAL.ViewModels.AdminViewModels.AdminProfileModel;

namespace HalloDoc_BAL.AdminRepository
{
    public class AdminProfileRepository : IAdminProfileRepository
    {
        private readonly ApplicationDbContext _context;

        public AdminProfileRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public AdminProfileModel getProfileData(string  id)
        {

            var query =  (from r in _context.Admins
                                       join AspNetUser in _context.AspNetUsers
                                       on r.AspNetUserId equals AspNetUser.Id into aspGroup
                                       from asp in aspGroup.DefaultIfEmpty()
                                       where r.AspNetUserId == id
                                       select new AdminProfileModel
                                       {
                                           RoleId = Convert.ToString( r.RoleId),
                                           AdminId = r.AdminId,
                                           UserName = asp.UserName,
                                           Address1 = r.Address1,
                                           Address2 = r.Address2,
                                           altPhone = r.AltPhone,
                                           city = r.City,
                                           Aspnetuserid = r.AspNetUserId,
                                           Createdby = r.CreatedBy,
                                           Email = r.Email,
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

            regions = _context.AdminRegions
                  .Where(r => r.AdminId == query.AdminId)
                  .Select(req => new Regions()
                  {
                      Regionid = req.RegionId
                  }).ToList();

            query.Regionids = regions ;
            return query;

        }
        public List<RoleComboBox> RoleComboBox()
        {
            return  _context.Roles.Select(req => new RoleComboBox()
            {
                RoleId = Convert.ToString(req.RoleId),
                RoleName = req.Name,
            }).ToList();
        }

        public bool ResetPasswordProfile(string id, string Password)
        {
            var req = _context.AspNetUsers.FirstOrDefault(e => e.Id == id);
            req.PasswordHash = Password;
            req.ModifiedDate = DateTime.Now;
            
            _context.AspNetUsers.Update(req);
            _context.SaveChanges();
            return true;
        }
        public bool EditAdminInfo(AdminProfileModel model,string id)
        {
            var admin = _context.Admins.FirstOrDefault(e => e.AspNetUserId == id);
            admin.FirstName = model.FirstName;
            admin.LastName = model.LastName;
            admin.Email = model.Email;
            admin.Mobile = model.PhoneNumber;
            _context.Admins.Update(admin);
            _context.SaveChanges();
            List<int> list = model.Regionsid.Split(',').Select(int.Parse).ToList();
            List<int> adminsoldregion = new List<int>();

            adminsoldregion = _context.AdminRegions.Where(r => r.AdminId == admin.AdminId).Select(e => e.RegionId).ToList(); 


            foreach (var value in adminsoldregion)
            {
                if (!list.Contains(value))
                {
                    var AdminRegion = _context.AdminRegions.FirstOrDefault(e => e.AdminId == admin.AdminId && e.RegionId == value);
                       _context.AdminRegions.Remove(AdminRegion);
                       _context.SaveChangesAsync();
                    
                }
                list.Remove(value);
            }
            foreach (var value in list)
            {
                AdminRegion ar = new AdminRegion
                {
                    AdminId = admin.AdminId,
                    RegionId = Convert.ToInt32(value),
                };
                _context.AdminRegions.Add(ar);
                _context.SaveChangesAsync();

            }


            return true;
        }
        public bool EditBillingInfo(AdminProfileModel model, string id)
        {
            var admin = _context.Admins.FirstOrDefault(e => e.AspNetUserId == id);
            admin.Address1 = model.Address1;
            admin.Address2 = model.Address2;
            admin.City = model.city;
            admin.Zip = model.zipcode;
            admin.RegionId = model.Regionid;
            admin.AltPhone = model.altPhone;
            _context.Admins.Update(admin);
            _context.SaveChanges();

            
            return true;
        }
        
    }
}
