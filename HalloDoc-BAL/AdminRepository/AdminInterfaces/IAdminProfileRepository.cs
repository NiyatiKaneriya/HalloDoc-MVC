using HalloDoc_DAL.ViewModels.AdminViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_BAL.AdminRepository.AdminInterfaces
{
    public interface IAdminProfileRepository
    {
        public AdminProfileModel getProfileData(string id);
        public List<RoleComboBox> RoleComboBox();
        public bool ResetPasswordProfile(string id, string Password);
        public bool EditAdminInfo(AdminProfileModel model, string id);
        public bool EditBillingInfo(AdminProfileModel model, string id);
        //public bool CheckCheckbox(int value, string id);

        //public bool UnCheckCheckbox(int value, string id);

    }
}
