using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections;
using System.Drawing;
using System.IO;
using System.Reflection.Emit;

namespace HalloDoc_MVC.Controllers
{
    public class ConciergeRequestController : Controller
    {
        private readonly ApplicationDbContext _context;
        public ConciergeRequestController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Create(ViewConciergeRequest model)
        {
            
                if (ModelState.IsValid)
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
