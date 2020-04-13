using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysRayFileTypesValue
    {
        public SysRayFileTypesValue()
        {
            PatientRayFiles = new HashSet<PatientRayFile>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<PatientRayFile> PatientRayFiles { get; set; }
    }
}
