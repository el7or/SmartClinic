using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class PatientAnalysis
    {
        public PatientAnalysis()
        {
            PatientAnalysisFiles = new HashSet<PatientAnalysisFile>();
        }

        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public int AnalysisId { get; set; }
        public string RequestNote { get; set; }
        public bool? IsHasResult { get; set; }
        public DateTime? ResultDate { get; set; }
        public string ResultText { get; set; }
        public int? ResultGradeId { get; set; }
        public string ResultNote { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual DoctorAnalysisValue Analysis { get; set; }
        public virtual Patient Patient { get; set; }
        public virtual SysDiseaseGradesValue ResultGrade { get; set; }
        public virtual ICollection<PatientAnalysisFile> PatientAnalysisFiles { get; set; }
    }
}
