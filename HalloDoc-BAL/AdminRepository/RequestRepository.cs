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
using static HalloDoc_DAL.ViewModels.AdminViewModels.AdminProfileModel;
using static HalloDoc_DAL.ViewModels.AdminViewModels.ViewNotesModel;

using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace HalloDoc_BAL.AdminRepository
{
    public class RequestRepository : IRequestRepository
    {
        private readonly ApplicationDbContext _context;

        public RequestRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        #region Count
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
        #endregion

        #region RequestTable
        public async Task<List<ViewDashboradList>> RequestTable(int state, int requesttype, string searchstring, int RegionId, int page = 1, int pageSize = 10)
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
                
                   
                    query = await (from req in _context.Requests
                                   join reqClient in _context.RequestClients
                                   on req.RequestId equals reqClient.RequestId into reqClientGroup
                                   from rc in reqClientGroup.DefaultIfEmpty()
                                   join phys in _context.Physicians
                                   on req.PhysicianId equals phys.PhysicianId into physGroup
                                   from p in physGroup.DefaultIfEmpty()
                                   join reg in _context.Regions
                                   on rc.RegionId equals reg.RegionId into RegGroup
                                    from rg in RegGroup.DefaultIfEmpty()
                                     where statusList.Contains(req.Status) && (searchstring == null ||
                                    rc.FirstName.ToLower().Contains(searchstring) || rc.LastName.ToLower().Contains(searchstring) ) && (RegionId == 0 || rc.RegionId == RegionId)
                                    && (requesttype == 0 || req.RequestTypeId == requesttype)
                                    select new ViewDashboradList
                                    {
                                        RequestClientId = rc.RequestClientId,
                                        RequestId = req.RequestId,
                                        PatientF = rc.FirstName,
                                        PatientL = rc.LastName,
                                        Email = req.Email,
                                        Status = req.Status,
                                        DOB = new DateTime((int)rc.IntYear, Convert.ToInt32(rc.StrMonth), (int)rc.IntDate),
                                        DateOfBirth = new DateOnly((int)rc.IntYear, Convert.ToInt32(rc.StrMonth), (int)rc.IntDate),
                                        RequestTypeId = req.RequestTypeId,
                                        RequestorF = req.FirstName,
                                        RequestorL = req.LastName,
                                        RequestedDate = req.CreatedDate,
                                        Phone = rc.PhoneNumber,
                                        PhoneO = req.PhoneNumber,
                                        PhysicianF = p.FirstName,
                                        PhysicianL = p.LastName,
                                        Address = rc.Address,
                                        Notes = rc.Notes,
                                        Region = rg.Name,
                                        RegionId = rg.RegionId,
                                    }).ToListAsync();
                    foreach (var item in query)
                    {
                        item.IsFinalize = GetIsFinalize(item.RequestId);
                    }
                   
                    
                
               
                List<ViewDashboradList> paginatedData =  query.Skip((page - 1) * pageSize).Take(pageSize).ToList();
                return paginatedData;

            }
            catch (Exception ex)
            {
                throw new Exception();
            }
        
        }
        #endregion

        #region TotalCount
        public int TotalCount(int state, int requesttype, string searchstring, int RegionId, int page = 1, int pageSize = 10)
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
               

                    query =  (from req in _context.Requests
                            join reqClient in _context.RequestClients
                            on req.RequestId equals reqClient.RequestId into reqClientGroup
                            from rc in reqClientGroup.DefaultIfEmpty()
                            join phys in _context.Physicians
                            on req.PhysicianId equals phys.PhysicianId into physGroup
                            from p in physGroup.DefaultIfEmpty()
                            join reg in _context.Regions
                            on rc.RegionId equals reg.RegionId into RegGroup
                            from rg in RegGroup.DefaultIfEmpty()
                            where statusList.Contains(req.Status) && (searchstring == null ||
                           rc.FirstName.ToLower().Contains(searchstring) || rc.LastName.ToLower().Contains(searchstring) ) && (RegionId == 0 || rc.RegionId == RegionId)
                           && (requesttype == 0 || req.RequestTypeId == requesttype)
                            select new ViewDashboradList
                             {
                                 RequestClientId = rc.RequestClientId,
                                 
                             }).ToList();
               

                
                return query.Count;

            }
            catch (Exception ex)
            {
                throw new Exception();
            }

        }

        #endregion

        #region ExportData
        public List<ViewDashboradList> ExportData(int state, int requesttype, string searchstring, int RegionId)
            {
                var query = new List<ViewDashboradList>();

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

                query = (from req in _context.Requests
                              join reqClient in _context.RequestClients
                              on req.RequestId equals reqClient.RequestId into reqClientGroup
                              from rc in reqClientGroup.DefaultIfEmpty()
                              join phys in _context.Physicians
                              on req.PhysicianId equals phys.PhysicianId into physGroup
                              from p in physGroup.DefaultIfEmpty()
                              join reg in _context.Regions
                              on rc.RegionId equals reg.RegionId into RegGroup
                              from rg in RegGroup.DefaultIfEmpty()
                              where statusList.Contains(req.Status) && (searchstring == null ||
                             rc.FirstName.ToLower().Contains(searchstring) || rc.LastName.ToLower().Contains(searchstring)) && (RegionId == 0 || rc.RegionId == RegionId)
                             && (requesttype == 0 || req.RequestTypeId == requesttype)
                              select new ViewDashboradList
                              {
                                  RequestClientId = rc.RequestClientId,
                                  RequestId = req.RequestId,
                                  PatientF = rc.FirstName,
                                  PatientL = rc.LastName,
                                  Email = req.Email,
                                  Status = req.Status,
                                  DateOfBirth = new DateOnly((int)rc.IntYear, Convert.ToInt32(rc.StrMonth),(int)rc.IntDate),
                                  RequestTypeId = req.RequestTypeId,
                                  RequestorF = req.FirstName,
                                  RequestorL = req.LastName,
                                  RequestedDate = req.CreatedDate,
                                  Phone = rc.PhoneNumber,
                                  PhoneO = req.PhoneNumber,
                                  PhysicianF = p.FirstName,
                                  PhysicianL = p.LastName,
                                  Address = rc.Address,
                                  Notes = rc.Notes,
                                  Region = rg.Name,
                                  RegionId = rg.RegionId,
                              }).ToList();
                foreach (var item in query)
                {
                    item.IsFinalize = GetIsFinalize(item.RequestId);
                }
                return query;
        }
        #endregion

        #region IsFinalize
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
        #endregion

    }
}
