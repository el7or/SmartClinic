using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Models
{
    public partial class Patient
    {
        public Patient()
        {
            Bookings = new HashSet<Booking>();
            PatientAnalysis = new HashSet<PatientAnalysis>();
            PatientDetailedComplaints = new HashSet<PatientDetailedComplaint>();
            PatientDiagnosis = new HashSet<PatientDiagnosis>();
            PatientDiseases = new HashSet<PatientDisease>();
            PatientExaminations = new HashSet<PatientExamination>();
            PatientGeneralComplaints = new HashSet<PatientGeneralComplaint>();
            PatientOperations = new HashSet<PatientOperation>();
            PatientPrescriptions = new HashSet<PatientPrescription>();
            PatientRays = new HashSet<PatientRay>();
            PatientPhysicalTherapies = new HashSet<PatientPhysicalTherapy>();
            PatientReferrals = new HashSet<PatientReferral>();
        }

        public Guid Id { get; set; }
        public Guid DoctorId { get; set; }
        public Guid ClinicId { get; set; }
        public int SeqNo { get; set; }
        public string FullName { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        [StringLength(256)]
        public string Phone { get; set; }

        [StringLength(256)]
        public string Phone2 { get; set; }
        public int? Age { get; set; }
        public bool? Gender { get; set; }
        public int? SocialStatusId { get; set; }
        public string Career { get; set; }
        public int? GovernorateId { get; set; }
        public int? CityId { get; set; }
        public string Note { get; set; }
        public int? Children { get; set; }
        public int? PrevMarriages { get; set; }
        public int? PrevMarriagesPartner { get; set; }
        public string TreatmentHistory { get; set; }
        public string FamilyHistory { get; set; }
        public decimal? Weight { get; set; }
        public decimal? Length { get; set; }
        public decimal? BodyMass { get; set; }
        public int? BloodPressureId { get; set; }
        public decimal? Temperature { get; set; }

        public virtual SysBloodPressureValue BloodPressure { get; set; }
        public virtual SysCitiesValue City { get; set; }
        public virtual Clinic Clinic { get; set; }
        public virtual Doctor Doctor { get; set; }
        public virtual SysGovernoratesValue Governorate { get; set; }
        public virtual SysSocialStatusValue SocialStatus { get; set; }
        public virtual ICollection<Booking> Bookings { get; set; }
        public virtual ICollection<PatientAnalysis> PatientAnalysis { get; set; }
        public virtual ICollection<PatientDetailedComplaint> PatientDetailedComplaints { get; set; }
        public virtual ICollection<PatientDiagnosis> PatientDiagnosis { get; set; }
        public virtual ICollection<PatientDisease> PatientDiseases { get; set; }
        public virtual ICollection<PatientExamination> PatientExaminations { get; set; }
        public virtual ICollection<PatientGeneralComplaint> PatientGeneralComplaints { get; set; }
        public virtual ICollection<PatientOperation> PatientOperations { get; set; }
        public virtual ICollection<PatientPrescription> PatientPrescriptions { get; set; }
        public virtual ICollection<PatientRay> PatientRays { get; set; }
        public virtual ICollection<PatientPhysicalTherapy> PatientPhysicalTherapies { get; set; }
        public virtual ICollection<PatientReferral> PatientReferrals { get; set; }
    }
}
