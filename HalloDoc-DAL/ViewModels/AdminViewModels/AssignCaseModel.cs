using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class AssignCaseModel
    {
        [Required]
        public int? RegionId { get; set; }
        public int RequestId { get; set; }
        [Required]
        public int? PhysicianId { get; set; }
        [Required]
        public string? Notes { get; set; }
        [Required]
        public string? RegionName { get; set; }


    }
}
