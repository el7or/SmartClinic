using clinic_api.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Models
{
    public partial class Doctor
    {
        public Doctor()
        {
            DoctorAnalysisValues = new HashSet<DoctorAnalysisValue>();
            DoctorClinics = new HashSet<DoctorClinic>();
            DoctorDetailedComplaintsValues = new HashSet<DoctorDetailedComplaintsValue>();
            DoctorDiagnosisValues = new HashSet<DoctorDiagnosisValue>();
            DoctorExaminationAreasValues = new HashSet<DoctorExaminationAreasValue>();
            DoctorExaminationsValues = new HashSet<DoctorExaminationsValue>();
            DoctorGeneralComplaintsValues = new HashSet<DoctorGeneralComplaintsValue>();
            DoctorMedicinesValues = new HashSet<DoctorMedicinesValue>();
            DoctorOperationTypesValues = new HashSet<DoctorOperationTypesValue>();
            DoctorRayAreasValues = new HashSet<DoctorRayAreasValue>();
            DoctorRaysValues = new HashSet<DoctorRaysValue>();
            DoctorPhysicalTherapyAreaValues = new HashSet<DoctorPhysicalTherapyAreaValue>();
            DoctorPhysicalTherapiesValues = new HashSet<DoctorPhysicalTherapyValue>();
            PatientReferrals = new HashSet<PatientReferral>();
            Patients = new HashSet<Patient>();
            Bookings = new HashSet<Booking>();
            DoctorExpenses = new HashSet<DoctorExpense>();
            DoctorBookingTypes = new HashSet<DoctorBookingType>();
            DoctorDiscounts = new HashSet<DoctorDiscount>();
            DoctorServices = new HashSet<DoctorService>();
        }

        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public int SpecialtyId { get; set; }
        public string FullName { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        [StringLength(50)]
        public string PatientRecordSections { get; set; }

        [StringLength(50)]
        public string DiseasesQuestions { get; set; }

        [StringLength(256)]
        public string Phone1 { get; set; }

        [StringLength(256)]
        public string Phone2 { get; set; }

        [StringLength(256)]
        public string Phone3 { get; set; }

        [StringLength(256)]
        public string WhatsApp { get; set; }

        [StringLength(256)]
        public string Email1 { get; set; }

        [StringLength(256)]
        public string Email2 { get; set; }

        [StringLength(256)]
        public string Facebook { get; set; }

        [StringLength(256)]
        public string Twitter { get; set; }

        [StringLength(256)]
        public string LinkedIn { get; set; }

        [StringLength(256)]
        public string Instagram { get; set; }
        public int? EntryOrderId { get; set; }
        public int? BookingPeriod { get; set; }
        public int? ConsultExpiration { get; set; }
        public string PrintDoctorName { get; set; }
        public string PrintDoctorDegree { get; set; }
        public string PrintClinicName { get; set; }
        public string PrintLogoUrl { get; set; }
        public string PrintLogoPublicId { get; set; }
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

        public virtual ApplicationUser User { get; set; }
        public virtual SysDoctorsSpecialty Specialty { get; set; }
        public virtual SysEntryOrderValue EntryOrder { get; set; }
        public virtual ICollection<DoctorAnalysisValue> DoctorAnalysisValues { get; set; }
        public virtual ICollection<DoctorClinic> DoctorClinics { get; set; }
        public virtual ICollection<DoctorPharmacy> DoctorPharmacies { get; set; }
        public virtual ICollection<DoctorDetailedComplaintsValue> DoctorDetailedComplaintsValues { get; set; }
        public virtual ICollection<DoctorDiagnosisValue> DoctorDiagnosisValues { get; set; }
        public virtual ICollection<DoctorExaminationAreasValue> DoctorExaminationAreasValues { get; set; }
        public virtual ICollection<DoctorExaminationsValue> DoctorExaminationsValues { get; set; }
        public virtual ICollection<DoctorGeneralComplaintsValue> DoctorGeneralComplaintsValues { get; set; }
        public virtual ICollection<DoctorMedicinesValue> DoctorMedicinesValues { get; set; }
        public virtual ICollection<DoctorOperationTypesValue> DoctorOperationTypesValues { get; set; }
        public virtual ICollection<DoctorRayAreasValue> DoctorRayAreasValues { get; set; }
        public virtual ICollection<DoctorRaysValue> DoctorRaysValues { get; set; }
        public virtual ICollection<DoctorPhysicalTherapyAreaValue> DoctorPhysicalTherapyAreaValues { get; set; }
        public virtual ICollection<DoctorPhysicalTherapyValue> DoctorPhysicalTherapiesValues { get; set; }
        public virtual ICollection<PatientReferral> PatientReferrals { get; set; }
        public virtual ICollection<Patient> Patients { get; set; }
        public virtual ICollection<Booking> Bookings { get; set; }
        public virtual ICollection<DoctorExpense> DoctorExpenses { get; set; }
        public virtual ICollection<DoctorExpenseItemValue> DoctorExpenseItems { get; set; }
        public virtual ICollection<DoctorBookingType> DoctorBookingTypes { get; set; }
        public virtual ICollection<DoctorDiscount> DoctorDiscounts { get; set; }
        public virtual ICollection<DoctorService> DoctorServices { get; set; }
    }
}
