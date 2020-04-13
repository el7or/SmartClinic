using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysDiseaseGradesValue
    {
        public SysDiseaseGradesValue()
        {
            PatientAnalysis = new HashSet<PatientAnalysis>();
            PatientDiagnosis = new HashSet<PatientDiagnosis>();
            PatientRays = new HashSet<PatientRay>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<PatientAnalysis> PatientAnalysis { get; set; }
        public virtual ICollection<PatientDiagnosis> PatientDiagnosis { get; set; }
        public virtual ICollection<PatientRay> PatientRays { get; set; }
    }
}
