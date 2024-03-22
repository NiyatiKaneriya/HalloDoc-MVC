using System.ComponentModel.DataAnnotations;

namespace HalloDoc_DAL.ViewModels.PatientViewModels
{
    public class ViewProfile
    {
        public int? UserId { get; set; }
        [Required]
        public required string FirstName { get; set; }
        [Required]
        public required string LastName { get; set; }

        public string? confirmationNumber { get; set; }

        public DateTime DOB { get; set; }
        [Required]
         
        public string? PhoneNumber { get; set; }
        [Required]
        [EmailAddress]
        public required string Email { get; set; }
        [Required]
        public required string Street { get; set; }
        [Required]
        public required string City { get; set; }
        
        public string? State { get; set; }
        public int? RegionId { get; set; }
        [Required]
         
        public required string ZipCode { get; set; }


    }

}
