using System.ComponentModel.DataAnnotations;

namespace HalloDoc_DAL.ViewModels.PatientViewModels
{
    public class ViewConciergeRequest
    {
        [Required]
        public required string CFirstname { get; set; }
        [Required]
        public required string CLastname { get; set; }
        [Required]
        public required string CPhoneNumber { get; set; }
        [Required]
        [EmailAddress]
        public required string CEmail { get; set; }
        public string? confirmationNumber { get; set; }
        [Required]
        public required string Hotel { get; set; }
        [Required]
        public required string Street { get; set; }
        [Required]
        public required string City { get; set; }
        [Required]
        public required string State { get; set; }
        public int RegionId { get; set; }
        [Required]
         
        public required string Zipcode { get; set; }
        [Required]
        public string? symptoms { get; set; }
        [Required]
        public required string FirstName { get; set; }
        [Required]
        public required string LastName { get; set; }
        
        public DateTime DOB { get; set; }
        [Required]
        [EmailAddress]
        public required string Email { get; set; }
        [Required]
         
        public required string PhoneNumber { get; set; }

        public string? Room { get; set; }


        public string FullName => $"{CFirstname} {CLastname}";
    }
}
