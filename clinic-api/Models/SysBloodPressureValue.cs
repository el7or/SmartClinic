using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysBloodPressureValue
    {
        public SysBloodPressureValue()
        {
            Patients = new HashSet<Patient>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<Patient> Patients { get; set; }
    }
}
