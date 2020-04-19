using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class DoctorIndexDTO
    {
        public Guid Id { get; set; }
        public string FullName { get; set; }
        public string Specialty { get; set; }
        public string Plan { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime StartPlanDate { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime EndPlanDate { get; set; }
        public int UsersCount { get; set; }
        public int ClinicsCount { get; set; }
        public int PatientsCount { get; set; }
        public string IsActive { get; set; }
    }
}