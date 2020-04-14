using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class Plan
    {
        public Plan()
        {
            Subscriptions = new HashSet<Subscription>();
        }

        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }
        public decimal? SignUpFee { get; set; }
        public int? RenewalTypeId { get; set; }
        public decimal? AnnualRenewalFee { get; set; }
        public decimal? MonthlyRenewalFee { get; set; }
        public int? GracePeriodDays { get; set; }
        public int? MaxUsers { get; set; }
        public int? MaxBookingsMonthly { get; set; }
        public int? MaxFilesMonthlyMb { get; set; }
        public int? MaxFileSizeMb { get; set; }

        public virtual SysRenewalTypeValue RenewalType { get; set; }
        public virtual ICollection<Subscription> Subscriptions { get; set; }
    }
}
