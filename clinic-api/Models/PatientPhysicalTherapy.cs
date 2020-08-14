using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Models
{
    public class PatientPhysicalTherapy
    {
        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public int PhysicalTherapyId { get; set; }
        public int? PhysicalTherapyAreaId { get; set; }
        public string RequestNote { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual Patient Patient { get; set; }
        public virtual DoctorPhysicalTherapyValue PhysicalTherapy { get; set; }
        public virtual DoctorPhysicalTherapyAreaValue PhysicalTherapyArea { get; set; }
    }
}
