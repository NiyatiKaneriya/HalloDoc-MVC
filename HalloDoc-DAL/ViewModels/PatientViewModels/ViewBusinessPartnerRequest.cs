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

        public DateOnly DOB { get; set; }
        [Required]
        [EmailAddress]
        public required string Email { get; set; }
        [Required]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$", ErrorMessage = "Invalid phone number")]
        public required string PhoneNumber { get; set; }
        [Required]
        public required string Street { get; set; }
        [Required]
        public required string City { get; set; }
        [Required]
        public required string State { get; set; }
        [Required]
        [RegularExpression(@"^\d{5}(?:[-\s]\d{4})?$", ErrorMessage = "Invalid zip code")]
        public required string Zipcode { get; set; }

        public string? Room { get; set; }

        public string FullName => $"{BPFirstname} {BPLastname}";
    }
}
