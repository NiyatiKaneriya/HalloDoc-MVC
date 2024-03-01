using HalloDoc_DAL.ViewModels.PatientViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.Interfaces
{
    public interface IDashboardRepository
    {
        List<ViewDashboard> GetRequest(ViewDashboard viewDashboard, int UserID);
        List<ViewDashboard> GetDocuments(int? Requestid);
        Boolean UploadDocs(int Requestid, string Filename);


    }
}
