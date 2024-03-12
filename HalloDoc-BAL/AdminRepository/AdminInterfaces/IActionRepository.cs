using HalloDoc_DAL.Models;
using HalloDoc_DAL.ViewModels.AdminViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.AdminRepository.AdminInterfaces
{
    public interface IActionRepository
    {
        public Task<ViewCaseModel> GetViewCase(int requestclientid);
        public Task<bool> SaveViewCase(ViewCaseModel viewCase);
        public Task<ViewNotesModel> GetViewNotes(int requestid);
        public Task<bool> SaveViewNotes(int? Requestid, string? AdminNotes, string? PhysicianNotes);
        public Task<bool> CancelCase(int RequestId, CancelCaseModel cancelCaseModel);
        public Task<List<CaseTagComboBox>> CaseTagComboBox();
        public Task<List<RegionComboBox>> RegionComboBox();     
        public List<Physician> GetPhysicianByRegion(int RegionId);
        public Task<bool> SaveAssignCase(int RequestId, AssignCaseModel assignCaseModel);
        public Task<bool> BlockCase(int RequestId, CancelCaseModel cancelCaseModel);
        public Task<ViewUploadsModel> GetUploadedDocuments(int RequestId);
        public Boolean ViewUploadDocs(int Requestid, string Filename);
        public Boolean DeleteDoc(int Requestid, int RequestWiseFileId);
        public Task<List<ProfessionComboBox>> ProfessionComboBox();
        public List<HealthProfessional> GetHealthProfessional(int HealthProfessionalId);
        public Task<OrdersModel> GetOrder(int vendorId);
        public Task<bool> SaveOrders(OrdersModel ordersModel, int RequestId);
        public bool TransferCase(int RequestId, AssignCaseModel assignCaseModel);
        public bool ClearCase(int RequestId);
        public bool Accept(int RequestId);
        public bool CancelAgreement(int RequestId, string Notes);
        public bool IsAgreementValid(int RequestId);





    }
}
