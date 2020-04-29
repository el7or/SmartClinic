using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

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

        [StringLength(256)]
        public string Value { get; set; }

        [StringLength(256)]
        public string Text { get; set; }

        public virtual ICollection<PatientAnalysis> PatientAnalysis { get; set; }
        public virtual ICollection<PatientDiagnosis> PatientDiagnosis { get; set; }
        public virtual ICollection<PatientRay> PatientRays { get; set; }
    }
}
