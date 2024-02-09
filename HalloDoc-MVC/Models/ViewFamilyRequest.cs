namespace HalloDoc_MVC.Models
{
    public class ViewFamilyRequest
    {
        public required string FFirstname { get; set; }

        public required string FLastname { get; set; }

        public required string FPhoneNumber { get; set; }

        public required string FEmail { get; set; }
      
        public string? symptoms { get; set; }

        public required string FirstName { get; set; }

        public required string LastName { get; set; }

        public DateOnly DOB { get; set; }

        public required string Email { get; set; }

        public required string PhoneNumber { get; set; }

        public required string Street { get; set; }

        public required string City { get; set; }

        public required string State { get; set; }

        public required string Zipcode { get; set; }

        public string? Room { get; set; }
    }
}
