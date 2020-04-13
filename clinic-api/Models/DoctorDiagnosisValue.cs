using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class DoctorDiagnosisValue
    {
        public DoctorDiagnosisValue()
        {
            PatientDiagnosis = new HashSet<PatientDiagnosis>();
        }

        public int Id { get; set; }
        public Guid DoctorId { get; set; }
        public string Diagnosis { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual Doctor Doctor { get; set; }
        public virtual ICollection<PatientDiagnosis> PatientDiagnosis { get; set; }
    }
}
