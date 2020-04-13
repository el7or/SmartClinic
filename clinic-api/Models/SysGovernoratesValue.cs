using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysGovernoratesValue
    {
        public SysGovernoratesValue()
        {
            Patients = new HashSet<Patient>();
            SysCitiesValues = new HashSet<SysCitiesValue>();
        }

        public int Id { get; set; }
        public string TextAr { get; set; }
        public string TextEn { get; set; }

        public virtual ICollection<Patient> Patients { get; set; }
        public virtual ICollection<SysCitiesValue> SysCitiesValues { get; set; }
    }
}
