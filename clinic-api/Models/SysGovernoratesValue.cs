using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

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

        [Required]
        [StringLength(256)]
        public string TextAR { get; set; }

        [Required]
        [StringLength(256)]
        public string TextEN { get; set; }

        public virtual ICollection<Patient> Patients { get; set; }
        public virtual ICollection<SysCitiesValue> SysCitiesValues { get; set; }
    }
}
