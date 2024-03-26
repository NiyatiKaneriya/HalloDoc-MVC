using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class EditCreatePhysician
    {
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
        public string PhoneNumber { get; set; }
        public string MedicalLicense { get; set; }
        public string NPINumber { get; set; }
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
        public string zipcode { get; set; }

        public string altPhone { get; set; }
        [Required]
        public int? RoleId { get; set; }

        public int PhysicianId { get; set; }

        public string Aspnetuserid { get; set; }

        public object Createdby { get; set; }

        public int? Regionid { get; set; }

        public DateTime? Modifieddate { get; set; }

        public string? Modifiedby { get; set; }
    
        public DateTime Createddate { get; set; }
        public string BusinessName { get; set; }
        public string BusinessWebsite { get; set; }
        public string adminNotes { get; set; }
        [Required]
        public string? Regionsid { get; set; }
        [Required]
        public List<Regions>? Regionids { get; set; }

        public class Regions
        {
            public int? Regionid { get; set; }
            public string Regionname { get; set; }
        }

        public IFormFile? UploadFilePhoto { get; set; }
        public IFormFile? UploadFileIndependentContractor {  get; set; }
        public IFormFile? UploadFileBackgroundcheck { get; set; }
        public IFormFile? UploadFileHIPPA { get; set; }
        public IFormFile? UploadFileNondisclouser { get; set; }
        public IFormFile? UploadFileLicense { get; set; }
        public string? UploadImagePhoto { get; set; }
        public string? UploadImageIndependentContractor { get; set; }
        public string? UploadImageBackgroundcheck { get; set; }
        public string? UploadImageHIPPA { get; set; }
        public string? UploadImageNondisclouser { get; set; }
        public string? UploadImageLicense { get; set; }
  
    }
}
