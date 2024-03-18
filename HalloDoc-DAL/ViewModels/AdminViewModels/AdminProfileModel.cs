using HalloDoc_DAL.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class AdminProfileModel
    {
        [Required]
        public string UserName { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public int status { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$", ErrorMessage = "Invalid phone number")]
        public string PhoneNumber { get; set; }
        [Required]
        public string ConfirmedEmail { get; set; }
        [Required]
        public string Address1 { get; set; }

        public string Address2 { get; set; }
        [Required]
        public string city { get; set; }
        [Required]
        public string state { get; set; }
        [Required]
        [RegularExpression(@"^\d{5}(?:[-\s]\d{4})?$", ErrorMessage = "Invalid zip code")]
        public string zipcode { get; set; }
        [RegularExpression(@"^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$", ErrorMessage = "Invalid phone number")]
        public string altPhone { get; set; }
        [Required]
        public string? RoleId { get; set; }

        public int AdminId { get; set; }

        public string Aspnetuserid { get; set; }

        public object Createdby { get; set; }

        public int? Regionid { get; set; }

        public DateTime? Modifieddate { get; set; }

        public string? Modifiedby { get; set; }

        public DateTime Createddate { get; set; }
        [Required]
        public string? Regionsid { get; set; }
        [Required]
        public List<Regions>? Regionids { get; set; }

        public class Regions
        {
            public int? Regionid {  get; set; }
            public string Regionname { get; set; }
        }
    }
}
