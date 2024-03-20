using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static HalloDoc_DAL.ViewModels.AdminViewModels.ViewNotesModel;

using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace HalloDoc_BAL.AdminRepository
{
    public class RequestRepository : IRequestRepository
    {
        private readonly ApplicationDbContext _context;

        public RequestRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<int> NewCount()
        {
            var query = await _context.Requests.CountAsync(e => e.Status == 1);
            return query;
        }
        public async Task<int> ActiveCount()
        {
            var query = await _context.Requests.CountAsync(e => e.Status == 4 || e.Status == 5);
            return query;
        }
        public async Task<int> PendingCount()
        {
            var query = await _context.Requests.CountAsync(e => e.Status == 2);
            return query;
        }
        public async Task<int> ConcludeCount()
        {
            var query = await _context.Requests.CountAsync(e => e.Status == 6);
            return query;
        }
        public async Task<int> ToCloseCount()
        {
            var query = await _context.Requests.CountAsync(e => e.Status == 3 || e.Status == 7 || e.Status == 8);
            return query;
        }
        public async Task<int> UnpaidCount()
        {
            var query = await _context.Requests.CountAsync(e => e.Status == 9);
            return query;
        }

        public async Task<List<ViewDashboradList>> RequestTable(int state, int requesttype, int page = 1,int pageSize = 10)
        {
            try
            {
                List<int> statusList = new List<int>();
                if (state == 5)
                {
                    statusList.Add(3);
                    statusList.Add(7);
                    statusList.Add(8);
                }
                else if (state == 2)
                {
                    statusList.Add(4);
                    statusList.Add(5);
                }
                else if (state == 1)
                {
                    statusList.Add(1);
                }
                else if (state == 3)
                {
                    statusList.Add(2);
                }
                else if (state == 4)
                {
                    statusList.Add(6);
                }
                else if (state == 6)
                {
                    statusList.Add(9);
                }


                var query = new List<ViewDashboradList>();
                if (requesttype == 0)
                {
                   
                    query = (from r in _context.Requests
                             join rc in _context.RequestClients on r.RequestId equals rc.RequestId
                             join p in _context.Physicians on r.PhysicianId equals p.PhysicianId into physicianGroup
                             from physician in physicianGroup.DefaultIfEmpty()
                             join re in _context.Regions on rc.RegionId equals re.RegionId into regionGroup
                             from region in regionGroup.DefaultIfEmpty()
                             where statusList.Contains(r.Status)
                             select new ViewDashboradList
                             {
                                 RequestClientId = rc.RequestClientId,
                                 RequestId = r.RequestId,
                                 PatientF = rc.FirstName,
                                 PatientL = rc.LastName,
                                 Email = r.Email,
                                 Status = r.Status,
                                 DOB = new DateTime((int)rc.IntYear, Convert.ToInt32(rc.StrMonth), (int)rc.IntDate),
                                 DateOfBirth = new DateOnly((int)rc.IntYear, Convert.ToInt32(rc.StrMonth), (int)rc.IntDate),
                                 RequestTypeId = r.RequestTypeId,
                                 RequestorF = r.FirstName,
                                 RequestorL = r.LastName,
                                 RequestedDate = r.CreatedDate,
                                 Phone = rc.PhoneNumber,
                                 PhoneO = r.PhoneNumber,
                                 PhysicianF = physician.FirstName,
                                 PhysicianL = physician.LastName,
                                 Address = rc.Address,
                                 Notes = rc.Notes,
                                 Region = region.Name,
                                 RegionId = region.RegionId,
                             }).ToList();
                    foreach (var item in query)
                    {
                        item.IsFinalize = GetIsFinalize(item.RequestId);
                    }
                   
                    
                }

                else
                {
                     query = (from r in _context.Requests
                             join rc in _context.RequestClients on r.RequestId equals rc.RequestId
                             join p in _context.Physicians on r.PhysicianId equals p.PhysicianId into physicianGroup
                             from physician in physicianGroup.DefaultIfEmpty()
                             join re in _context.Regions on rc.RegionId equals re.RegionId into regionGroup
                             from region in regionGroup.DefaultIfEmpty()
                             where statusList.Contains(r.Status) && r.RequestTypeId == requesttype
                             select new ViewDashboradList
                             {
                                 RequestClientId = rc.RequestClientId,
                                 RequestId = r.RequestId,
                                 PatientF = rc.FirstName,
                                 PatientL = rc.LastName,
                                 Email = r.Email,
                                 Status = r.Status,
                                 DOB = new DateTime((int)rc.IntYear, Convert.ToInt32(rc.StrMonth), (int)rc.IntDate),
                                 DateOfBirth = new DateOnly((int)rc.IntYear, Convert.ToInt32(rc.StrMonth), (int)rc.IntDate),
                                 RequestTypeId = r.RequestTypeId,
                                 RequestorF = r.FirstName,
                                 RequestorL = r.LastName,
                                 RequestedDate = r.CreatedDate,
                                 Phone = rc.PhoneNumber,
                                 PhoneO = r.PhoneNumber,
                                 PhysicianF = physician.FirstName,
                                 PhysicianL = physician.LastName,
                                 Address = rc.Address,
                                 Notes = rc.Notes,
                                 Region = region.Name,
                                 RegionId = region.RegionId,
                                 
                             }).ToList();
                    foreach (var item in query)
                    {
                        item.IsFinalize = GetIsFinalize(item.RequestId);
                    }
                    
                }
                List<ViewDashboradList> paginatedData =  query.Skip((page - 1) * pageSize).Take(pageSize).ToList();
                return paginatedData;

            }
            catch (Exception ex)
            {
                throw new Exception();
            }
        
        }
        public  int TotalCount(int state, int requesttype)
        {
            try
            {
                List<int> statusList = new List<int>();
                if (state == 5)
                {
                    statusList.Add(3);
                    statusList.Add(7);
                    statusList.Add(8);
                }
                else if (state == 2)
                {
                    statusList.Add(4);
                    statusList.Add(5);
                }
                else if (state == 1)
                {
                    statusList.Add(1);
                }
                else if (state == 3)
                {
                    statusList.Add(2);
                }
                else if (state == 4)
                {
                    statusList.Add(6);
                }
                else if (state == 6)
                {
                    statusList.Add(9);
                }


                var query = new List<ViewDashboradList>();
                if (requesttype == 0)
                {

                    query = (from r in _context.Requests
                             join rc in _context.RequestClients on r.RequestId equals rc.RequestId
                             join p in _context.Physicians on r.PhysicianId equals p.PhysicianId into physicianGroup
                             from physician in physicianGroup.DefaultIfEmpty()
                             join re in _context.Regions on rc.RegionId equals re.RegionId into regionGroup
                             from region in regionGroup.DefaultIfEmpty()
                             where statusList.Contains(r.Status)
                             select new ViewDashboradList
                             {
                                 RequestClientId = rc.RequestClientId,
                                 RequestId = r.RequestId,
                                 PatientF = rc.FirstName,
                                 PatientL = rc.LastName,
                                 Email = r.Email,
                                 Status = r.Status,
                                 DOB = new DateTime((int)rc.IntYear, Convert.ToInt32(rc.StrMonth), (int)rc.IntDate),
                                 RequestTypeId = r.RequestTypeId,
                                 RequestorF = r.FirstName,
                                 RequestorL = r.LastName,
                                 RequestedDate = r.CreatedDate,
                                 Phone = rc.PhoneNumber,
                                 PhoneO = r.PhoneNumber,
                                 PhysicianF = physician.FirstName,
                                 PhysicianL = physician.LastName,
                                 Address = rc.Address,
                                 Notes = rc.Notes,
                                 Region = region.Name
                             }).ToList();
                    foreach (var item in query)
                    {
                        item.IsFinalize = GetIsFinalize(item.RequestId);
                    }


                }

                else
                {
                    query = (from r in _context.Requests
                             join rc in _context.RequestClients on r.RequestId equals rc.RequestId
                             join p in _context.Physicians on r.PhysicianId equals p.PhysicianId into physicianGroup
                             from physician in physicianGroup.DefaultIfEmpty()
                             join re in _context.Regions on rc.RegionId equals re.RegionId into regionGroup
                             from region in regionGroup.DefaultIfEmpty()
                             where statusList.Contains(r.Status) && r.RequestTypeId == requesttype
                             select new ViewDashboradList
                             {
                                 RequestClientId = rc.RequestClientId,
                                 RequestId = r.RequestId,
                                 PatientF = rc.FirstName,
                                 PatientL = rc.LastName,
                                 Email = r.Email,
                                 Status = r.Status,
                                 DOB = new DateTime((int)rc.IntYear, Convert.ToInt32(rc.StrMonth), (int)rc.IntDate),
                                 RequestTypeId = r.RequestTypeId,
                                 RequestorF = r.FirstName,
                                 RequestorL = r.LastName,
                                 RequestedDate = r.CreatedDate,
                                 Phone = rc.PhoneNumber,
                                 PhoneO = r.PhoneNumber,
                                 PhysicianF = physician.FirstName,
                                 PhysicianL = physician.LastName,
                                 Address = rc.Address,
                                 Notes = rc.Notes,
                                 Region = region.Name,

                             }).ToList();
                    foreach (var item in query)
                    {
                        item.IsFinalize = GetIsFinalize(item.RequestId);
                    }

                }
                
                return query.Count;

            }
            catch (Exception ex)
            {
                throw new Exception();
            }

        }
        public bool GetIsFinalize(int Requestid)
        {
            var a = _context.EncounterForms.FirstOrDefault(e => e.RequestId == Requestid);
            if (a == null)
            {
                return false;
            }
            else
            {
                return true;
            }

        }


    }
}
