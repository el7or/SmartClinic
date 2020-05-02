using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class PatientGetDTO
    {
        public Guid PatientId { get; set; }
        public string Name { get; set; }
        public string Mobile { get; set; }
        public int? Age { get; set; }
        public bool? Gender { get; set; }
        public int? Status { get; set; }
        public string Career { get; set; }
        public int? City { get; set; }
        public int? Area { get; set; }
    }

    public class PatientPostDTO
    {
        public Guid DoctorId { get; set; }
        public Guid ClinicId { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public int? Age { get; set; }
        public bool? Gender { get; set; }
        public int? SocialStatusId { get; set; }
        public string Career { get; set; }
        public int? GovernorateId { get; set; }
        public int? CityId { get; set; }
    }

    public class PatientPutDTO
    {
        public int Id { get; set; }
        public Guid DoctorId { get; set; }
        public Guid ClinicId { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public int? Age { get; set; }
        public bool? Gender { get; set; }
        public int? SocialStatusId { get; set; }
        public string Career { get; set; }
        public int? GovernorateId { get; set; }
        public int? CityId { get; set; }
    }
}
