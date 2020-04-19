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
}