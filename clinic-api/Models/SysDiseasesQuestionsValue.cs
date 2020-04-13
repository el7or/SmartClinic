using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysDiseasesQuestionsValue
    {
        public SysDiseasesQuestionsValue()
        {
            PatientDiseases = new HashSet<PatientDisease>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<PatientDisease> PatientDiseases { get; set; }
    }
}
