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
    
    public partial class SysDiseaseGradesValue
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SysDiseaseGradesValue()
        {
            this.PatientAnalysis = new HashSet<PatientAnalysi>();
            this.PatientDiagnosis = new HashSet<PatientDiagnosi>();
            this.PatientRays = new HashSet<PatientRay>();
        }
    
        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PatientAnalysi> PatientAnalysis { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PatientDiagnosi> PatientDiagnosis { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PatientRay> PatientRays { get; set; }
    }
}
