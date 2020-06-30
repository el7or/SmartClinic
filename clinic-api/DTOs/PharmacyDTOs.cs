using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class PharmacyNewPrescriptionDTO
    {
        public int Id { get; set; }
        public string DoctorFullName { get; set; }
        public string PatientFullName { get; set; }
        public string Career { get; set; }
        public string Phone { get; set; }
        public string Phone2 { get; set; }
        public string City { get; set; }
        public DateTime CreatedOn { get; set; }
        public List<MedicinesPresc> MedicinesPresc { get; set; }
        public string Note { get; set; }
    }
    public class MedicinesPresc
    {
        public string Medicine { get; set; }
        public string Quantity { get; set; }
        public string Dose { get; set; }
        public string Timing { get; set; }
        public string Period { get; set; }
    }

    public class PutPrescriptionDTO
    {
        public int Id { get; set; }
        public bool? IsPharmacyDone { get; set; }
        public bool? IsPharmacyDelete { get; set; }
    }

    public class PharmacyPrevPrescriptionDTO
    {
        public int Id { get; set; }
        public string DoctorFullName { get; set; }
        public string PatientFullName { get; set; }
        public string Career { get; set; }
        public string Phone { get; set; }
        public string Phone2 { get; set; }
        public string City { get; set; }
        public DateTime CreatedOn { get; set; }
        public List<MedicinesPresc> MedicinesPresc { get; set; }
        public string Note { get; set; }
        public string Status { get; set; }
    }
}
