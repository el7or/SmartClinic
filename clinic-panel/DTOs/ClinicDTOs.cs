using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class ClinicIndexDTO
    {
        public Guid Id { get; set; }
        public string ClinicName { get; set; }
        public List<string> Doctors { get; set; }
        public List<string> Employees { get; set; }
    }
    public class ClinicAddDoctorDTO
    {
        public Guid ClinicId { get; set; }
        public Guid UserId { get; set; }

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

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public int SpecialtyId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public Guid PharmacyId { get; set; }

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

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public int PlanId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal Paid { get; set; }
        public string SubsNote { get; set; }
        public string PayNote { get; set; }
    }
    public class ClinicAddEmployeeDTO
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
    public class ClinicPriceDTO
    {
        public Guid? Id { get; set; }
        public List<BookingTypePrice> BookingTypePrices { get; set; }
        public List<ServicePrice> ServicePrices { get; set; }
        public List<DiscountPrice> DiscountPrices { get; set; }
    }
    public class BookingTypePrice
    {
        public int Id { get; set; }
        public string Type { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        public decimal? Price { get; set; }
    }
    public class ServicePrice
    {
        public int Id { get; set; }
        public string Service { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        public decimal? Price { get; set; }
    }
    public class DiscountPrice
    {
        public int Id { get; set; }
        public string Discount { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        public decimal? Price { get; set; }
        public bool? IsPercent { get; set; }
    }

    public class ClinicCreateBookingTypeDTO
    {
        public Guid ClinicId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Type { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal? Price { get; set; }
    }

    public class ClinicCreateServiceDTO
    {
        public Guid ClinicId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Service { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal? Price { get; set; }
    }

    public class ClinicCreateDiscountDTO
    {
        public Guid ClinicId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Discount { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal? Price { get; set; }

        public bool? IsPercent { get; set; }
    }
}