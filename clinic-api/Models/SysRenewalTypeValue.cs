using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysRenewalTypeValue
    {
        public SysRenewalTypeValue()
        {
            Plans = new HashSet<Plan>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<Plan> Plans { get; set; }
    }
}
