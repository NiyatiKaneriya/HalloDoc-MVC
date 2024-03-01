using HalloDoc_BAL.Interfaces;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.Repository
{
    public class DashboardRepository : IDashboardRepository
    {
        private readonly ApplicationDbContext _context;
        

        public DashboardRepository(ApplicationDbContext context, SendEmailModel emailConfig)
        {
            _context = context;
        }

       public List<ViewDashboard> GetRequest(ViewDashboard viewDashboard,int UserID)
        {
            var Request = _context.Requests   .Where(r => r.UserId == Convert.ToInt32(UserID))
                                              .OrderByDescending(x => x.CreatedDate)
                                              .Select(r => new ViewDashboard
                                              {
                                                  RequestId = r.RequestId,
                                                  CreatedDate = r.CreatedDate,
                                                  Status = r.Status,
                                                  FileCount = _context.RequestWiseFiles.Count(f => f.RequestId == r.RequestId)
                                              }).ToList();

            return Request;
        }

        public List<ViewDashboard> GetDocuments(int? Requestid)
        {
            var result = _context.RequestWiseFiles
                        .Where(r => r.RequestId == Requestid)
                        .OrderByDescending(x => x.CreatedDate)
                        .Select(r => new ViewDashboard
                        {
                            RequestId = r.RequestId,
                            CreatedDate = r.CreatedDate,
                            Filename = r.FileName

                        })
                        .ToList();

            return result;
        }

        public Boolean UploadDocs(int Requestid,string Filename)
        {
            if(Requestid != null && Filename != null)
            {
                var requestwisefile = new RequestWiseFile
                {
                    RequestId = Requestid,
                    FileName = Filename,
                    CreatedDate = DateTime.Now,
                };
                _context.RequestWiseFiles.Add(requestwisefile);
                _context.SaveChanges();

                return true;
            }
            return false;
            
        }

    }
}


