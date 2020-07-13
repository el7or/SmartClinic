using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Models
{
    public partial class SysSubscriberTypeValue
    {
        public SysSubscriberTypeValue()
        {
            Subscriptions = new HashSet<Subscription>();
            Plans = new HashSet<Plan>();
        }

        public int Id { get; set; }

        [StringLength(256)]
        public string Value { get; set; }

        [StringLength(256)]
        public string Text { get; set; }

        public virtual ICollection<Subscription> Subscriptions { get; set; }
        public virtual ICollection<Plan> Plans { get; set; }
    }
}
