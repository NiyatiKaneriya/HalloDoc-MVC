
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using HelloDoc.Models.CV;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections;

namespace HalloDoc_MVC.Controllers
{
    public class RequestByPatientController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public RequestByPatientController(ApplicationDbContext context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult RequestForMe()
        {
            
            return View();
        }
        public async Task<IActionResult> CreateForMeAsync(ViewPatientRequest model)
        {

            if (ModelState.IsValid)
            {
                var user = await _context.Users.FirstOrDefaultAsync(m => m.Email == CV.UserName());


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
                return RedirectToAction("Index","Dashboard");
            }
            else
            {
                ViewData["error"] = "Can't Process Your Request, Try Again";
                return RedirectToAction("Index", "Dashboard");
            }
        }
        public IActionResult RequestForSomeone()
        {
            
            return View();
        }
        public async Task<IActionResult> CreateForSomeoneAsync(ViewPatientRequest model)
        {

            if (ModelState.IsValid)
            {
                var user = await _context.Users.FirstOrDefaultAsync(m => m.Email == CV.UserName());

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
                return RedirectToAction("Index", "Dashboard");

            }
            else if (model.Password == null)
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
                return RedirectToAction("Index");
            }
            else
            {
                ViewData["error"] = "Can't Process Your Request, Try Again";
                return View("Index");
            }
        }
    }
}
