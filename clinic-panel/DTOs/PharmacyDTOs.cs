using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class PharmacyIndexDTO
    {
        public Guid Id { get; set; }
        public string PharmacyName { get; set; }
        public string PharmacistName { get; set; }
        public string Phone1 { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime StartSubscriptionDate { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime EndSubscriptionDate { get; set; }

        public int SubscriptionsCount { get; set; }
        public int SubscriptionsPaid { get; set; }
        public string IsActive { get; set; }
    }

    public class PharmacyCreateDTO
    {
        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        public string UserName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز !", MinimumLength = 6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string PharmacyName { get; set; }
        public string PharmacistName { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string Phone1 { get; set; }

        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string Phone2 { get; set; }

        [MinLength(11, ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        [RegularExpression(@"^\+?\d*$", ErrorMessage = "لابد من إدخال رقم هاتف صحيح !")]
        public string WhatsApp { get; set; }

        [EmailAddress(ErrorMessage = "لابد من إدخال بريد إلكتروني صحيح !")]
        public string Email { get; set; }
        public string Address { get; set; }

        public string Plan { get; set; }
        public int SignUpFee { get; set; }
        public DateTime SubsStartDate { get; set; }
        public string SubsNote { get; set; }
    }
    public class PharmacyAccountDTO
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string RoleName { get; set; }
        public string FullName { get; set; }
    }
}