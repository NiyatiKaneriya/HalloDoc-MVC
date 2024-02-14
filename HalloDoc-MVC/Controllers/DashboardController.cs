using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using HelloDoc.Models.CV;
using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Controllers
{
    public class DashboardController : Controller
    {
        private readonly ApplicationDbContext _context;


        public DashboardController(ApplicationDbContext context)
        {
            _context = context;
        }

        //public IActionResult Index => View();
        public IActionResult Index(ViewDashboard viewDashboard)
        {
            //var Request = _context.Requests.Where(r => r.UserId == Convert.ToInt32(CV.UserID())).ToList();

            //var Request = (from r in _context.Requests
            //               join f in _context.RequestWiseFiles on r.RequestId equals f.RequestId into fileGroup     fileGroup is an anonymous type representing 
            //               where r.UserId == Convert.ToInt32(CV.UserID())                                             the result of a group join operation.
            //               orderby r.CreatedDate descending                                                            In this context, it represents a collection 
            //               select new ViewDashboard                                                                   of all RequestWiseFiles associated with each Request.
            //               {
            //                   RequestId = r.RequestId,
            //                   CreatedDate = r.CreatedDate,
            //                   Status = r.Status,
            //                   FileCount = fileGroup.Count()
            //               }).ToList();


            var Request = _context.Requests
                                  .Where(r => r.UserId == Convert.ToInt32(CV.UserID()))
                                  .OrderByDescending(x => x.CreatedDate)
                                  .Select(r => new ViewDashboard
                                    {
                                        RequestId = r.RequestId,
                                        CreatedDate = r.CreatedDate,
                                        Status = r.Status,
                                        FileCount = _context.RequestWiseFiles.Count(f => f.RequestId == r.RequestId)
                                    }).ToList();

            return View(Request);
        }

        public IActionResult Documents(int? Requestid)
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


            return View(result);
        }

        public IActionResult UploadDoc(int Requestid, IFormFile file)
        {
            string UploadDoc;
            if (file != null)
            {
                string FilePath = "wwwroot\\Upload\\" + Requestid;
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string newfilename = $"{Path.GetFileNameWithoutExtension(file.FileName)}-{DateTime.Now.ToString("yyyyMMddhhmmss")}.{Path.GetExtension(file.FileName).Trim('.')}";

                string fileNameWithPath = Path.Combine(path, newfilename);
                UploadDoc = FilePath.Replace("wwwroot\\Upload\\", "/Upload/") + "/" + newfilename;
                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }

                var requestwisefile = new RequestWiseFile
                {
                    RequestId = Requestid,
                    FileName = UploadDoc,
                    CreatedDate = DateTime.Now,
                };
                _context.RequestWiseFiles.Add(requestwisefile);
                _context.SaveChanges();
            }

            return RedirectToAction("Index", new { Requestid = Requestid });
        }
        
    }
}
