using Microsoft.AspNetCore.Mvc;

namespace HalloDoc_MVC.Models
{
    public class ViewPatientRequest
    {
        public string? symptoms { get; set; }

        public required string FirstName { get; set; }

        public required string LastName { get; set; }

        public DateTime DOB { get; set; }

        public required string Email { get; set;}

        public required string PhoneNumber { get; set;}

        public string? Relation {  get; set;}

        public string? Password { get; set;}

        public required string Street { get; set;}

        public required string City { get; set;}

        public required string State { get; set;}

        public required string Zipcode { get; set;}

        public string? Room { get; set;}

        public IFormFile? UploadFile { get; set; }
        public string? UploadImage { get; internal set; }

        
    }
}
