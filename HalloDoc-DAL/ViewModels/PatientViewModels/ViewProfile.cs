namespace HalloDoc_DAL.ViewModels.PatientViewModels
{
    public class ViewProfile
    {
        public int? UserId { get; set; }
        public required string FirstName { get; set; }
        public required string LastName { get; set; }

        public DateTime DOB { get; set; }

        public string? PhoneNumber { get; set; }

        public required string Email { get; set; }

        public required string Street { get; set; }

        public required string City { get; set; }

        public required string State { get; set; }

        public required string ZipCode { get; set; }


    }

}
