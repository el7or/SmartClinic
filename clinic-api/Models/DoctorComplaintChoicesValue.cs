using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class DoctorComplaintChoicesValue
    {
        public DoctorComplaintChoicesValue()
        {
            PatientDetailedComplaints = new HashSet<PatientDetailedComplaint>();
        }

        public int Id { get; set; }
        public int DetailedComplaintId { get; set; }
        public string Choice { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual DoctorDetailedComplaintsValue DetailedComplaint { get; set; }
        public virtual ICollection<PatientDetailedComplaint> PatientDetailedComplaints { get; set; }
    }
}
