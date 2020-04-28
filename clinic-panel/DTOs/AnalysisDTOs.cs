using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class AnalysisDoctorDTO
    {
        public Guid DoctorId { get; set; }
        public List<AnalysisName> AnalysisNames { get; set; }
    }
    public class AnalysisName
    {
        public int Id { get; set; }
        public string Analysis { get; set; }
    }

    public class AnalysisCreateDTO
    {
        public Guid DoctorId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Analysis { get; set; }
    }
}