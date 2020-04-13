using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysMedicinesValue
    {
        public SysMedicinesValue()
        {
            DoctorMedicinesValues = new HashSet<DoctorMedicinesValue>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<DoctorMedicinesValue> DoctorMedicinesValues { get; set; }
    }
}
