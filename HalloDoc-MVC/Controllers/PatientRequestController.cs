using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections;

namespace HalloDoc_MVC.Controllers
{
    public class PatientRequestController : Controller
    {
        private readonly ApplicationDbContext _context;
        public PatientRequestController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult create(ViewPatientRequest model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var newaspNetUser = new AspNetUser
                    {
                        Id = Guid.NewGuid().ToString(),
                        UserName = model.Email,
                        Email = model.Email,
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
                        PhoneNumber= model.PhoneNumber,
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
                else
                {
                    ViewData["error"] = "Can't Process Your Request, Try Again";
                    return View("Index");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occured: " + ex.Message);
                ViewData["error"] = "An error occurred while processing your request.";
                return View("Index");
            }


        }

    }
}
