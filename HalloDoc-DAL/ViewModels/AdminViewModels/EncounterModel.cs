using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class EncounterModel
    {
        [Required]
        public string? FirstName { get; set; }
        [Required]
        public string? LastName { get; set; }

        public string? Location { get; set; }

        public DateTime? DOB { get; set; }

        public DateTime? DateOfService { get; set; }
        [Required]
        public string? Phone { get; set; }
        [Required]
        public string? Email { get; set; }

        public int EncounterFormId { get; set; }

        public int? RequestId { get; set; }
        [Required]
        public string? HistoryOfPresentIllnessOrInjury { get; set; }
        [Required]
        public string? MedicalHistory { get; set; }
        [Required]
        public string? Medications { get; set; }

        public string? Allergies { get; set; }
        [Required]
        public string? Temp { get; set; }
        [Required]
        public string? Hr { get; set; }
        [Required]
        public string? Rr { get; set; }
        [Required]
        public string? BloodPressureSystolic { get; set; }
        [Required]
        public string? BloodPressureDiastolic { get; set; }
        [Required]
        public string? O2 { get; set; }

        public string? Pain { get; set; }

        public string? Heent { get; set; }        

        public string? Cv { get; set; }

        public string? Chest { get; set; }        

        public string? Abd { get; set; }

        public string? Extremeties { get; set; }

        public string? Skin { get; set; }

        public string? Neuro { get; set; }

        public string? Other { get; set; }
        [Required]
        public string? Diagnosis { get; set; }
        [Required]
        public string? TreatmentPlan { get; set; }
        [Required]
        public string? MedicationsDispensed { get; set; }
        [Required]
        public string? Procedures { get; set; }
        [Required]
        public string? FollowUp { get; set; }

        public int? AdminId { get; set; }

        public int? PhysicianId { get; set; }

        public bool IsFinalize { get; set; }

    }
}
