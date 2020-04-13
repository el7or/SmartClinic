using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class Booking
    {
        public Booking()
        {
            BookingPayments = new HashSet<BookingPayment>();
            BookingServices = new HashSet<BookingService>();
        }

        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public DateTime BookingDateTime { get; set; }
        public int TypeId { get; set; }
        public int? DiscountId { get; set; }
        public int? DaySeqNo { get; set; }
        public bool? IsAttend { get; set; }
        public DateTime? AttendanceTime { get; set; }
        public bool? IsEnter { get; set; }
        public DateTime? EntryTime { get; set; }
        public bool? IsFinish { get; set; }
        public DateTime? FinishTime { get; set; }
        public bool? IsCanceled { get; set; }
        public DateTime? CanceledOn { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual ClinicDiscount Discount { get; set; }
        public virtual Patient Patient { get; set; }
        public virtual ClinicBookingType Type { get; set; }
        public virtual ICollection<BookingPayment> BookingPayments { get; set; }
        public virtual ICollection<BookingService> BookingServices { get; set; }
    }
}
