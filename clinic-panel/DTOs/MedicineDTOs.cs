﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class MedicineDTOs
    {
    }
    public class MedicineIndexDTO
    {
        //public List<MedicineName> MedicineNames { get; set; }
        public List<MedicineQuantity> MedicineQuantities { get; set; }
        public List<MedicineDose> MedicineDoses { get; set; }
        public List<MedicineTiming> MedicineTimings { get; set; }
        public List<MedicinePeriod> MedicinePeriods { get; set; }
    }
    //public class MedicineName
    //{
    //    public int Id { get; set; }
    //    public string Text { get; set; }
    //}
    public class MedicineQuantity
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class MedicineDose
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class MedicineTiming
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class MedicinePeriod
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }

    public class MedicinesDoctorDTO
    {
        public Guid DoctorId { get; set; }
        public List<MedicineDoctor> Medicines { get; set; }
    }
    public class MedicineDoctor
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public bool IsChecked { get; set; }
    }
}