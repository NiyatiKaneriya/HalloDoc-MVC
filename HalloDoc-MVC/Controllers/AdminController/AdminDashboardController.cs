using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using Humanizer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Net.Mail;
using System.Net;
using HalloDoc_DAL.ViewModels.PatientViewModels;
using MimeKit;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace HalloDoc_MVC.Controllers.AdminController
{
    public class AdminDashboardController : Controller
    {

        private readonly IRequestRepository _requestRepository;
        private readonly IActionRepository _actionRepository;
        private readonly SendEmailModel _emailConfig;
        public AdminDashboardController(IRequestRepository requestRepository, IActionRepository actionRepository,SendEmailModel emailConfig)
        {

            _requestRepository = requestRepository;
            _actionRepository = actionRepository;
            _emailConfig = emailConfig;
        }
        public async Task<IActionResult> Index()
        {

            ViewBag.NewCount = await _requestRepository.NewCount();
            ViewBag.ActiveCount = await _requestRepository.ActiveCount();
            ViewBag.PendingCount = await _requestRepository.PendingCount();
            ViewBag.ConcludeCount = await _requestRepository.ConcludeCount();
            ViewBag.ToCloseCount = await _requestRepository.ToCloseCount();
            ViewBag.UnpaidCount = await _requestRepository.UnpaidCount();
            ViewBag.CaseTagCombobox = await _actionRepository.CaseTagComboBox();
            ViewBag.RegionCombobox = await _actionRepository.RegionComboBox();

            ViewBag.PhysiciansByRegion = new SelectList(Enumerable.Empty<SelectListItem>());

            return View();
        }
        public async Task<IActionResult> GetRequestTable(int state, int requesttype)
        {
            List<ViewDashboradList> requestTableData = await _requestRepository.RequestTableAsync(state, requesttype);

            return PartialView("_DashboardTable", requestTableData);
        }
        public async Task<IActionResult> ViewCase(int requestclientid)
        {
            ViewCaseModel viewCaseModel = await _actionRepository.GetViewCase(requestclientid);

            return View("ViewCase", viewCaseModel);
        }
        public async Task<IActionResult> SaveViewCase(ViewCaseModel viewCaseModel)
        {
            await _actionRepository.SaveViewCase(viewCaseModel);

            return View("ViewCase");
        }
        public async Task<IActionResult> ViewNotes(int id)
        {
            ViewNotesModel viewNotesModel = await _actionRepository.GetViewNotes(id);

            return View("ViewNotes", viewNotesModel);
        }
        public async Task<IActionResult> SaveViewNotes(int? Requestid, string? AdminNotes, string? PhysicianNotes)
        {

            await _actionRepository.SaveViewNotes(Requestid, AdminNotes, PhysicianNotes);
            return RedirectToAction("ViewNotes", new { id = Requestid });


        }

        public async Task<IActionResult> CancelCase(int requestid, CancelCaseModel cancelCaseModel)
        {

            await _actionRepository.CancelCase(requestid, cancelCaseModel);
            return RedirectToAction("Index");

        }
        public IActionResult GetPhysicianByRegion(int regionid)
        {
            var PhysiciansByRegion = _actionRepository.GetPhysicianByRegion(regionid);

            return Json(PhysiciansByRegion);
        }
        public async Task<IActionResult> SaveAssignCase(int RequestId, AssignCaseModel assignCaseModel)
        {

            await _actionRepository.SaveAssignCase(RequestId, assignCaseModel);

            return RedirectToAction("Index");

        }
        public async Task<IActionResult> BlockCase(int RequestId, CancelCaseModel cancelCaseModel)
        {

            await _actionRepository.BlockCase(RequestId, cancelCaseModel);

            return RedirectToAction("Index");

        }
        public async Task<IActionResult> ViewUploads(int RequestId)
        {
            
            return View(await _actionRepository.GetUploadedDocuments(RequestId));
        }

        public IActionResult ViewUploadDoc(int Requestid, IFormFile file)
        {
            string UploadDoc;
            if (file != null)
            {
                string FilePath = "wwwroot\\UploadedFiles\\" + Requestid;
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string newfilename = $"{Path.GetFileNameWithoutExtension(file.FileName)}-{DateTime.Now.ToString("yyyyMMddhhmmss")}.{Path.GetExtension(file.FileName).Trim('.')}";

                string fileNameWithPath = Path.Combine(path, newfilename);
                UploadDoc = FilePath.Replace("wwwroot\\UploadedFiles\\", "/UploadedFiles/") + "/" + newfilename;
                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }

                _actionRepository.ViewUploadDocs(Requestid, UploadDoc);

                return RedirectToAction("ViewUploads", new { Requestid = Requestid });

            }
            else
            {
                return BadRequest("No file Provided for upload");
            }
        }
        public IActionResult DeleteDoc(int Requestid, int RequestWiseFileId) 
        {
            _actionRepository.DeleteDoc(Requestid, RequestWiseFileId);
            return RedirectToAction("ViewUploads", new { Requestid = Requestid });
        }
        public IActionResult DeleteDocs(int Requestid, List<int> fileIds)
        {
            foreach (var fileId in fileIds)
            {
                _actionRepository.DeleteDoc(Requestid, fileId);
            }
            return RedirectToAction("ViewUploads", new { Requestid = Requestid });
        }
        public IActionResult SendFiles(string email, List<string> files, int RequestId)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(_emailConfig.From);
            message.Subject = "Find Files in Attechment";
            message.To.Add(new MailAddress(email));
            foreach (var file in files)
            {
                
               message.Attachments.Add(new Attachment(Directory.GetCurrentDirectory() + "\\wwwroot\\UploadedFiles" + file.Replace("UploadedFiles/", "").Replace("/", "\\")) );
            }
            
            message.IsBodyHtml = true;
            using (var smtpClient = new SmtpClient(_emailConfig.SmtpServer))
            {
                smtpClient.Port = 587;
                smtpClient.Credentials = new NetworkCredential(_emailConfig.Username, _emailConfig.Password);
                smtpClient.EnableSsl = true;

                smtpClient.Send(message);
            }

            return RedirectToAction("ViewUploads", new { Requestid = RequestId });
        }
    }
}
