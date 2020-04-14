using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysSubscriberTypeValue
    {
        public SysSubscriberTypeValue()
        {
            Subscriptions = new HashSet<Subscription>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<Subscription> Subscriptions { get; set; }
    }
}
