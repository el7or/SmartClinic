using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class BookingPayment
    {
        public int Id { get; set; }
        public int BookingId { get; set; }
        public decimal Paid { get; set; }
        public DateTime? NextPaymentDate { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual Booking Booking { get; set; }
    }
}
