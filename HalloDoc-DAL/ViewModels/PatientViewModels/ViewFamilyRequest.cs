using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace HalloDoc_DAL.ViewModels.PatientViewModels
{
    public class ViewFamilyRequest
    {
        [Required]
        public required string FFirstname { get; set; }
        [Required]
        public required string FLastname { get; set; }
        [Required]
         
        public required string FPhoneNumber { get; set; }
        [Required]
        [EmailAddress]
        public required string FEmail { get; set; }
        public string? confirmationNumber { get; set; }
        [Required]
        public string? symptoms { get; set; }
        [Required]
        public required string FirstName { get; set; }
        [Required]
        public required string LastName { get; set; }

        public DateOnly DOB { get; set; }
        [Required]
        [EmailAddress]
        public required string Email { get; set; }
        [Required]
         
        public required string PhoneNumber { get; set; }
        [Required]
        public required string Street { get; set; }
        [Required]
        public required string City { get; set; }
    
        public string? State { get; set; }
        public int RegionId { get; set; }
        [Required]
         
        public required string Zipcode { get; set; }
        
        public string? Room { get; set; }

        public IFormFile? UploadFile { get; set; }
        public string? UploadImage { get; set; }
    }
}
