using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System.Collections;
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
                ViewNotesModel? notes = new ViewNotesModel();
                     notes = await _context.RequestNotes
                    .Where(r => r.RequestId == requestid)
                    .Select(r => new ViewNotesModel
                    {
                        Requestid = r.RequestId,
                        AdministrativeNotes = r.AdministrativeNotes,
                        AdminNotes = r.AdminNotes,
                        CreatedBy = r.CreatedBy,
                        CreatedDate = r.CreatedDate,
                        ModifiedBy = r.ModifiedBy,
                        ModifiedDate = r.ModifiedDate,
                        PhysicianNotes = r.PhysicianNotes,
                        RequestNotesId = r.RequestNotesId,
                    })
                    .FirstOrDefaultAsync();
                    if ( notes == null)
                    {
                        notes = new ViewNotesModel();
                        notes.Requestid = requestid;
                        notes.PhysicianNotes = "--";
                        notes.AdministrativeNotes = "--";
                        notes.AdminNotes = "--";
                    }
                    var requestlog2 = await _context.RequestStatusLogs
                        .Where(E => E.RequestId == requestid && (E.Status == 3 || E.Status == 7 || E.Status == 8))
                    .ToListAsync();
                    
                    List<CancellationNotesModel> cancellist = requestlog2.Select(e => new CancellationNotesModel
                    {
                        RequestId = e.RequestId,
                        Notes = e.Notes,
                        Status = e.Status,
                        CreatedDate = e.CreatedDate,
                        RequestStatusLogId = e.RequestStatusLogId,

                    }).ToList();

                    notes.CancellationNotes = cancellist;
                
                List<TransferNotesModel> transferlist = (from rs in _context.RequestStatusLogs
                                                         join py in _context.Physicians on rs.PhysicianId equals py.PhysicianId into pyGroup
                                                         from py in pyGroup.DefaultIfEmpty()
                                                         join p in _context.Physicians on rs.TransToPhysicianId equals p.PhysicianId into pGroup
                                                         from p in pGroup.DefaultIfEmpty()
                                                         join a in _context.Admins on rs.AdminId equals a.AdminId into aGroup
                                                         from a in aGroup.DefaultIfEmpty()
                                                         where (rs.RequestId == requestid && (rs.Status !=3 && rs.Status != 7 && rs.Status != 8 ) && rs.TransToPhysicianId != null)
                                                         select new TransferNotesModel
                                                         {
                                                             TranstoPhysician = p.FirstName +' '+ p.LastName,
                                                             AdminName = a.FirstName + ' '+a.LastName,
                                                             PhysicianName = py.FirstName+' '+py.LastName,
                                                             RequestId = rs.RequestId,
                                                             Notes = rs.Notes,
                                                             Status = rs.Status,
                                                             PhysicianId = rs.PhysicianId,
                                                             CreatedDate = rs.CreatedDate,
                                                             RequestStatusLogId = rs.RequestStatusLogId,
                                                             TranstoAdmin = rs.TransToAdmin,
                                                             TranstoPhysicianId = rs.TransToPhysicianId

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
                    TransToAdmin = new BitArray(new[] { false }),
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
        public  List<RegionComboBox> RegionComboBox()
        {
            return  _context.Regions.Select(req => new RegionComboBox()
            {
                RegionId = req.RegionId,
                RegionName = req.Name,
                RegionAbbr = req.Abbreviation,
            }).ToList();
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
                    TransToPhysicianId = assignCaseModel.PhysicianId,
                    Notes = assignCaseModel?.Notes,
                    TransToAdmin = new BitArray(new[] { false }),
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
                    Status = 11,
                    //AdminId = 1,
                    TransToAdmin = new BitArray(new[] { false }),
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
                                    .Where(e => e.IsDeleted == new BitArray(new[] {false}))
                                    .Select(e => new Documents
                                    {
                                        RequestWiseFileId = e.RequestWiseFileId,
                                        FileName = e.FileName,
                                        CreatedDate = e.CreatedDate,
                                    }).ToList();
            query.DocumentsList = docs;
            return query;
        }
        public Boolean ViewUploadDocs(int Requestid, string Filename)
        {
            if (Requestid != null && Filename != null)
            {
                var requestwisefile = new RequestWiseFile
                {
                    RequestId = Requestid,
                    FileName = Filename,
                    AdminId = 1,
                    IsDeleted = new BitArray(new[] { false }),
                    CreatedDate = DateTime.Now,
                };
                _context.RequestWiseFiles.Add(requestwisefile);
                _context.SaveChanges();

                return true;
            }
            return false;
        }
        public Boolean DeleteDoc(int Requestid, int RequestWiseFileId)
        {
            var File = _context.RequestWiseFiles.FirstOrDefault(e => e.RequestWiseFileId == RequestWiseFileId);
            if (File != null)
            {
                File.IsDeleted = new BitArray(new[] { true });                
                _context.RequestWiseFiles.Update(File);
                _context.SaveChanges();

                return true;
            }
            return false;
        }
        public async Task<List<ProfessionComboBox>> ProfessionComboBox()
        {
            var Profession = await _context.HealthProfessionalTypes.Select(req => new ProfessionComboBox()
            {
                HealthProfessionalId = req.HealthProfessionalId,
                ProfessionName = req.ProfessionName,
            }).ToListAsync();
            return Profession;
        }
        public List<HealthProfessional> GetHealthProfessional(int HealthProfessionalId)
        {
            List<HealthProfessional> p = _context.HealthProfessionals.Where(p => p.Profession == HealthProfessionalId).ToList();
            return p;
        }
        public async Task<OrdersModel> GetOrder(int vendorId)
        {
            var query = await (from v in _context.HealthProfessionals
                               
                               where v.VendorId == vendorId
                               select new OrdersModel
                               {
                                   VendorId = v.VendorId,
                                   VendorName = v.VendorName,
                                   Profession = (int)v.Profession,
                                   BusinessContact = v.BusinessContact,
                                   Email = v.Email,
                                   FaxNumber = v.FaxNumber,
                                   
                               }).FirstOrDefaultAsync();
            return query;

        }
        public bool SaveOrders(OrdersModel ordersModel,int RequestId)
        {
            if (RequestId != null )
            {
                var OrderDetail = new OrderDetail
                {

                    RequestId = RequestId,
                    VendorId= ordersModel.VendorId,
                    FaxNumber= ordersModel.FaxNumber,
                    Email= ordersModel.Email,
                    BusinessContact= ordersModel.BusinessContact,
                    Prescription = ordersModel.Prescription,
                    NoOfRefill= ordersModel.NoOfRefill,
                    
                    CreatedDate = DateTime.Now,
                };
                _context.OrderDetails.Add(OrderDetail);
                _context.SaveChanges();

                return true;
            }
            return false;

        }
        public  bool TransferCase(int RequestId, AssignCaseModel assignCaseModel)
        {
            var req =  _context.Requests.FirstOrDefault(e => e.RequestId == RequestId);
            if (req != null)
            {
                RequestStatusLog requestStatusLog = new RequestStatusLog
                {
                    RequestId = (int)assignCaseModel.RequestId,
                    Status = 2,
                    PhysicianId = req.PhysicianId,
                    TransToPhysicianId = assignCaseModel.PhysicianId,
                    Notes = assignCaseModel?.Notes,
                    TransToAdmin = new BitArray(new[] { false }),
                    CreatedDate = DateTime.Now,
                };
                _context.RequestStatusLogs.Add(requestStatusLog);
                _context.SaveChanges();

                
                req.PhysicianId = assignCaseModel.PhysicianId;
                _context.Requests.Update(req);
                _context.SaveChanges();

                return true;
            }
            return false;
        }
        public bool ClearCase(int RequestId)
        {
            var req = _context.Requests.FirstOrDefault(e => e.RequestId == RequestId);
            if (req != null)
            {
                req.Status = 10;
                _context.Requests.Update(req);
                _context.SaveChanges();
                RequestStatusLog requestStatusLog = new RequestStatusLog
                {
                    RequestId = (int)RequestId,
                    Status = 10,
                    TransToAdmin = new BitArray(new[] { false }),
                    CreatedDate = DateTime.Now,
                };
                _context.RequestStatusLogs.Add(requestStatusLog);
                _context.SaveChanges();
                return true;
            }
            
            return false;
        }
        public bool IsAgreementValid(int RequestId)
        {
            if (RequestId != 0)
            {
                var request = _context.Requests.FirstOrDefault(e => e.RequestId == RequestId);
                if(request.Status == 2) { return true; }
                else { return false; }
            }
            return false;
        }
        public bool Accept(int RequestId)
        {
            if(RequestId != 0)
            {
                var request = _context.Requests.FirstOrDefault(e => e.RequestId == RequestId);
                if (request != null)
                {
                    request.Status = 4;
                    _context.Requests.Update(request);
                    _context.SaveChanges();
                    RequestStatusLog requestStatusLog = new RequestStatusLog
                    {
                        RequestId = (int)RequestId,
                        Status = 4,
                        TransToAdmin = new BitArray(new[] { false }),
                        CreatedDate = DateTime.Now,
                    };
                    _context.RequestStatusLogs.Add(requestStatusLog);
                    _context.SaveChanges();
                    return true;
                }
                return false;
            }
            else { return false; }
        }
        public bool CancelAgreement(int RequestId, string Notes)
        {
            if (RequestId != 0)
            {
                var request = _context.Requests.FirstOrDefault(e => e.RequestId == RequestId);
                if (request != null)
                {
                    request.Status = 7;
                    _context.Requests.Update(request);
                    _context.SaveChanges();
                    RequestStatusLog requestStatusLog = new RequestStatusLog
                    {
                        RequestId = (int)RequestId,
                        Status = 7,
                        Notes = Notes,
                        TransToAdmin = new BitArray(new[] { false }),
                        CreatedDate = DateTime.Now,
                    };
                    _context.RequestStatusLogs.Add(requestStatusLog);
                    _context.SaveChanges();
                    return true;
                }
                return false;
            }
            else { return false; }
        }
        public EncounterModel GetEncounterForm (int RequestId)
        {
            if (RequestId != 0)
            {
                var result = (from rc in _context.RequestClients
                                          join e in _context.EncounterForms
                                          on rc.RequestId equals e.RequestId
                                          where rc.RequestId == RequestId
                                          select new EncounterModel
                                          {
                                              //RequestId = rc.RequestId,
                                              FirstName = rc.FirstName,
                                              LastName = rc.LastName,
                                              Phone = rc.PhoneNumber,
                                              Email = rc.Email,
                                              Location = rc.Location,
                                              HistoryOfPresentIllnessOrInjury = e.HistoryOfPresentIllnessOrInjury,
                                              MedicalHistory = e.MedicalHistory,
                                              Medications = e.Medications,
                                              Allergies = e.Allergies,
                                              Temp = e.Temp,
                                              Hr = e.Hr,
                                              Rr = e.Rr,
                                              BloodPressureSystolic = e.BloodPressureSystolic,
                                              BloodPressureDiastolic = e.BloodPressureDiastolic,
                                              O2 = e.O2,
                                              Pain = e.Pain,
                                              Heent = e.Heent,
                                              Cv = e.Cv,
                                              Chest = e.Chest,
                                              Abd = e.Abd,
                                              Extremeties = e.Extremeties,
                                              Skin = e.Skin,
                                              Neuro = e.Neuro,
                                              Other = e.Other,
                                              Diagnosis = e.Diagnosis,
                                              TreatmentPlan = e.TreatmentPlan,
                                              MedicationsDispensed = e.MedicationsDispensed,
                                              Procedures = e.Procedures,
                                              FollowUp = e.FollowUp,
                                              IsFinalize = e.IsFinalize,
                                              //DateOfService = e.CreatedDate
                                          }).FirstOrDefault();
             
                if(result == null)
                {
                    result = (from rc in _context.RequestClients
                             where rc.RequestId == RequestId
                             select new EncounterModel
                             {
                                 RequestId = rc.RequestId,
                                 FirstName = rc.FirstName,
                                 LastName = rc.LastName,
                                 Phone = rc.PhoneNumber,
                                 Email = rc.Email,
                                 Location = rc.Location,
                             }).FirstOrDefault();
                }
                
                return result;
            }
            return null;
                
        }
        public bool EncounterForm(int RequestId, EncounterModel encounterModel)
        {
            if (RequestId != 0 )
            {
                var Encounter = _context.EncounterForms.FirstOrDefault(e => e.RequestId == RequestId);
                if(Encounter == null)
                {
                    var EncounterForm = new EncounterForm
                    {
                        RequestId = (int)RequestId,
                        HistoryOfPresentIllnessOrInjury = encounterModel.HistoryOfPresentIllnessOrInjury,
                        MedicalHistory = encounterModel.MedicalHistory,
                        Medications = encounterModel.Medications,
                        Allergies = encounterModel.Allergies,
                        Temp = encounterModel.Temp,
                        Hr = encounterModel.Hr,
                        Rr = encounterModel.Rr,
                        BloodPressureSystolic = encounterModel.BloodPressureSystolic,
                        BloodPressureDiastolic = encounterModel?.BloodPressureDiastolic,
                        O2 = encounterModel?.O2,
                        Pain = encounterModel?.Pain,
                        Heent = encounterModel?.Heent,
                        Cv = encounterModel?.Cv,
                        Chest = encounterModel?.Chest,
                        Abd = encounterModel?.Abd,
                        Extremeties = encounterModel?.Extremeties,
                        Skin = encounterModel?.Skin,
                        Neuro = encounterModel?.Neuro,
                        Other = encounterModel?.Other,
                        Diagnosis = encounterModel?.Diagnosis,
                        TreatmentPlan = encounterModel?.TreatmentPlan,
                        MedicationsDispensed = encounterModel.MedicationsDispensed,
                        Procedures = encounterModel?.Procedures,
                        FollowUp = encounterModel?.FollowUp,
                        IsFinalize = false,
                        CreatedDate = DateTime.Now,
                        
                    };
                    _context.EncounterForms.Add(EncounterForm);
                    _context.SaveChanges();
                }
                else
                {
                    Encounter.RequestId = (int)RequestId;
                    Encounter.HistoryOfPresentIllnessOrInjury = encounterModel.HistoryOfPresentIllnessOrInjury;
                    Encounter.MedicalHistory = encounterModel.MedicalHistory;
                    Encounter.Medications = encounterModel.Medications;
                        Encounter.Allergies = encounterModel.Allergies;
                        Encounter.Temp = encounterModel.Temp;
                    Encounter.Hr = encounterModel.Hr;
                        Encounter.Rr = encounterModel.Rr;
                        Encounter.BloodPressureSystolic = encounterModel.BloodPressureSystolic;
                        Encounter.BloodPressureDiastolic = encounterModel?.BloodPressureDiastolic;
                        Encounter.O2 = encounterModel?.O2;
                        Encounter.Pain = encounterModel?.Pain;
                        Encounter.Heent = encounterModel?.Heent;
                        Encounter.Cv = encounterModel?.Cv;
                        Encounter.Chest = encounterModel?.Chest;
                        Encounter.Abd = encounterModel?.Abd;
                        Encounter.Extremeties = encounterModel?.Extremeties;
                        Encounter.Skin = encounterModel?.Skin;
                        Encounter.Neuro = encounterModel?.Neuro;
                        Encounter.Other = encounterModel?.Other;
                        Encounter.Diagnosis = encounterModel?.Diagnosis;
                        Encounter.TreatmentPlan = encounterModel?.TreatmentPlan;
                        Encounter.MedicationsDispensed = encounterModel.MedicationsDispensed;
                        Encounter.Procedures = encounterModel?.Procedures;
                        Encounter.FollowUp = encounterModel?.FollowUp;
                        Encounter.IsFinalize = false;
                        Encounter.ModifiedDate = DateTime.Now;
                    _context.EncounterForms.Update(Encounter);
                    _context.SaveChanges();
                }
               
                return true;
            }
            return false;

        }
        public bool Finalize(int RequestId, EncounterModel encounterModel, string id)
        {
            if (RequestId != 0)
            {
                var Encounter = _context.EncounterForms.FirstOrDefault(e => e.RequestId == RequestId);
                if (Encounter == null)
                {
                    var EncounterForm = new EncounterForm
                    {
                        RequestId = (int)RequestId,
                        HistoryOfPresentIllnessOrInjury = encounterModel.HistoryOfPresentIllnessOrInjury,
                        MedicalHistory = encounterModel.MedicalHistory,
                        Medications = encounterModel.Medications,
                        Allergies = encounterModel.Allergies,
                        Temp = encounterModel.Temp,
                        Hr = encounterModel.Hr,
                        Rr = encounterModel.Rr,
                        BloodPressureSystolic = encounterModel.BloodPressureSystolic,
                        BloodPressureDiastolic = encounterModel?.BloodPressureDiastolic,
                        O2 = encounterModel?.O2,
                        Pain = encounterModel?.Pain,
                        Heent = encounterModel?.Heent,
                        Cv = encounterModel?.Cv,
                        Chest = encounterModel?.Chest,
                        Abd = encounterModel?.Abd,
                        Extremeties = encounterModel?.Extremeties,
                        Skin = encounterModel?.Skin,
                        Neuro = encounterModel?.Neuro,
                        Other = encounterModel?.Other,
                        Diagnosis = encounterModel?.Diagnosis,
                        TreatmentPlan = encounterModel?.TreatmentPlan,
                        MedicationsDispensed = encounterModel.MedicationsDispensed,
                        Procedures = encounterModel?.Procedures,
                        FollowUp = encounterModel?.FollowUp,
                        IsFinalize = true,
                        CreatedDate = DateTime.Now,

                    };
                    _context.EncounterForms.Add(EncounterForm);
                    _context.SaveChanges();
                }
                else
                {
                    Encounter.RequestId = (int)RequestId;
                    Encounter.HistoryOfPresentIllnessOrInjury = encounterModel.HistoryOfPresentIllnessOrInjury;
                    Encounter.MedicalHistory = encounterModel.MedicalHistory;
                    Encounter.Medications = encounterModel.Medications;
                    Encounter.Allergies = encounterModel.Allergies;
                    Encounter.Temp = encounterModel.Temp;
                    Encounter.Hr = encounterModel.Hr;
                    Encounter.Rr = encounterModel.Rr;
                    Encounter.BloodPressureSystolic = encounterModel.BloodPressureSystolic;
                    Encounter.BloodPressureDiastolic = encounterModel?.BloodPressureDiastolic;
                    Encounter.O2 = encounterModel?.O2;
                    Encounter.Pain = encounterModel?.Pain;
                    Encounter.Heent = encounterModel?.Heent;
                    Encounter.Cv = encounterModel?.Cv;
                    Encounter.Chest = encounterModel?.Chest;
                    Encounter.Abd = encounterModel?.Abd;
                    Encounter.Extremeties = encounterModel?.Extremeties;
                    Encounter.Skin = encounterModel?.Skin;
                    Encounter.Neuro = encounterModel?.Neuro;
                    Encounter.Other = encounterModel?.Other;
                    Encounter.Diagnosis = encounterModel?.Diagnosis;
                    Encounter.TreatmentPlan = encounterModel?.TreatmentPlan;
                    Encounter.MedicationsDispensed = encounterModel.MedicationsDispensed;
                    Encounter.Procedures = encounterModel?.Procedures;
                    Encounter.FollowUp = encounterModel?.FollowUp;
                    Encounter.IsFinalize = true;
                    Encounter.ModifiedDate = DateTime.Now;
                    _context.EncounterForms.Update(Encounter);
                    _context.SaveChanges();

                    var final = _context.Requests.FirstOrDefault(e => e.RequestId == encounterModel.RequestId);
                    final.ModifiedDate = DateTime.Now;
                    final.Status = 6;
                    _context.Requests.Update(final);
                    _context.SaveChanges();

                    var admindata = _context.Admins.FirstOrDefault(e => e.AspNetUserId ==  id);
                    RequestStatusLog rs = new RequestStatusLog
                    {
                        RequestId = final.RequestId,
                        Status = 6,
                        CreatedDate = DateTime.Now,
                        AdminId = admindata.AdminId


                    };
                }
                return true;
            }
            return false;

        }
        public async Task<bool> SaveCloseCase(ViewUploadsModel model)
        {

            var requestclient = await _context.RequestClients.Where(r => r.RequestClientId == Convert.ToInt32(model.RequestClientId)).FirstAsync();
            requestclient.PhoneNumber = model.Phone;
            requestclient.Email = model.Email;
            _context.RequestClients.Update(requestclient);
            await _context.SaveChangesAsync();

            return true;
        }
        public async Task<bool> ClosePatientCase(int Requestid)
        {
            var req = await _context.Requests.Where(e => e.RequestId == Requestid).FirstOrDefaultAsync();
            req.Status = 9; // Unpaid Case Status
            _context.Requests.Update(req);
            await _context.SaveChangesAsync();

            RequestStatusLog requestStatusLog = new RequestStatusLog
            {
                RequestId = Requestid,
                Status = 9, // Unpaid
                AdminId = 1,
                CreatedDate = DateTime.Now,
            };
            _context.RequestStatusLogs.Add(requestStatusLog);
            _context.SaveChanges();


            RequestClosed requestClosed = new RequestClosed
            {
                RequestId = Requestid,
                RequestStatusLogId = requestStatusLog.RequestStatusLogId,

            };
            _context.RequestCloseds.Add(requestClosed);
            _context.SaveChanges();

            return true;
        }
    }
}
