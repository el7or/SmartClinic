using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Models
{
    public partial class PatientDetailedComplaint
    {
        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public int ComplaintChoiceId { get; set; }

        [StringLength(256)]
        public string Period { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual DoctorComplaintChoicesValue ComplaintChoice { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
