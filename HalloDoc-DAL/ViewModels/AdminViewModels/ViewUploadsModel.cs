using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class ViewUploadsModel
    {
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? ConfirmationNumber { get; set; }
        public int RequestId { get; set; }
        public string RequestClientId { get; set; }
        public string? Email {  get; set; }
        public string? Phone {  get; set; }
        public List<Documents>? DocumentsList { get; set; }

        public class Documents
        {
            public string Uploader { get; set; }
            public int Status { get; set; }
            public string FileName { get; set; }
            public DateTime CreatedDate { get; set; }
            public int RequestWiseFileId { get; set; }
        }

    }
}
