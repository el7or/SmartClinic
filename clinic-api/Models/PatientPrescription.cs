using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class PatientPrescription
    {
        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public int MedicineId { get; set; }
        public int? ConcentrationId { get; set; }
        public int? FormId { get; set; }
        public int? DoseId { get; set; }
        public int? TimingId { get; set; }
        public int? PeriodId { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }
        public bool? IsPrint { get; set; }

        public virtual SysMedicineConcentrationsValue Concentration { get; set; }
        public virtual SysMedicineDosesValue Dose { get; set; }
        public virtual SysMedicineFormsValue Form { get; set; }
        public virtual DoctorMedicinesValue Medicine { get; set; }
        public virtual Patient Patient { get; set; }
        public virtual SysMedicinePeriodsValue Period { get; set; }
        public virtual SysMedicineTimingsValue Timing { get; set; }
    }
}
