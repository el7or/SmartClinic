using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysCitiesValue
    {
        public SysCitiesValue()
        {
            Patients = new HashSet<Patient>();
        }

        public int Id { get; set; }
        public int GovId { get; set; }
        public string TextAr { get; set; }
        public string TextEn { get; set; }

        public virtual SysGovernoratesValue Gov { get; set; }
        public virtual ICollection<Patient> Patients { get; set; }
    }
}
