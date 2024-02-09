﻿using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;
using HalloDoc_MVC.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections;

namespace HalloDoc_MVC.Controllers
{
    public class FamilyRequestController : Controller
    {
        private readonly ApplicationDbContext _context;
        public FamilyRequestController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Create(ViewFamilyRequest model)
        {
            try
            {
                if (ModelState.IsValid)
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
