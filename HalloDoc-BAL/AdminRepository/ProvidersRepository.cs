using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using Nancy;
using Nancy.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
      
        public Boolean UploadDocumentsPhysician(EditCreatePhysician model, int PhysicianId)
        {

            if (model.UploadFilePhoto != null)
            {
                string FilePath = "wwwroot\\UploadedFilesByPhysician\\" + PhysicianId;
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                string newfilename = $"{Path.GetFileNameWithoutExtension(model.UploadFilePhoto.FileName)}-{DateTime.Now.ToString("yyyyMMddhhmmss")}-{"Photo"}.{Path.GetExtension(model.UploadFilePhoto.FileName).Trim('.')}";
                string fileNameWithPath = Path.Combine(path, newfilename);
                model.UploadImagePhoto = FilePath.Replace("wwwroot\\UploadedFilesByPhysician\\", "/UploadedFilesByPhysician/") + "/" + newfilename;
                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    model.UploadFilePhoto.CopyTo(stream);
                }
                var physician1 = _context.Physicians.FirstOrDefault(e => e.PhysicianId == PhysicianId);
                if (physician1 != null)
                {
                    physician1.Photo = model.UploadImagePhoto;
                    _context.Physicians.Update(physician1);
                    _context.SaveChanges();
                }
                return true;
            }
            return false;
        }
        public static (double latitude, double longitude) GetCoordinates(string address)
        {
            string url = $"https://api.tomtom.com/search/2/geocode/{Uri.EscapeDataString(address)}.json?key=bmULYKyU2sYwUF1NFjiJ6Fdc3OrqHyWo";

            using (WebClient client = new WebClient())
            {
                string json = client.DownloadString(url);
                dynamic result = new JavaScriptSerializer().DeserializeObject(json);

                if(result["results"] != null && result["results"].Count > 0)
            {
                    double latitude = Convert.ToDouble(result["results"][0]["position"]["lat"]);
                    double longitude = Convert.ToDouble(result["results"][0]["position"]["lon"]);
                    return (latitude, longitude);
                }
            else
                {
                    throw new Exception("No results found for the given address.");
                }
                
            }
        }
    

    #region Providers for index table
    public List<ProvidersModel> GetProviders(int RegionId)
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
                             RoleId = r.RoleId,
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

        #region CreatePhysicianAcc

        public Boolean CreatePhysicianAcc(EditCreatePhysician model)
        {
            var state = _context.Regions.FirstOrDefault(e => e.RegionId == model.Regionid);
            var address = model.Address1 + ',' + model.Address2 + ',' + model.city + ',' + model.zipcode + ',' + state.Name;
            var coordinates = GetCoordinates(address);

            var newaspNetUser = new AspNetUser
            {
                Id = Guid.NewGuid().ToString(),
                Email = model.Email,
                UserName = model.Email,
                PasswordHash = model.Password,
                CreatedDate = DateTime.Now,
                PhoneNumber = model.PhoneNumber,
            };

            _context.AspNetUsers.Add(newaspNetUser);
            _context.SaveChanges();
            var physician = new Physician
            {
                Id = newaspNetUser.Id,
                Email = model.Email,
                FirstName = model.FirstName,
                LastName = model.LastName,
                Mobile = model.PhoneNumber,
                MedicalLicense = model.MedicalLicense,
                Npinumber = model.NPINumber,
                AdminNotes = model.adminNotes,
                Address1 = model.Address1,
                Address2 = model.Address2,
                City = model.city,
                Zip = model.zipcode,
                AltPhone = model.altPhone,
                BusinessName = model.BusinessName,
                BusinessWebsite = model.BusinessWebsite,
                RegionId = model.Regionid,
                Status = 2,

                RoleId = model.RoleId,
                CreatedDate = DateTime.Now,
               

            };
            _context.Physicians.Add(physician);
            _context.SaveChanges();
            if (model.UploadFilePhoto != null)
            {
                UploadDocumentsPhysician(model,physician.PhysicianId);
            }

            List<int> list = model.Regionsid.Split(',').Select(int.Parse).ToList();

            foreach (var value in list)
            {
                PhysicianRegion ar = new PhysicianRegion
                {
                    PhysicianId = physician.PhysicianId,
                    RegionId = Convert.ToInt32(value),
                };
                _context.PhysicianRegions.Add(ar);
                _context.SaveChangesAsync();

            }
            
            var physicianLocation = new PhysicianLocation
            {
                PhysicianId = physician.PhysicianId,
                Latitude = (decimal?)coordinates.latitude,
                Longitude = (decimal?)coordinates.longitude,
                CreatedDate = DateTime.Now,
                PhysicianName = model.FirstName + " " + model.LastName,
                Address = address,
            };
            _context.PhysicianLocations.Add(physicianLocation);
            _context.SaveChanges();
            var notification = new PhysicianNotification
            {
                PhysicianId = physician.PhysicianId,
                IsNotificationStopped = new System.Collections.BitArray(0),
            };
            _context.PhysicianNotifications.Add(notification);
            _context.SaveChangesAsync();

            return true;
        }
        #endregion
    }
}
