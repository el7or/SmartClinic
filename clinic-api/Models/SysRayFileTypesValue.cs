using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Models
{
    public partial class SysRayFileTypesValue
    {
        public SysRayFileTypesValue()
        {
            PatientRayFiles = new HashSet<PatientRayFile>();
        }

        public int Id { get; set; }

        [StringLength(256)]
        public string Value { get; set; }

        [StringLength(256)]
        public string Text { get; set; }

        public virtual ICollection<PatientRayFile> PatientRayFiles { get; set; }
    }
}
