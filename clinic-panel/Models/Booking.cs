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
    
    public partial class Booking
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Booking()
        {
            this.BookingPayments = new HashSet<BookingPayment>();
            this.ClinicServices = new HashSet<ClinicService>();
        }
    
        public int Id { get; set; }
        public System.Guid PatientId { get; set; }
        public System.DateTime BookingDateTime { get; set; }
        public int TypeId { get; set; }
        public Nullable<int> DiscountId { get; set; }
        public Nullable<int> DaySeqNo { get; set; }
        public Nullable<bool> IsAttend { get; set; }
        public Nullable<System.DateTime> AttendanceTime { get; set; }
        public Nullable<bool> IsEnter { get; set; }
        public Nullable<System.DateTime> EntryTime { get; set; }
        public Nullable<bool> IsFinish { get; set; }
        public Nullable<System.DateTime> FinishTime { get; set; }
        public Nullable<bool> IsCanceled { get; set; }
        public Nullable<System.DateTime> CanceledOn { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.Guid CreatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public System.Guid UpdatedBy { get; set; }
        public System.Guid DoctorId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingPayment> BookingPayments { get; set; }
        public virtual ClinicBookingType ClinicBookingType { get; set; }
        public virtual ClinicDiscount ClinicDiscount { get; set; }
        public virtual Patient Patient { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClinicService> ClinicServices { get; set; }
        public virtual Doctor Doctor { get; set; }
    }
}
