namespace HalloDoc_DAL.ViewModels.PatientViewModels
{
    public class ViewBusinessPartnerRequest
    {
        public required string BPFirstname { get; set; }

        public required string BPLastname { get; set; }

        public required string BPPhoneNumber { get; set; }

        public required string BPEmail { get; set; }
        public string? confirmationNumber { get; set; }
        public required string Business { get; set; }

        public string? CaseNumber { get; set; }

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

        public string FullName => $"{BPFirstname} {BPLastname}";
    }
}
