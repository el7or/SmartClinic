using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class SysDoctorsSpecialty
    {
        public SysDoctorsSpecialty()
        {
            Doctors = new HashSet<Doctor>();
        }

        public int Id { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }

        public virtual ICollection<Doctor> Doctors { get; set; }
    }
}
