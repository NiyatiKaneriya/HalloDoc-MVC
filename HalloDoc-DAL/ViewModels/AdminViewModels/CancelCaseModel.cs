using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class CancelCaseModel
    {
        public int Requestid { get; set; }
        //public int Status { get; set; }
        public int AdminId { get; set; }
        [Required]
        public string Notes { get; set; }
        [Required]
        public int ReasonId { get; set; }
        [Required]
        public string ReasonTag { get; set; }
    }
}
