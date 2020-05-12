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
        public bool? IsCanceled { get; set; }
    }
    public class BookingBrief
    {
        public int BookId { get; set; }
        public DateTime Time { get; set; }
        public string Type { get; set; }
    }

    public class BookingGetChangeDateDTO
    {
        public DateTime? ClinicDayTimeFrom { get; set; }
        public DateTime? ClinicDayTimeTo { get; set; }
        public List<BookingBrief> DoctorAllBookingSameDay { get; set; }
    }

    public class BookingPostDTO
    {
        public Guid PatientId { get; set; }
        public Guid DoctorId { get; set; }
        public DateTime BookingDateTime { get; set; }
        public int TypeId { get; set; }
        public int[] ServicesIds { get; set; }
        public int DiscountId { get; set; }
        public decimal Paid { get; set; }
    }

    public class BookingPutDTO
    {
        public int BookingId { get; set; }
        public DateTime BookingDateTime { get; set; }
        public int TypeId { get; set; }
        public int[] ServicesIds { get; set; }
        public int DiscountId { get; set; }
        public decimal Paid { get; set; }
    }

    public class GetPatientBookingDTO
    {
        public int BookId { get; set; }
        public DateTime Date { get; set; }
        public string Type { get; set; }
        public string[] Servcies { get; set; }
        public bool? IsEnter { get; set; }
        public bool? IsCanceled { get; set; }
    }
    
    public class GetBookingsDTO
    {

    }
}
