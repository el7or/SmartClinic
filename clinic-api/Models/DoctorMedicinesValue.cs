﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Models
{
    public class DoctorMedicinesValue
    {
        public DoctorMedicinesValue()
        {
            PrescriptionMedicines = new HashSet<PrescriptionMedicine>();
        }

        public int Id { get; set; }
        public Guid DoctorId { get; set; }

        [StringLength(256)]
        public string MedicineName { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual Doctor Doctor { get; set; }
        public virtual ICollection<PrescriptionMedicine> PrescriptionMedicines { get; set; }
    }
}