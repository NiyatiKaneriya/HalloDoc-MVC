namespace HalloDoc_MVC.Models
{
    public class ViewDashboard
    {
        public int RequestId { get; set; }
        public int? Status { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? FileCount { get; set; }
        public string? Filename { get; set; }
        public IFormFile? file { get; set; }
    }
}
