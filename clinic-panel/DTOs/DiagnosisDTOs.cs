using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class DiagnosisDoctorDTO
    {
        public Guid DoctorId { get; set; }
        public List<DiagnosisName> DiagnosisNames { get; set; }
    }
    public class DiagnosisName
    {
        public int Id { get; set; }
        public string Diagnosis { get; set; }
    }

    public class DiagnosisCreateDTO
    {
        public Guid DoctorId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Diagnosis { get; set; }
    }
}