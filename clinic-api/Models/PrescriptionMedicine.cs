using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Models
{
    public partial class PrescriptionMedicine
    {
        public int PrescriptionId { get; set; }
        public int MedicineId { get; set; }
        public int? QuantityId { get; set; }
        public int? DoseId { get; set; }
        public int? TimingId { get; set; }
        public int? PeriodId { get; set; }

        public virtual PatientPrescription Prescription { get; set; }
        public virtual SysMedicineDosesValue Dose { get; set; }
        public virtual SysMedicineQuantityValue Quantity { get; set; }
        public virtual SysMedicinesValue Medicine { get; set; }
        public virtual SysMedicinePeriodsValue Period { get; set; }
        public virtual SysMedicineTimingsValue Timing { get; set; }
    }
}
