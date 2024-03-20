using System.ComponentModel.DataAnnotations;

namespace HalloDoc_DAL.ViewModels.PatientViewModels
{
    public class ViewBusinessPartnerRequest
    {
        [Required]
        public required string BPFirstname { get; set; }
        [Required]
        public required string BPLastname { get; set; }
        [Required]
        public required string BPPhoneNumber { get; set; }
        [Required]
        [EmailAddress]
        public required string BPEmail { get; set; }
        public string? confirmationNumber { get; set; }
        [Required]
        public required string Business { get; set; }

        public string? CaseNumber { get; set; }
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

        public string FullName => $"{BPFirstname} {BPLastname}";
    }
}
