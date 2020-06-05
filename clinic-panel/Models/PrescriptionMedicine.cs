//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace clinic_panel.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class PrescriptionMedicine
    {
        public int PrescriptionId { get; set; }
        public int MedicineId { get; set; }
        public Nullable<int> DoseId { get; set; }
        public Nullable<int> TimingId { get; set; }
        public Nullable<int> PeriodId { get; set; }
        public Nullable<int> QuantityId { get; set; }
    
        public virtual PatientPrescription PatientPrescription { get; set; }
        public virtual SysMedicineDosesValue SysMedicineDosesValue { get; set; }
        public virtual SysMedicinePeriodsValue SysMedicinePeriodsValue { get; set; }
        public virtual SysMedicineQuantityValue SysMedicineQuantityValue { get; set; }
        public virtual SysMedicinesValue SysMedicinesValue { get; set; }
        public virtual SysMedicineTimingsValue SysMedicineTimingsValue { get; set; }
    }
}
