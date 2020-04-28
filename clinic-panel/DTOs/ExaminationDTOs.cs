using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class ExaminationDoctorDTO
    {
        public Guid DoctorId { get; set; }
        public List<ExaminationType> ExaminationTypes { get; set; }
        public List<ExaminationArea> ExaminationAreas { get; set; }
    }
    public class ExaminationType
    {
        public int Id { get; set; }
        public string Examination { get; set; }
    }
    public class ExaminationArea
    {
        public int Id { get; set; }
        public string Area { get; set; }
    }

    public class ExaminationCreateTypeDTO
    {
        public Guid DoctorId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Examination { get; set; }
    }

    public class ExaminationCreateAreaDTO
    {
        public Guid DoctorId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Area { get; set; }
    }
}