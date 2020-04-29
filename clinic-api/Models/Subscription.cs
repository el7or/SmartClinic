using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class Subscription
    {
        public Subscription()
        {
            SubscriptionPayments = new HashSet<SubscriptionPayment>();
        }
        public int Id { get; set; }
        public Guid SubscriberId { get; set; }
        public int SubscriberTypeId { get; set; }
        public int PlanId { get; set; }
        public int? SubscriptionTypeId { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string Note { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }
        public decimal? SignUpFee { get; set; }
        public decimal? AnnualRenewalFee { get; set; }
        public decimal? MonthlyRenewalFee { get; set; }
        public int? GracePeriodDays { get; set; }
        public int? MaxUsers { get; set; }
        public int? MaxBookingsMonthly { get; set; }
        public int? MaxFilesMonthlyMB { get; set; }
        public int? MaxFileSizeMB { get; set; }

        public virtual Plan Plan { get; set; }
        public virtual SysSubscriberTypeValue SubscriberType { get; set; }
        public virtual SysSubscriptionTypeValue SubscriptionType { get; set; }
        public virtual ICollection<SubscriptionPayment> SubscriptionPayments { get; set; }
    }
}
