using HalloDoc_BAL.AdminRepository.AdminInterfaces;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace HalloDoc_MVC.Controllers.AdminController
{
    public class AdminDashboardController : Controller
    {

        private readonly IRequestRepository _requestRepository;
        private readonly IActionRepository _actionRepository;
        public AdminDashboardController(IRequestRepository requestRepository, IActionRepository actionRepository)
        {

            _requestRepository = requestRepository;
            _actionRepository = actionRepository;
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
    }
}
