using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class PatientDiagnosis
    {
        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public int DiagnosisId { get; set; }
        public int? GradeId { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual DoctorDiagnosisValue Diagnosis { get; set; }
        public virtual SysDiseaseGradesValue Grade { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
