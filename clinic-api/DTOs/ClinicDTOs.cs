using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class ClinicGetBookingSettingDTO
    {
        public int? EntryOrderId { get; set; }
        public int? BookingPeriod { get; set; }
        public int? ConsultExpiration { get; set; }
        public bool? IsAllDaysOn { get; set; }
        public int[] WorkDays { get; set; }
        public int[] WeekEnds { get; set; }
        public bool? IsAllDaysSameTime { get; set; }
        public DateTime? AllDaysTimeFrom { get; set; }
        public DateTime? AllDaysTimeTo { get; set; }
        public bool IsSaturdayOn { get; set; }
        public DateTime? SaturdayTimeFrom { get; set; }
        public DateTime? SaturdayTimeTo { get; set; }
        public bool IsSundayOn { get; set; }
        public DateTime? SundayTimeFrom { get; set; }
        public DateTime? SundayTimeTo { get; set; }
        public bool IsMondayOn { get; set; }
        public DateTime? MondayTimeFrom { get; set; }
        public DateTime? MondayTimeTo { get; set; }
        public bool IsTuesdayOn { get; set; }
        public DateTime? TuesdayTimeFrom { get; set; }
        public DateTime? TuesdayTimeTo { get; set; }
        public bool IsWednesdayOn { get; set; }
        public DateTime? WednesdayTimeFrom { get; set; }
        public DateTime? WednesdayTimeTo { get; set; }
        public bool IsThursdayOn { get; set; }
        public DateTime? ThursdayTimeFrom { get; set; }
        public DateTime? ThursdayTimeTo { get; set; }
        public bool IsFridayOn { get; set; }
        public DateTime? FridayTimeFrom { get; set; }
        public DateTime? FridayTimeTo { get; set; }
    }

    public class ClinicGetPricesSettingDTO
    {
        public List<BookingType> BookingTypes { get; set; }
        public List<ServiceType> ServiceTypes { get; set; }
        public List<DiscountType> DiscountTypes { get; set; }
    }
    public class BookingType
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public decimal? Price { get; set; }
    }
    public class ServiceType
    {
        public int Id { get; set; }
        public string Service { get; set; }
        public decimal? Price { get; set; }
    }
    public class DiscountType
    {
        public int Id { get; set; }
        public string Discount { get; set; }
        public decimal? Price { get; set; }
        public bool? IsPercent { get; set; }
    }

    public class ClinicGetPrintSettingDTO
    {
        public string DoctorName { get; set; }
        public string DoctorDegree { get; set; }
        public string ClinicTitle { get; set; }
        public string LogoUrl { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public string Phone3 { get; set; }
    }

    public class ClinicPostPrintSettingDTO
    {
        public Guid DoctorId { get; set; }
        public IFormFile File { get; set; }
        public string DoctorName { get; set; }
        public string DoctorDegree { get; set; }
        public string ClinicTitle { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public string Phone3 { get; set; }
    }

    public class ClinicPutPrintSettingDTO
    {
        public Guid DoctorId { get; set; }
        public string DoctorName { get; set; }
        public string DoctorDegree { get; set; }
        public string ClinicTitle { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public string Phone3 { get; set; }
    }

    public class ClinicPutBookingSettingDTO
    {
        public Guid DoctorId { get; set; }
        public int? EntryOrderId { get; set; }
        public int? BookingPeriod { get; set; }
        public int? ConsultExpiration { get; set; }
        public bool? IsAllDaysOn { get; set; }
        public string WorkDays { get; set; }
        public bool? IsAllDaysSameTime { get; set; }
        public DateTime? AllDaysTimeFrom { get; set; }
        public DateTime? AllDaysTimeTo { get; set; }
        public DateTime? SaturdayTimeFrom { get; set; }
        public DateTime? SaturdayTimeTo { get; set; }
        public DateTime? SundayTimeFrom { get; set; }
        public DateTime? SundayTimeTo { get; set; }
        public DateTime? MondayTimeFrom { get; set; }
        public DateTime? MondayTimeTo { get; set; }
        public DateTime? TuesdayTimeFrom { get; set; }
        public DateTime? TuesdayTimeTo { get; set; }
        public DateTime? WednesdayTimeFrom { get; set; }
        public DateTime? WednesdayTimeTo { get; set; }
        public DateTime? ThursdayTimeFrom { get; set; }
        public DateTime? ThursdayTimeTo { get; set; }
        public DateTime? FridayTimeFrom { get; set; }
        public DateTime? FridayTimeTo { get; set; }
    }

}
