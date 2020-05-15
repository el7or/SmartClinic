using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class PatientPrescription
    {
        public PatientPrescription()
        {
            PrescriptionMedicines = new HashSet<PrescriptionMedicine>();
        }
        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }
        public bool? IsPrint { get; set; }

        public virtual Patient Patient { get; set; }
        public virtual ICollection<PrescriptionMedicine> PrescriptionMedicines { get; set; }
    }
}
