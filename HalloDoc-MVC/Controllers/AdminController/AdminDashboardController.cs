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
using Org.BouncyCastle.Asn1.Ocsp;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Drawing.Printing;
using HalloDoc_MVC.Models.CV;
using Rotativa.AspNetCore;

namespace HalloDoc_MVC.Controllers.AdminController
{
    [CustomAuthorize("Admin")]
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
            ViewBag.ProfessionComboBox = await _actionRepository.ProfessionComboBox();
            ViewBag.PhysiciansByRegion = new SelectList(Enumerable.Empty<SelectListItem>());
            ViewBag.HealthProfessional = new SelectList(Enumerable.Empty<SelectListItem>());
            return View();
        }
      
        public async Task<IActionResult> GetRequestTable(int state, int requesttype)
        {
             List<ViewDashboradList> requestTableData = await _requestRepository.RequestTable(state, requesttype);
            
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
        public async Task<IActionResult> Orders(int? requestid)
        {
            ViewBag.ProfessionComboBox = await _actionRepository.ProfessionComboBox();
            
            ViewBag.HealthProfessional =new SelectList(Enumerable.Empty<SelectListItem>());
            OrdersModel ordersModel = new OrdersModel();
                ordersModel.RequestId = requestid;
            return View();  
        }
        public IActionResult GetHealthProfessional(int Profession)
        {
            var HealthProfessional = _actionRepository.GetHealthProfessional(Profession);

            return Json(HealthProfessional);
        }
        public async Task<IActionResult> GetOrder(int vendorId)
        {
            OrdersModel ordersModel = await _actionRepository.GetOrder(vendorId);

            return Json(ordersModel);
        }
        public async Task<IActionResult> SaveOrdersAsync(OrdersModel ordersModel, int RequestId)
        {

            ViewBag.ProfessionComboBox = await _actionRepository.ProfessionComboBox();

            ViewBag.HealthProfessional = new SelectList(Enumerable.Empty<SelectListItem>());
            if (ordersModel != null) {
                _actionRepository.SaveOrders(ordersModel, RequestId);
            }
            //OrdersModel ordersModel1 = new OrdersModel();
            //ordersModel1.RequestId = RequestId;

            return RedirectToAction("Index","AdminDashboard");
        }
        public  IActionResult TransferCase(int RequestId, AssignCaseModel assignCaseModel)
        {

            _actionRepository.TransferCase(RequestId, assignCaseModel);

            return RedirectToAction("Index");

        }
        public IActionResult ClearCase(int RequestId)
        {
            _actionRepository.ClearCase(RequestId);
            return View("Index");
        }
        public IActionResult EncounterForm(int Requestid)
        {
            var FormDetails = _actionRepository.GetEncounterForm(Requestid);
            //when is finalize is true then physician cant see the form again
            if (FormDetails.IsFinalize == true)
            {
                return PartialView("_EncounterPOPUP");
            }
            else
            {
                return View(FormDetails);
            }
            //return PartialView("_EncounterPOPUP");

        }
        public IActionResult SaveEncounterForm(int Requestid, EncounterModel model)
        {
            _actionRepository.EncounterForm(Requestid, model );

            return RedirectToAction("EncounterForm",new {Requestid = Requestid});
        }
        public IActionResult Finalize(int Requestid, EncounterModel model)
        {
            _actionRepository.Finalize(Requestid, model);

            return RedirectToAction("Index");
        }
        public async Task<IActionResult> CloseCaseAsync(int Requestid)
        {
            return View(await _actionRepository.GetUploadedDocuments(Requestid));
        }
        public async Task<IActionResult> SaveCloseCase(ViewUploadsModel model)
        {
            await _actionRepository.SaveCloseCase(model);

            return View("CloseCase");
        }
        public async Task<IActionResult> ClosePatientCase(int Requestid)
        {
            if(await _actionRepository.ClosePatientCase(Requestid))
            {
                return RedirectToAction("Index");
            }
            else { return RedirectToAction("CloseCase"); }
        }
        public IActionResult generatePDF(int Requestid)
        {
            var FormDetails = _actionRepository.GetEncounterForm(Requestid);
            return new ViewAsPdf("DownLoad", FormDetails);
        }
    }
}
