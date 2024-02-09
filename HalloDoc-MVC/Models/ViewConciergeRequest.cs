namespace HalloDoc_MVC.Models
{
    public class ViewConciergeRequest
    {
        public required string CFirstname { get; set; }

        public required string CLastname { get; set; }

        public required string CPhoneNumber { get; set; }

        public required string CEmail { get; set; }

        public required string Hotel { get; set; }

        public string? symptoms { get; set; }

        public required string FirstName { get; set; }

        public required string LastName { get; set; }

        public DateOnly DOB { get; set; }

        public required string Email { get; set; }

        public required string PhoneNumber { get; set; }

        public string? Room { get; set; }


        public string FullName => $"{CFirstname} {CLastname}";
    }
}
