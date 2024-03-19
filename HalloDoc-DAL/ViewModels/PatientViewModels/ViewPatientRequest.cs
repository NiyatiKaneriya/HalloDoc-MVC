using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace HalloDoc_DAL.ViewModels.PatientViewModels
{
    public class ViewPatientRequest
    {
        [Required]
        public string? symptoms { get; set; }
        [Required]
        public required string FirstName { get; set; }
        [Required]
        public required string LastName { get; set; }
        public string? confirmationNumber { get; set; }

        public DateTime DOB { get; set; }
        [Required]
        [EmailAddress]
        public required string Email { get; set; }
        [Required]
         
        public required string PhoneNumber { get; set; }

        public string? Relation { get; set; }
        
        public string? Password { get; set; }
        [Required]
        public required string Street { get; set; }
        [Required]
        public required string City { get; set; }
        [Required]
        public required string State { get; set; }
        public int RegionId { get; set; }
        [Required]
         
        public required string Zipcode { get; set; }

        public string? Room { get; set; }

        public IFormFile? UploadFile { get; set; }
        public string? UploadImage { get; set; }


    }
}
