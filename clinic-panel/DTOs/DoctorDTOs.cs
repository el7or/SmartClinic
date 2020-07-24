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
        public Guid ClinicId { get; set; }
        public string FullName { get; set; }
        public string Specialty { get; set; }
        public string Plan { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime StartPlanDate { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime EndPlanDate { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        public int SubscriptionDue { get; set; }
        public int UsersCount { get; set; }
        public int ClinicsCount { get; set; }
        public int PatientsCount { get; set; }
        public string IsActive { get; set; }
    }
    public class DoctorCreateUserDTO
    {
        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        public string UserName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        public string RoleName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        public string FullName { get; set; }
    }
    public class DoctorCreateDTO
    {
        public Guid UserId { get; set; }
        public string FullName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public int SpecialtyId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string Phone1 { get; set; }

        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string Phone2 { get; set; }

        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string Phone3 { get; set; }

        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string WhatsApp { get; set; }

        [EmailAddress(ErrorMessage = "لابد من إدخال بريد إلكتروني صحيح !")]
        public string Email1 { get; set; }

        [EmailAddress(ErrorMessage = "لابد من إدخال بريد إلكتروني صحيح !")]
        public string Email2 { get; set; }

        [Url(ErrorMessage = "لابد من إدخال رابط صحيح !")]
        public string Facebook { get; set; }

        [Url(ErrorMessage = "لابد من إدخال رابط صحيح !")]
        public string Twitter { get; set; }

        [Url(ErrorMessage = "لابد من إدخال رابط صحيح !")]
        public string LinkedIn { get; set; }

        [Url(ErrorMessage = "لابد من إدخال رابط صحيح !")]
        public string Instagram { get; set; }
    }
    public class DoctorCreateSubsDTO
    {
        public Guid UserId { get; set; }
        public Guid DoctorId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public int PlanId { get; set; }
        public int? SignUpFee { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal Paid { get; set; }
        public DateTime? NextPaymentDate { get; set; }
        public string SubsNote { get; set; }
        public string PayNote { get; set; }
    }
    public class DoctorCreateClinicDTO
    {
        public Guid UserId { get; set; }
        public Guid DoctorId { get; set; }
        public string ClinicName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public int? EntryOrderId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "لابد من إدخال رقم صحيح !")]
        public int? BookingPeriod { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "لابد من إدخال رقم صحيح !")]
        public int? ConsultExpiration { get; set; }

        public string PrintDoctorName { get; set; }
        public string PrintDoctorDegree { get; set; }
        public string PrintClinicName { get; set; }
        public string PrintAddress1 { get; set; }
        public string PrintAddress2 { get; set; }
        public string PrintAddress3 { get; set; }
        public string PrintPhone1 { get; set; }
        public string PrintPhone2 { get; set; }
        public string PrintPhone3 { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal? DiagnosePrice { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal? ConsultPrice { get; set; }
    }
    public class DoctorDetailsDTO
    {
        public Guid DoctorId { get; set; }
        public Guid ClinicId { get; set; }
        public string FullName { get; set; }
        public string Specialty { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public string Phone3 { get; set; }
        public string WhatsApp { get; set; }
        public string Email1 { get; set; }
        public string Email2 { get; set; }
        public string Facebook { get; set; }
        public string Twitter { get; set; }
        public string LinkedIn { get; set; }
        public string Instagram { get; set; }
        public string Plan { get; set; }
        public string SubsNote { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        public int SignUpFee { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        public int Paid { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime? NextPaymentDate { get; set; }
        public string PayNote { get; set; }
        public string ClinicName { get; set; }
        public string EntryOrder { get; set; }
        public int? BookingPeriod { get; set; }
        public int? ConsultExpiration { get; set; }
        public string PrintDoctorName { get; set; }
        public string PrintDoctorDegree { get; set; }
        public string PrintClinicName { get; set; }
        public string PrintAddress1 { get; set; }
        public string PrintAddress2 { get; set; }
        public string PrintAddress3 { get; set; }
        public string PrintPhone1 { get; set; }
        public string PrintPhone2 { get; set; }
        public string PrintPhone3 { get; set; }
    }
    public class DoctorAddUserDTO
    {
        public Guid ClinicId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        public string UserName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        public string RoleName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        public string FullName { get; set; }
    }
    public class DoctorAddPaymentDTO
    {
        public int SubscriptionId { get; set; }
        public int Due { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal Paid { get; set; }
        public DateTime? NextPaymentDate { get; set; }
        public string Note { get; set; }
    }

    public class DoctorEditDTO
    {
        public Guid DoctorId { get; set; }
        public Guid ClinicId { get; set; }
        public string FullName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public int SpecialtyId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string Phone1 { get; set; }

        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string Phone2 { get; set; }

        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string Phone3 { get; set; }

        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string WhatsApp { get; set; }

        [EmailAddress(ErrorMessage = "لابد من إدخال بريد إلكتروني صحيح !")]
        public string Email1 { get; set; }

        [EmailAddress(ErrorMessage = "لابد من إدخال بريد إلكتروني صحيح !")]
        public string Email2 { get; set; }

        [Url(ErrorMessage = "لابد من إدخال رابط صحيح !")]
        public string Facebook { get; set; }

        [Url(ErrorMessage = "لابد من إدخال رابط صحيح !")]
        public string Twitter { get; set; }

        [Url(ErrorMessage = "لابد من إدخال رابط صحيح !")]
        public string LinkedIn { get; set; }

        [Url(ErrorMessage = "لابد من إدخال رابط صحيح !")]
        public string Instagram { get; set; }
        
        public string ClinicName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public int? EntryOrderId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "لابد من إدخال رقم صحيح !")]
        public int? BookingPeriod { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "لابد من إدخال رقم صحيح !")]
        public int? ConsultExpiration { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string PrintDoctorName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string PrintDoctorDegree { get; set; }
        public string PrintClinicName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string PrintAddress1 { get; set; }
        public string PrintAddress2 { get; set; }
        public string PrintAddress3 { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string PrintPhone1 { get; set; }
        public string PrintPhone2 { get; set; }
        public string PrintPhone3 { get; set; }
    }
}