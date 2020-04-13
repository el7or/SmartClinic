using System;
using System.Collections.Generic;
using clinic_api.Data;

namespace clinic_api.Models
{
    public partial class ClinicUser
    {
        public Guid ClinicId { get; set; }
        public Guid UserId { get; set; }

        public virtual Clinic Clinic { get; set; }
        public virtual ApplicationUser User { get; set; }
    }
}
