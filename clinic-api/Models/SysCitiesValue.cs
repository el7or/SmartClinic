using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

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

        [Required]
        [StringLength(256)]
        public string TextAR { get; set; }

        [Required]
        [StringLength(256)]
        public string TextEN { get; set; }

        public virtual SysGovernoratesValue Gov { get; set; }
        public virtual ICollection<Patient> Patients { get; set; }
    }
}
