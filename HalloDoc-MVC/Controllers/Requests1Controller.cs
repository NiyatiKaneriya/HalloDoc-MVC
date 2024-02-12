using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using HalloDoc_DAL.DataContext;
using HalloDoc_DAL.Models;

namespace HalloDoc_MVC.Controllers
{
    public class Requests1Controller : Controller
    {
        private readonly ApplicationDbContext _context;

        public Requests1Controller(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Requests1
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Requests.Include(r => r.Physician).Include(r => r.User);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Requests1/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Requests == null)
            {
                return NotFound();
            }

            var request = await _context.Requests
                .Include(r => r.Physician)
                .Include(r => r.User)
                .FirstOrDefaultAsync(m => m.RequestId == id);
            if (request == null)
            {
                return NotFound();
            }

            return View(request);
        }

        // GET: Requests1/Create
        public IActionResult Create()
        {
            ViewData["PhysicianId"] = new SelectList(_context.Physicians, "PhysicianId", "BusinessName");
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "CreatedBy");
            return View();
        }

        // POST: Requests1/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("RequestId,RequestTypeId,UserId,FirstName,LastName,PhoneNumber,Email,Status,PhysicianId,ConfirmationNumber,CreatedDate,IsDeleted,ModifiedDate,DeclinedBy,IsUrgentEmailSent,LastWellnessDate,IsMobile,CallType,CompletedByPhysician,LastReservationDate,AcceptedDate,RelationName,CaseNumber,Ip,CaseTag,CaseTagPhysician,PatientAccountId,CreatedUserId")] Request request)
        {
            if (ModelState.IsValid)
            {
                _context.Add(request);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["PhysicianId"] = new SelectList(_context.Physicians, "PhysicianId", "BusinessName", request.PhysicianId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "CreatedBy", request.UserId);
            return View(request);
        }

        // GET: Requests1/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Requests == null)
            {
                return NotFound();
            }

            var request = await _context.Requests.FindAsync(id);
            if (request == null)
            {
                return NotFound();
            }
            ViewData["PhysicianId"] = new SelectList(_context.Physicians, "PhysicianId", "BusinessName", request.PhysicianId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "CreatedBy", request.UserId);
            return View(request);
        }

        // POST: Requests1/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("RequestId,RequestTypeId,UserId,FirstName,LastName,PhoneNumber,Email,Status,PhysicianId,ConfirmationNumber,CreatedDate,IsDeleted,ModifiedDate,DeclinedBy,IsUrgentEmailSent,LastWellnessDate,IsMobile,CallType,CompletedByPhysician,LastReservationDate,AcceptedDate,RelationName,CaseNumber,Ip,CaseTag,CaseTagPhysician,PatientAccountId,CreatedUserId")] Request request)
        {
            if (id != request.RequestId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(request);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!RequestExists(request.RequestId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["PhysicianId"] = new SelectList(_context.Physicians, "PhysicianId", "BusinessName", request.PhysicianId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "CreatedBy", request.UserId);
            return View(request);
        }

        // GET: Requests1/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Requests == null)
            {
                return NotFound();
            }

            var request = await _context.Requests
                .Include(r => r.Physician)
                .Include(r => r.User)
                .FirstOrDefaultAsync(m => m.RequestId == id);
            if (request == null)
            {
                return NotFound();
            }

            return View(request);
        }

        // POST: Requests1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Requests == null)
            {
                return Problem("Entity set 'ApplicationDbContext.Requests'  is null.");
            }
            var request = await _context.Requests.FindAsync(id);
            if (request != null)
            {
                _context.Requests.Remove(request);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool RequestExists(int id)
        {
          return (_context.Requests?.Any(e => e.RequestId == id)).GetValueOrDefault();
        }
    }
}
