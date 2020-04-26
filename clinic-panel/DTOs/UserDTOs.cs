using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class UserIndexDTO
    {
        public Guid Id { get; set; }
        public string UserName { get; set; }
        public string FullName { get; set; }
        public string IsActive { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime EditedOn { get; set; }
        public string EditedBy { get; set; }
        public string RoleName { get; set; }
    }
    public class UserRolesDTO
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int UsersCount { get; set; }
    }
    public class UserResetPasswordDTO
    {
        public Guid Id { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [StringLength(100, ErrorMessage = "لابد على الأقل أن تحتوي على {2} حروف أو رموز.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "كلمة السر الجديدة")]
        public string Password { get; set; }
    }
}