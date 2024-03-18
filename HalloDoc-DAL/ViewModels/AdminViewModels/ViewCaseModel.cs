using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class ViewCaseModel
    {
        [Required]
        public string PatientF { get; set; }
        [Required]
        public string? PatientL { get; set; }
    
        public DateOnly? DOB { get; set; }
        [Required]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$", ErrorMessage = "Invalid phone number")]
        public string Phone { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        
        public short Status { get; set; }
        [Required]
        public string Region { get; set; }
        [Required]
        public string? Notes { get; set; }
        [Required]
        public string? Address { get; set; }


        public int RequestTypeId { get; set; }
        public int RequestId { get; set; }

        public int RequestClientId { get; set; }

        public int state
        {
            get
            {
                switch (Status) // Use the db status here
                {
                    case 1:
                        return 1;
                    case 2:
                        return 2;
                    case 3:
                        return 5;
                    case 7:
                        return 5;
                    case 8:
                        return 5;
                    case 4:
                        return 3;
                    case 5:
                        return 3;
                    case 6:
                        return 4;
                    case 9:
                        return 6;
                    default:
                        return 0;
                }
            }
            set { Status = (short)value; } // Set the db status here
        }


    }
}
