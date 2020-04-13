using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class PatientAnalysisFile
    {
        public int Id { get; set; }
        public int PatientAnalysisId { get; set; }
        public int FileTypeId { get; set; }
        public string Note { get; set; }
        public string Url { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual SysAnalysisFileTypesValue FileType { get; set; }
        public virtual PatientAnalysis PatientAnalysis { get; set; }
    }
}
