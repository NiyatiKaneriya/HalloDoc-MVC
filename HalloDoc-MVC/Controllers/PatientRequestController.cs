using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections;

namespace HalloDoc_MVC.Controllers
{
    public class PatientRequestController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public PatientRequestController(ApplicationDbContext context,IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> CheckEmailAsync(string email)
        {
            string message;

            var aspnetuser = await _context.AspNetUsers.FirstOrDefaultAsync(m => m.Email == email);

            if (aspnetuser == null)
            {
                message = "False";
            }
            else
            {
                message = "success";
                var user = await _context.Users.FirstOrDefaultAsync(m => m.Id == aspnetuser.Id.ToString());

            }
            return Json(new
            {
                Message = message
            });
        }

        public async Task<IActionResult> createAsync(ViewPatientRequest model)
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

                return RedirectToAction("Index");

            }
            else if(model.Password == null)
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

                

                if(model.UploadFile != null)
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
