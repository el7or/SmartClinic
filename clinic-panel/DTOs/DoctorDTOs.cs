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
    public class DoctorCreateUserDTO
    {
        [Required(ErrorMessage ="لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        public string UserName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        public string Password { get; set; }
        public string RoleName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        public string FullName { get; set; }
    }
}