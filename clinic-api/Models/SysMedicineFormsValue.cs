using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysMedicineFormsValue
    {
        public SysMedicineFormsValue()
        {
            PatientPrescriptions = new HashSet<PatientPrescription>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<PatientPrescription> PatientPrescriptions { get; set; }
    }
}
