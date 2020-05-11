using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class BookingGetDTO
    {
        public BookingSetting BookingSetting { get; set; }
        public BookingDetails BookingDetails { get; set; }
    }
    public class BookingSetting
    {
        public string PatientName { get; set; }
        public string PatientLastBookingType { get; set; }
        public DateTime? PatientLastBookingDate { get; set; }
        public int[] ClinicWeekEnds { get; set; }
        public int? ClinicBookingPeriod { get; set; }
        public int? ClinicConsultExpiration { get; set; }
        public DateTime? ClinicDayTimeFrom { get; set; }
        public DateTime? ClinicDayTimeTo { get; set; }
        public List<BookingType> ClinicBookingTypes { get; set; }
        public List<ServiceType> ClinicBookingServices { get; set; }
        public List<DiscountType> ClinicBookingDiscounts { get; set; }
        public List<BookingBrief> DoctorAllBookingSameDay { get; set; }
    }
    public class BookingDetails
    {
        public DateTime BookingDateTime { get; set; }
        public int BookingTypeId { get; set; }
        public int[] BookingServicesIds { get; set; }
        public int? BookingDiscountId { get; set; }
        public decimal BookingPayments { get; set; }
    }
    public class BookingBrief
    {
        public int BookId { get; set; }
        public DateTime Time { get; set; }
        public string Type { get; set; }
    }
}
