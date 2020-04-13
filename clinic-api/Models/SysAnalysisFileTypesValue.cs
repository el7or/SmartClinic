using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysAnalysisFileTypesValue
    {
        public SysAnalysisFileTypesValue()
        {
            PatientAnalysisFiles = new HashSet<PatientAnalysisFile>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<PatientAnalysisFile> PatientAnalysisFiles { get; set; }
    }
}
