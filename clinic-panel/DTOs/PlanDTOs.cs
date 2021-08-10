using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class PlanIndexDTO
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string IsActive { get; set; }
        public decimal? SignUpFee { get; set; }
        public string RenewalType { get; set; }
        public decimal? RenewalFee { get; set; }
        public int? MaxUsers { get; set; }
        public int? MaxBookingsMonthly { get; set; }
        public int SubscriptionsCount { get; set; }
        public int? MaxBranchesCount { get; set; }
    }
    public class PlanDetailsDTO
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string IsActive { get; set; }
        public decimal? SignUpFee { get; set; }
        public string RenewalType { get; set; }
        public decimal? RenewalFee { get; set; }
        public int? GracePeriodDays { get; set; }
        public int? MaxUsers { get; set; }
        public int? MaxBookingsMonthly { get; set; }
        public int? MaxFilesMonthlyMB { get; set; }
        public int? MaxFileSizeMB { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }
    }
}