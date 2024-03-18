using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HalloDoc_DAL.ViewModels.AdminViewModels
{
    public class OrdersModel
    {
        [Required]
        public int Profession { get; set; }
        public int Id { get; set; }
        [Required]
        public int? VendorId { get; set; }
        [Required]
        public string? VendorName { get; set; }

        public int? RequestId { get; set; }

        [StringLength(50)]
        public string? FaxNumber { get; set; }
        [Required]
        [StringLength(50)]
        public string? Email { get; set; }
        [Required]
        [StringLength(100)]
        public string? BusinessContact { get; set; }

        public string? Prescription { get; set; }

        public int? NoOfRefill { get; set; }

        [Column(TypeName = "timestamp without time zone")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(100)]
        public string? CreatedBy { get; set; }
    }
}
