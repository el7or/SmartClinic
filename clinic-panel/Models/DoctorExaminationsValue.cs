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
    
    public partial class DoctorExaminationsValue
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DoctorExaminationsValue()
        {
            this.PatientExaminations = new HashSet<PatientExamination>();
        }
    
        public int Id { get; set; }
        public System.Guid DoctorId { get; set; }
        public string Examination { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.Guid CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public System.Guid UpdatedBy { get; set; }
    
        public virtual Doctor Doctor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PatientExamination> PatientExaminations { get; set; }
    }
}
