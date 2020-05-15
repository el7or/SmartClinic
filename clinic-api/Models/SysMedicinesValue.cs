using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Models
{
    public partial class SysMedicinesValue
    {
        public SysMedicinesValue()
        {
            DoctorMedicinesValues = new HashSet<DoctorMedicinesValue>();
            PrescriptionMedicines = new HashSet<PrescriptionMedicine>();
        }

        public int Id { get; set; }

        [StringLength(256)]
        public string Value { get; set; }

        [StringLength(256)]
        public string Text { get; set; }

        public virtual ICollection<DoctorMedicinesValue> DoctorMedicinesValues { get; set; }
        public virtual ICollection<PrescriptionMedicine> PrescriptionMedicines { get; set; }
    }
}
