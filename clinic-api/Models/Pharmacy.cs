using clinic_api.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Models
{
    public class Pharmacy
    {
        public Pharmacy()
        {
            PatientPrescriptions = new HashSet<PatientPrescription>();
            Doctors = new HashSet<Doctor>();
        }
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public string PharmacyName { get; set; }
        public string PharmacistName { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        [StringLength(256)]
        public string Phone1 { get; set; }

        [StringLength(256)]
        public string Phone2 { get; set; }

        [StringLength(256)]
        public string WhatsApp { get; set; }

        [StringLength(256)]
        public string Email { get; set; }

        public string Address { get; set; }

        public virtual ApplicationUser User { get; set; }
        public virtual ICollection<PatientPrescription> PatientPrescriptions { get; set; }
        public virtual ICollection<Doctor> Doctors { get; set; }
    }
}
