﻿using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Metadata;
using static HalloDoc_DAL.ViewModels.AdminViewModels.ViewNotesModel;
using static HalloDoc_DAL.ViewModels.AdminViewModels.ViewUploadsModel;

namespace HalloDoc_BAL.AdminRepository
{
    public class ActionRepository : IActionRepository
    {
        private readonly ApplicationDbContext _context;

        public ActionRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<ViewCaseModel> GetViewCase(int requestclientid)
        {
            var query = await (from r in _context.Requests
                               join rc in _context.RequestClients on r.RequestId equals rc.RequestId
                               join re in _context.Regions on rc.RegionId equals re.RegionId into regionGroup
                               from region in regionGroup.DefaultIfEmpty()
                               where rc.RequestClientId == requestclientid
                               select new ViewCaseModel
                               {
                                   RequestId = r.RequestId,
                                   PatientF = rc.FirstName,
                                   PatientL = rc.LastName,
                                   Email = r.Email,
                                   Status = r.Status,
                                   DOB = new DateOnly((int)rc.IntYear, Convert.ToInt32(rc.StrMonth), (int)rc.IntDate),
                                   Phone = rc.PhoneNumber,

                                   Address = rc.Address,
                                   Notes = rc.Notes,
                                   Region = region.Name
                               }).FirstOrDefaultAsync();
            return query;

        }

        public async Task<bool> SaveViewCase(ViewCaseModel viewCase)
        {

            var requestclient = await _context.RequestClients.Where(r => r.RequestClientId == viewCase.RequestClientId).FirstAsync();

            requestclient.FirstName = viewCase.PatientF;
            requestclient.LastName = viewCase.PatientL;
            requestclient.PhoneNumber = viewCase.Phone;
            requestclient.Address = viewCase.Address;
            //requestclient.Region = viewCase.Region;
            _context.RequestClients.Update(requestclient);
            await _context.SaveChangesAsync();

            return true;
        }

