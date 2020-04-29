using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Models
{
    public partial class Clinic
    {
        public Clinic()
        {
            ClinicBookingTypes = new HashSet<ClinicBookingType>();
            ClinicDiscounts = new HashSet<ClinicDiscount>();
            ClinicServices = new HashSet<ClinicService>();
            ClinicUsers = new HashSet<ClinicUser>();
            DoctorClinics = new HashSet<DoctorClinic>();
            Patients = new HashSet<Patient>();
        }

        public Guid Id { get; set; }
        public string ClinicName { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }
        public int? EntryOrderId { get; set; }
        public int? BookingPeriod { get; set; }
        public int? ConsultExpiration { get; set; }
        public string PrintDoctorName { get; set; }
        public string PrintDoctorDegree { get; set; }
        public string PrintClinicName { get; set; }
        public string PrintLogoUrl { get; set; }
        public string PrintAddress1 { get; set; }
        public string PrintAddress2 { get; set; }
        public string PrintAddress3 { get; set; }

        [StringLength(256)]
        public string PrintPhone1 { get; set; }

        [StringLength(256)]
        public string PrintPhone2 { get; set; }

        [StringLength(256)]
        public string PrintPhone3 { get; set; }
        public bool? IsAllDaysOn { get; set; }

        [StringLength(50)]
        public string WorkDays { get; set; }
        public bool? IsAllDaysSameTime { get; set; }
        public DateTime? AllDaysTimeFrom { get; set; }
        public DateTime? AllDaysTimeTo { get; set; }
        public DateTime? SaturdayTimeFrom { get; set; }
        public DateTime? SundayTimeFrom { get; set; }
        public DateTime? MondayTimeFrom { get; set; }
        public DateTime? TuesdayTimeFrom { get; set; }
        public DateTime? WednesdayTimeFrom { get; set; }
        public DateTime? ThursdayTimeFrom { get; set; }
        public DateTime? FridayTimeFrom { get; set; }
        public DateTime? SaturdayTimeTo { get; set; }
        public DateTime? SundayTimeTo { get; set; }
        public DateTime? MondayTimeTo { get; set; }
        public DateTime? TuesdayTimeTo { get; set; }
        public DateTime? WednesdayTimeTo { get; set; }
        public DateTime? ThursdayTimeTo { get; set; }
        public DateTime? FridayTimeTo { get; set; }

        public virtual SysEntryOrderValue EntryOrder { get; set; }
        public virtual ICollection<ClinicBookingType> ClinicBookingTypes { get; set; }
        public virtual ICollection<ClinicDiscount> ClinicDiscounts { get; set; }
        public virtual ICollection<ClinicService> ClinicServices { get; set; }
        public virtual ICollection<ClinicUser> ClinicUsers { get; set; }
        public virtual ICollection<DoctorClinic> DoctorClinics { get; set; }
        public virtual ICollection<Patient> Patients { get; set; }
    }
}
