using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class AssignCaseModel
    {
        public int? RegionId { get; set; }
        public int RequestId { get; set; }

        public int? PhysicianId { get; set; }

        public string? Notes { get; set; }

        public string? RegionName { get; set; }


    }
}
