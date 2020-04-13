using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class PatientExamination
    {
        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public int ExaminationId { get; set; }
        public int? ExaminationAreaId { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual DoctorExaminationsValue Examination { get; set; }
        public virtual DoctorExaminationAreasValue ExaminationArea { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
