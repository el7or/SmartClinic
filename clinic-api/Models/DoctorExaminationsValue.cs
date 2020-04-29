﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Models
{
    public partial class DoctorExaminationsValue
    {
        public DoctorExaminationsValue()
        {
            PatientExaminations = new HashSet<PatientExamination>();
        }

        public int Id { get; set; }
        public Guid DoctorId { get; set; }

        [StringLength(256)]
        public string Examination { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual Doctor Doctor { get; set; }
        public virtual ICollection<PatientExamination> PatientExaminations { get; set; }
    }
}
