using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections;

namespace HalloDoc_Patient.Controllers
{
    public class BusinessPartnerRequestController : Controller
    {
        private readonly ApplicationDbContext _context;
        public BusinessPartnerRequestController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Create(ViewBusinessPartnerRequest model)
        {

                if (ModelState.IsValid)
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
