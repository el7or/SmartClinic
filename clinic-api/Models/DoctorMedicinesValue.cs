﻿using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class DoctorMedicinesValue
    {
        public Guid DoctorId { get; set; }
        public int MedicineId { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual Doctor Doctor { get; set; }
        public virtual SysMedicinesValue Medicine { get; set; }
    }
}
