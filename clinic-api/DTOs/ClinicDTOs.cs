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

    public class ClinicPutDTO
    {
        public Guid ClinicId { get; set; }
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
