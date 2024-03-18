using HalloDoc_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class AdminProfileModel
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int status { get; set; }
       
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string ConfirmedEmail { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string zipcode { get; set; }
        public string altPhone { get; set; }
        public string? RoleId { get; set; }
        public int AdminId { get; set; }
        public string Aspnetuserid { get; set; }
        public object Createdby { get; set; }
        public int? Regionid { get; set; }
        public DateTime? Modifieddate { get; set; }
        public string? Modifiedby { get; set; }
        public DateTime Createddate { get; set; }
        public string? Regionsid { get; set; }
        public List<Regions>? Regionids { get; set; }
        public class Regions
        {
            public int? Regionid {  get; set; }
            public string Regionname { get; set; }
        }
    }
}
