using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Models
{
    public partial class Clinic
    {
        public Clinic()
        {            
            ClinicUsers = new HashSet<ClinicUser>();
            DoctorClinics = new HashSet<DoctorClinic>();
            Patients = new HashSet<Patient>();
        }

        public Guid Id { get; set; }
        public string ClinicName { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual ICollection<ClinicUser> ClinicUsers { get; set; }
        public virtual ICollection<DoctorClinic> DoctorClinics { get; set; }
        public virtual ICollection<Patient> Patients { get; set; }
    }
}
