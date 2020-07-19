using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Models
{
    public class DoctorPharmacy
    {
        public Guid DoctorId { get; set; }
        public Guid PharmacyId { get; set; }
        public bool? IsDefault { get; set; }

        public virtual Doctor Doctor { get; set; }
        public virtual Pharmacy Pharmacy { get; set; }
    }
}
