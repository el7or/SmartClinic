using System;
using System.Collections.Generic;

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
            PatientReferrals = new HashSet<PatientReferral>();
            Patients = new HashSet<Patient>();
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
        public string PatientRecordSections { get; set; }
        public string DiseasesQuestions { get; set; }

        public virtual SysDoctorsSpecialty Specialty { get; set; }
        public virtual ICollection<DoctorAnalysisValue> DoctorAnalysisValues { get; set; }
        public virtual ICollection<DoctorClinic> DoctorClinics { get; set; }
        public virtual ICollection<DoctorDetailedComplaintsValue> DoctorDetailedComplaintsValues { get; set; }
        public virtual ICollection<DoctorDiagnosisValue> DoctorDiagnosisValues { get; set; }
        public virtual ICollection<DoctorExaminationAreasValue> DoctorExaminationAreasValues { get; set; }
        public virtual ICollection<DoctorExaminationsValue> DoctorExaminationsValues { get; set; }
        public virtual ICollection<DoctorGeneralComplaintsValue> DoctorGeneralComplaintsValues { get; set; }
        public virtual ICollection<DoctorMedicinesValue> DoctorMedicinesValues { get; set; }
        public virtual ICollection<DoctorOperationTypesValue> DoctorOperationTypesValues { get; set; }
        public virtual ICollection<DoctorRayAreasValue> DoctorRayAreasValues { get; set; }
        public virtual ICollection<DoctorRaysValue> DoctorRaysValues { get; set; }
        public virtual ICollection<PatientReferral> PatientReferrals { get; set; }
        public virtual ICollection<Patient> Patients { get; set; }
    }
}
