﻿using HalloDoc_BAL.Repository.Interfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.Repository
{
    public class CreateRequestsRepository : ICreateRequestsRepository
    {
        private readonly ApplicationDbContext _context;


        public CreateRequestsRepository(ApplicationDbContext context)
        {
            _context = context;
        }


        public async Task<AspNetUser> aspNetUsers(string email,AspNetUser aspNetUser)
        {
            AspNetUser? aspnetuser = await _context.AspNetUsers.FirstOrDefaultAsync(m => m.Email == email);

            return aspnetuser;
        }
        public async Task<User> users(string id)
        {

            User user = await _context.Users.FirstOrDefaultAsync(m => m.Id == id);

            return user;
        }

        public async Task<Boolean> CreatePatientRequest(ViewPatientRequest model)
        {
            if (model.Password != null)
            {
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

                User user = new User
                {
                    Id = newaspNetUser.Id,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    Email = model.Email,
                    Mobile = model.PhoneNumber,
                    CreatedBy = newaspNetUser.Id,
                    CreatedDate = DateTime.Now,
                };

                _context.Users.Add(user);
                _context.SaveChanges();

                var request = new Request
                {
                    RequestTypeId = 1,
                    UserId = user.UserId,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    Email = model.Email,
                    Status = 1,
                    CreatedDate = DateTime.Now,
                    IsUrgentEmailSent = new BitArray(1),

                };

                _context.Requests.Add(request);
                _context.SaveChanges();

                var requestClient = new RequestClient
                {
                    RequestId = request.RequestId,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    Notes = model.symptoms,

                };
                _context.RequestClients.Add(requestClient);
                _context.SaveChanges();

                if (model.UploadFile != null)
                {


                    string FilePath = "wwwroot\\UploadedFiles\\" + request.RequestId;
                    string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);

                    string newfilename = $"{Path.GetFileNameWithoutExtension(model.UploadFile.FileName)}-{DateTime.Now.ToString("yyyyMMddhhmmss")}.{Path.GetExtension(model.UploadFile.FileName).Trim('.')}";

                    string fileNameWithPath = Path.Combine(path, newfilename);
                    model.UploadImage = FilePath.Replace("wwwroot\\UploadedFiles\\", "/UploadedFiles/") + "/" + newfilename;


                    using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                    {
                        model.UploadFile.CopyTo(stream);
                    }

                    var requestwisefile = new RequestWiseFile
                    {
                        RequestId = request.RequestId,
                        FileName = model.UploadImage,
                        CreatedDate = DateTime.Now,
                    };
                    _context.RequestWiseFiles.Add(requestwisefile);
                    _context.SaveChanges();

                }
                return true;



            }
            else if (model.Password == null)
            {
                var IsBlocked =  _context.BlockRequests.Where(e => e.Email == model.Email);
                if(IsBlocked == null)
                {
                    var user = await _context.Users.FirstOrDefaultAsync(m => m.Email == model.Email);

                    var request = new Request
                    {
                        RequestTypeId = 1,
                        UserId = user.UserId,
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        PhoneNumber = model.PhoneNumber,
                        Email = model.Email,
                        Status = 1,
                        CreatedDate = DateTime.Now,
                        IsUrgentEmailSent = new BitArray(1),

                    };

                    _context.Requests.Add(request);
                    _context.SaveChanges();

                    var requestClient = new RequestClient
                    {
                        RequestId = request.RequestId,
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        PhoneNumber = model.PhoneNumber,
                        Notes = model.symptoms,

                    };
                    _context.RequestClients.Add(requestClient);
                    _context.SaveChanges();



                    if (model.UploadFile != null)
                    {


                        string FilePath = "wwwroot\\UploadedFiles\\" + request.RequestId;
                        string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                        if (!Directory.Exists(path))
                            Directory.CreateDirectory(path);

                        string newfilename = $"{Path.GetFileNameWithoutExtension(model.UploadFile.FileName)}-{DateTime.Now.ToString("yyyyMMddhhmmss")}.{Path.GetExtension(model.UploadFile.FileName).Trim('.')}";

                        string fileNameWithPath = Path.Combine(path, newfilename);
                        model.UploadImage = FilePath.Replace("wwwroot\\UploadedFiles\\", "/UploadedFiles/") + "/" + newfilename;


                        using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                        {
                            model.UploadFile.CopyTo(stream);
                        }

                        var requestwisefile = new RequestWiseFile
                        {
                            RequestId = request.RequestId,
                            FileName = model.UploadImage,
                            CreatedDate = DateTime.Now,
                        };
                        _context.RequestWiseFiles.Add(requestwisefile);
                        _context.SaveChanges();

                    }
                }
                else
                {
                    return false;
                }
                
                return true;
            }
            else
            {
               
                return false;
            }

        }

        public async Task<Boolean> CreateFamilyRequest(ViewFamilyRequest model)
        {
            var IsBlocked = _context.BlockRequests.Where(e => e.Email == model.Email);
            if (IsBlocked == null)
            {
                var request = new Request
                {
                    RequestTypeId = 2,
                    FirstName = model.FFirstname,
                    LastName = model.FLastname,
                    PhoneNumber = model.FPhoneNumber,
                    Email = model.FEmail,
                    Status = 1,
                    CreatedDate = DateTime.Now,
                    IsUrgentEmailSent = new BitArray(1),

                };

                _context.Requests.Add(request);
                _context.SaveChanges();

                var requestClient = new RequestClient
                {
                    RequestId = request.RequestId,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    Notes = model.symptoms,

                };
                _context.RequestClients.Add(requestClient);
                _context.SaveChanges();

                if (model.UploadFile != null)
                {


                    string FilePath = "wwwroot\\UploadedFiles\\" + request.RequestId;
                    string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);

                    string newfilename = $"{Path.GetFileNameWithoutExtension(model.UploadFile.FileName)}-{DateTime.Now.ToString("yyyyMMddhhmmss")}.{Path.GetExtension(model.UploadFile.FileName).Trim('.')}";

                    string fileNameWithPath = Path.Combine(path, newfilename);
                    model.UploadImage = FilePath.Replace("wwwroot\\UploadedFiles\\", "/UploadedFiles/") + "/" + newfilename;


                    using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                    {
                        model.UploadFile.CopyTo(stream);
                    }

                    var requestwisefile = new RequestWiseFile
                    {
                        RequestId = request.RequestId,
                        FileName = model.UploadImage,
                        CreatedDate = DateTime.Now,
                    };
                    _context.RequestWiseFiles.Add(requestwisefile);
                    _context.SaveChanges();

                }

                return true;

            }
            else
            {
                return false;
            }
           
        }
        public async Task<Boolean> CreateConciergeRequest(ViewConciergeRequest model)
        {
            var IsBlocked = _context.BlockRequests.Where(e => e.Email == model.Email);
            if (IsBlocked == null)
            {
                var concierge = new Concierge
                {
                    ConciergeName = model.FullName,
                    Street = "abc",
                    City = "abc",
                    State = "abc",
                    ZipCode = "abc",
                    CreatedDate = DateTime.Now,
                    RegionId = 1,

                };
                _context.Concierges.Add(concierge);
                _context.SaveChanges();

                var request = new Request
                {
                    RequestTypeId = 3,
                    FirstName = model.CFirstname,
                    LastName = model.CLastname,
                    PhoneNumber = model.CPhoneNumber,
                    Email = model.CEmail,
                    Status = 1,
                    CreatedDate = DateTime.Now,
                    IsUrgentEmailSent = new BitArray(1),

                };

                _context.Requests.Add(request);
                _context.SaveChanges();

                var requestConcierge = new RequestConcierge
                {
                    RequestId = request.RequestId,
                    ConciergeId = concierge.ConciergeId,

                };
                _context.RequestConcierges.Add(requestConcierge);
                _context.SaveChanges();

                var requestClient = new RequestClient
                {
                    RequestId = request.RequestId,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    Notes = model.symptoms,

                };
                _context.RequestClients.Add(requestClient);
                _context.SaveChanges();

                return true;
            }
            else { return false; }
        }

        public async Task<Boolean> CreateBusinessPartnerRequest(ViewBusinessPartnerRequest model)
        {
            var IsBlocked = _context.BlockRequests.Where(e => e.Email == model.Email);
            if (IsBlocked == null)
            {
                var business = new Business
                {
                    Name = model.FullName,
                    CreatedDate = DateTime.Now,

                };
                _context.Businesses.Add(business);
                _context.SaveChanges();

                var request = new Request
                {
                    RequestTypeId = 4,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    Email = model.Email,
                    Status = 1,
                    CreatedDate = DateTime.Now,
                    IsUrgentEmailSent = new BitArray(1),

                };

                _context.Requests.Add(request);
                _context.SaveChanges();

                var requestBusiness = new RequestBusiness
                {
                    RequestId = request.RequestId,
                    BusinessId = business.BusinessId,

                };
                _context.RequestBusinesses.Add(requestBusiness);
                _context.SaveChanges();

                var requestClient = new RequestClient
                {
                    RequestId = request.RequestId,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    Notes = model.symptoms,

                };
                _context.RequestClients.Add(requestClient);
                _context.SaveChanges();

                return true;
            }
            else { return false; }
        }

        public async Task<Boolean> CreateForSomeone(ViewPatientRequest model , string UserName)
        {
            var IsBlocked = _context.BlockRequests.Where(e => e.Email == model.Email);
            if (IsBlocked == null)
            {
                var user = await _context.Users.FirstOrDefaultAsync(m => m.Email == UserName);

                var request = new Request
                {
                    RequestTypeId = 1,
                    UserId = user.UserId,
                    FirstName = user.FirstName,
                    LastName = user.LastName,
                    PhoneNumber = model.PhoneNumber,
                    Email = user.Email,
                    Status = 1,
                    CreatedDate = DateTime.Now,
                    IsUrgentEmailSent = new BitArray(1),

                };

                _context.Requests.Add(request);
                _context.SaveChanges();

                var requestClient = new RequestClient
                {
                    RequestId = request.RequestId,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    PhoneNumber = model.PhoneNumber,
                    Notes = model.symptoms,

                };
                _context.RequestClients.Add(requestClient);
                _context.SaveChanges();

                if (model.UploadFile != null)
                {


                    string FilePath = "wwwroot\\UploadedFiles\\" + request.RequestId;
                    string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);

                    string newfilename = $"{Path.GetFileNameWithoutExtension(model.UploadFile.FileName)}-{DateTime.Now.ToString("yyyyMMddhhmmss")}.{Path.GetExtension(model.UploadFile.FileName).Trim('.')}";

                    string fileNameWithPath = Path.Combine(path, newfilename);
                    model.UploadImage = FilePath.Replace("wwwroot\\UploadedFiles\\", "/UploadedFiles/") + "/" + newfilename;


                    using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                    {
                        model.UploadFile.CopyTo(stream);
                    }

                    var requestwisefile = new RequestWiseFile
                    {
                        RequestId = request.RequestId,
                        FileName = model.UploadImage,
                        CreatedDate = DateTime.Now,
                    };
                    _context.RequestWiseFiles.Add(requestwisefile);
                    _context.SaveChanges();

                }

                return true;
            }else {  return false; }
        }

        public async Task<Boolean> CreateForMe(ViewPatientRequest model , string UserName)
        {
            var user = await _context.Users.FirstOrDefaultAsync(m => m.Email == UserName);


            var request = new Request
            {
                RequestTypeId = 1,
                UserId = user.UserId,
                FirstName = user.FirstName,
                LastName = user.LastName,
                PhoneNumber = model.PhoneNumber,
                Email = model.Email,
                RelationName = model.Relation,
                Status = 1,
                CreatedDate = DateTime.Now,
                IsUrgentEmailSent = new BitArray(1),

            };

            _context.Requests.Add(request);
            _context.SaveChanges();

            var requestClient = new RequestClient
            {
                RequestId = request.RequestId,
                FirstName = user.FirstName,
                LastName = user.LastName,
                PhoneNumber = model.PhoneNumber,
                Notes = model.symptoms,

            };
            _context.RequestClients.Add(requestClient);
            _context.SaveChanges();



            if (model.UploadFile != null)
            {


                string FilePath = "wwwroot\\UploadedFiles\\" + request.RequestId;
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string newfilename = $"{Path.GetFileNameWithoutExtension(model.UploadFile.FileName)}-{DateTime.Now.ToString("yyyyMMddhhmmss")}.{Path.GetExtension(model.UploadFile.FileName).Trim('.')}";

                string fileNameWithPath = Path.Combine(path, newfilename);
                model.UploadImage = FilePath.Replace("wwwroot\\UploadedFiles\\", "/UploadedFiles/") + "/" + newfilename;


                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    model.UploadFile.CopyTo(stream);
                }

                var requestwisefile = new RequestWiseFile
                {
                    RequestId = request.RequestId,
                    FileName = model.UploadImage,
                    CreatedDate = DateTime.Now,
                };
                _context.RequestWiseFiles.Add(requestwisefile);
                _context.SaveChanges();

            }
            return true;
        }


        public async Task<User> RequestForMe(int UserId)
        {
            User user = _context.Users.FirstOrDefault(u => u.UserId == UserId);
            return user;
        }
    }
}