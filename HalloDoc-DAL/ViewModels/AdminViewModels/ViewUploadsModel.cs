using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class ViewUploadsModel
    {
        [Required]
        public string? FirstName { get; set; }
        [Required]
        public string? LastName { get; set; }
        public string? ConfirmationNumber { get; set; }
        public int RequestId { get; set; }
        public string RequestClientId { get; set; }
        [Required]
        [EmailAddress]
        public string? Email {  get; set; }
        [Required]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$", ErrorMessage = "Invalid phone number")]
        public string? Phone { get; set; }
        public DateOnly? DOB { get; set; }
        public List<Documents>? DocumentsList { get; set; }

        public class Documents
        {
            public string Uploader { get; set; }
            public int Status { get; set; }
            public string FileName { get; set; }
            public DateTime CreatedDate { get; set; }
            public int RequestWiseFileId { get; set; }
            public BitArray? IsDeleted { get; set; }
        }

    }
}
