using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysEntryOrderValue
    {
        public SysEntryOrderValue()
        {
            Clinics = new HashSet<Clinic>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<Clinic> Clinics { get; set; }
    }
}
