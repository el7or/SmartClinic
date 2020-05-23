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
    
    public partial class PatientDetailedComplaint
    {
        public int Id { get; set; }
        public System.Guid PatientId { get; set; }
        public int DetailedComplaintId { get; set; }
        public Nullable<int> ComplaintChoiceId { get; set; }
        public string Period { get; set; }
        public string Note { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.Guid CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public System.Guid UpdatedBy { get; set; }
    
        public virtual DoctorComplaintChoicesValue DoctorComplaintChoicesValue { get; set; }
        public virtual DoctorDetailedComplaintsValue DoctorDetailedComplaintsValue { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
