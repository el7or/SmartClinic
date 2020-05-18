using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class PatientReferral
    {
        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public Guid ReferralToDoctorId { get; set; }
        public int? PatientDiagnosisId { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }
        public bool? IsRead { get; set; }
        public DateTime? ReadOn { get; set; }
        public bool? IsApproved { get; set; }
        public DateTime? ApprovedOn { get; set; }
        public bool? IsCanceled { get; set; }
        public DateTime? CanceledOn { get; set; }

        public virtual Patient Patient { get; set; }
        public virtual Doctor ReferralToDoctor { get; set; }
        public virtual PatientDiagnosis PatientDiagnosis { get; set; }
    }
}
