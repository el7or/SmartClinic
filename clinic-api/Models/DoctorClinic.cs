using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class DoctorClinic
    {
        public Guid DoctorId { get; set; }
        public Guid ClinicId { get; set; }

        public virtual Clinic Clinic { get; set; }
        public virtual Doctor Doctor { get; set; }
    }
}
