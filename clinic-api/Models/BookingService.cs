using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class BookingService
    {
        public int BookingId { get; set; }
        public int ServiceId { get; set; }

        public virtual Booking Booking { get; set; }
        public virtual DoctorService Service { get; set; }
    }
}
