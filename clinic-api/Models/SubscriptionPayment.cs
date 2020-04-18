using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Models
{
    public class SubscriptionPayment
    {
        [Key]
        public int Id { get; set; }
        public int SubscriptionId { get; set; }
        public decimal Paid { get; set; }
        public DateTime? NextPaymentDate { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual Subscription Subscription { get; set; }
    }
}