        public async Task<ViewNotesModel> GetViewNotes(int requestid)
        {
            try
            {
                ViewNotesModel? notes = await _context.RequestNotes
                    .Where(r => r.RequestId == requestid)
                    .Select(r => new ViewNotesModel
                    {
                        Requestid = r.RequestId,
                        AdministrativeNotes = r.AdministrativeNotes,
                        AdminNotes = r.AdminNotes,
                        CreatedBy = r.CreatedBy,
                        CreatedDate = r.CreatedDate,
                        //Intdate = r.Intdate,
                        //Intyear = r.Intyear,
                        //Ip = r.Ip,
                        ModifiedBy = r.ModifiedBy,
                        ModifiedDate = r.ModifiedDate,
                        PhysicianNotes = r.PhysicianNotes,
                        RequestNotesId = r.RequestNotesId,
                    })
                    .FirstOrDefaultAsync();


                var requestlog = await _context.RequestStatusLogs
                    .Where(E => E.RequestId == requestid && E.TransToPhysician != null)
                .ToListAsync();
                if (requestlog.Count <= 0 && notes == null)
                {
                    notes = new ViewNotesModel();
                    notes.Requestid = requestid;
                    notes.PhysicianNotes = "--";
                    notes.AdministrativeNotes = "--";
                    notes.AdminNotes = "--";
                }
                List<TransferNotesModel> transferlist = requestlog.Select(e => new TransferNotesModel
                {
                    RequestId = e.RequestId,
                    Notes = e.Notes,
                    PhysicianId = e.PhysicianId,
                    CreatedDate = e.CreatedDate,
                    RequestStatusLogId = e.RequestStatusLogId,
                    TranstoAdmin = e.TransToAdmin,
                    TranstoPhysicianId = e.TransToPhysicianId
                }).ToList();

                notes.TransferNotes = transferlist;

                return notes;
            }
            catch (Exception e)
            {
                throw;
            }

            //var query = (from rs in _context.RequestStatusLogs
            //             join r in _context.RequestNotes on rs.RequestId equals r.RequestId into rGroup
            //             from r
            //             join p in _context.Physicians on rs.TransToPhysicianId equals p.PhysicianId into pGroup
            //             from p in pGroup.DefaultIfEmpty()
            //             join a in _context.Admins on rs.AdminId equals a.AdminId into aGroup
            //             from a in aGroup.DefaultIfEmpty()
            //             where rs.RequestId == requestid
            //             select new ViewNotesModel
            //             {
            //                 Requestid = rs.RequestId,
            //                 AdminNotes = r.AdminNotes,
            //                 PhysicianNotes = r.PhysicianNotes,
            //                 Status = rs.Status,
            //                 TransferDate = rs.CreatedDate,
            //                 Notes = rs.Notes,
            //                 Physician = p.FirstName,
            //                 Admin = a.FirstName,


            //             }).ToList();

            //if(query.Count <= 0)
            //{
            //    query.Add(new ViewNotesModel { Requestid = requestid, AdminNotes = "-", PhysicianNotes = "-" });
            //}

            //return query;

        }
        public async Task<bool> SaveViewNotes(int? Requestid, string? AdminNotes, string? PhysicianNotes)
        {
            try
            {
                RequestNote notes = _context.RequestNotes.FirstOrDefault(E => E.RequestId == Requestid);
                if (PhysicianNotes != null)
                {
                    if (notes != null)
                    {

                        notes.PhysicianNotes = PhysicianNotes;
                        notes.ModifiedDate = DateTime.Now;

                        _context.RequestNotes.Update(notes);
                        await _context.SaveChangesAsync();
                        return true;
                    }
                    else

                    {
                        RequestNote rn = new RequestNote
                        {
                            RequestId = (int)Requestid,
                            PhysicianNotes = PhysicianNotes,
                            CreatedDate = DateTime.Now,
                            CreatedBy = "5df80732-5198-4c87-b1ea-ebf86cbd7530"
                        };
                        _context.RequestNotes.Add(rn);
                        await _context.SaveChangesAsync();
                        return true;
                    }
                }
                else if (AdminNotes != null)
                {
                    if (notes != null)
                    {

                        notes.AdminNotes = AdminNotes;
                        notes.ModifiedDate = DateTime.Now;

                        _context.RequestNotes.Update(notes);
                        await _context.SaveChangesAsync();
                        return true;
                    }
                    else
                    {
                        RequestNote rn = new RequestNote
                        {
                            RequestId = (int)Requestid,
                            AdminNotes = AdminNotes,
                            CreatedDate = DateTime.Now,
                            CreatedBy = "5df80732-5198-4c87-b1ea-ebf86cbd7530"
                        };
                        _context.RequestNotes.Add(rn);
                        await _context.SaveChangesAsync();
                        return true;
                    }
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

            //var  request = await _context.RequestNotes.Where(r => r.RequestId == Requestid).FirstOrDefaultAsync();
            //if(request == null)
            //{
            //    RequestNote requestNotes = new RequestNote
            //    {
            //        RequestId = (int)Requestid,
            //        AdminNotes = AdminNotes,
            //        CreatedDate = DateTime.Now,
            //        CreatedBy = "5df80732-5198-4c87-b1ea-ebf86cbd7530"
            //    };

            //    _context.RequestNotes.Add(requestNotes);
            //   await _context.SaveChangesAsync();
            //    return true;

            //}
            //else
            //{
            //    request.AdminNotes = AdminNotes;
            //    _context.RequestNotes.Update(request);
            //    await _context.SaveChangesAsync();
            //    return true;
            //}

            //return false;
        }
        public async Task<bool> CancelCase(int RequestId, CancelCaseModel cancelCaseModel)
        {
            var req = await _context.Requests.Where(e => e.RequestId == cancelCaseModel.Requestid).FirstAsync();
            if (req != null)
            {
                req.CaseTag = cancelCaseModel.ReasonTag;
                req.Status = 3;
                _context.Requests.Update(req);
                _context.SaveChanges();

                RequestStatusLog requestStatusLog = new RequestStatusLog
                {
                    RequestId = cancelCaseModel.Requestid,
                    Status = 3,
                    AdminId = cancelCaseModel.AdminId,
                    Notes = cancelCaseModel?.Notes,
                    CreatedDate = DateTime.Now,
                };

                _context.RequestStatusLogs.Add(requestStatusLog);
                _context.SaveChanges();

                return true;
            }
            return false;
        }
        public async Task<List<CaseTagComboBox>> CaseTagComboBox()
        {
            return await _context.CaseTags.Select(req => new CaseTagComboBox()
            {
                CaseTagId = req.CaseTagId,
                CaseTagName = req.Name,
            }).ToListAsync();

        }
        public async Task<List<RegionComboBox>> RegionComboBox()
        {
            return await _context.Regions.Select(req => new RegionComboBox()
            {
                RegionId = req.RegionId,
                RegionName = req.Name,
                RegionAbbr = req.Abbreviation,
            }).ToListAsync();
        }
        public IEnumerable<Region> GetRegions()
        {
            return (IEnumerable<Region>)_context.Regions.ToList();
        }
        public List<Physician> GetPhysicianByRegion(int RegionId)
        {
            List<Physician> p = _context.Physicians.Where(p => p.RegionId == RegionId).ToList();
            return p;
        }
        public async Task<bool> SaveAssignCase(int RequestId, AssignCaseModel assignCaseModel)
        {
            var req = await _context.Requests.Where(e => e.RequestId == assignCaseModel.RequestId).FirstAsync();
            if (req != null)
            {

                req.Status = 2;
                req.PhysicianId = assignCaseModel.PhysicianId;
                _context.Requests.Update(req);
                _context.SaveChanges();

                RequestStatusLog requestStatusLog = new RequestStatusLog
                {
                    RequestId = (int)assignCaseModel.RequestId,
                    Status = 2,
                    AdminId = 1,
                    PhysicianId = assignCaseModel.PhysicianId,
                    Notes = assignCaseModel?.Notes,
                    CreatedDate = DateTime.Now,
                };

                _context.RequestStatusLogs.Add(requestStatusLog);
                _context.SaveChanges();

                return true;
            }
            return false;
        }
        public async Task<bool> BlockCase(int RequestId, CancelCaseModel cancelCaseModel)
        {
            var req = await _context.Requests.Where(e => e.RequestId == cancelCaseModel.Requestid).FirstAsync();
            if (req != null)
            {

                req.Status = 11;

                _context.Requests.Update(req);
                _context.SaveChanges();

                RequestStatusLog requestStatusLog = new RequestStatusLog
                {
                    RequestId = (int)cancelCaseModel.Requestid,
                    Status = 2,
                    AdminId = 1,

                    Notes = cancelCaseModel?.Notes,
                    CreatedDate = DateTime.Now,
                };

                _context.RequestStatusLogs.Add(requestStatusLog);
                _context.SaveChanges();

                BlockRequest blockCase = new BlockRequest
                {
                    RequestId = cancelCaseModel.Requestid.ToString(),
                    Reason = cancelCaseModel.Notes,
                    CreatedDate = DateTime.Now,
                    PhoneNumber = req?.PhoneNumber,
                    Email = req?.Email,

                };
                _context.BlockRequests.Add(blockCase);
                _context.SaveChanges();

                return true;
            }
            return false;
        }
        public async Task<ViewUploadsModel> GetUploadedDocuments(int RequestId)
        {
            ViewUploadsModel query = await (from r in _context.Requests
                        join rc in _context.RequestClients on r.RequestId equals rc.RequestId into rcGroup                         
                        from rc in rcGroup.DefaultIfEmpty()
                        where r.RequestId == RequestId
                        select new ViewUploadsModel
                        {
                            RequestId = r.RequestId,
                            ConfirmationNumber = r.ConfirmationNumber,
                            FirstName = rc.FirstName,
                            LastName = rc.LastName,
                            Email = rc.Email,
                            Phone = rc.PhoneNumber,
                            
                        }).FirstAsync();
            List<Documents> docs = _context.RequestWiseFiles.Where(e => e.RequestId == RequestId)
                                    .OrderByDescending(e => e.CreatedDate)
                                    .Select(e => new Documents
                                    {
                                        RequestWiseFileId = e.RequestWiseFileId,
                                        FileName = e.FileName,
                                        CreatedDate = e.CreatedDate,
                                    }).ToList();
            query.DocumentsList = docs;
            return query;
        }
    }
}