//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace clinic_panel.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PatientAnalysisFile
    {
        public int Id { get; set; }
        public int PatientAnalysisId { get; set; }
        public int FileTypeId { get; set; }
        public string Note { get; set; }
        public string Url { get; set; }
        public string UrlPublicId { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.Guid CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public System.Guid UpdatedBy { get; set; }
    
        public virtual PatientAnalysi PatientAnalysi { get; set; }
        public virtual SysAnalysisFileTypesValue SysAnalysisFileTypesValue { get; set; }
    }
}
