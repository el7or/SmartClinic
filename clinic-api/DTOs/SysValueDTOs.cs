using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class SocialStatusDTO
    {
        public int Id { get; set; }
        public string TextEN { get; set; }
        public string TextAR { get; set; }
    }
    public class CityDTO
    {
        public int Id { get; set; }
        public string TextEN { get; set; }
        public string TextAR { get; set; }
        public List<City> Cities { get; set; }
    }
    public class City
    {
        public int Id { get; set; }
        public string TextEN { get; set; }
        public string TextAR { get; set; }
    }

    public class DiseasesQuestionDTO
    {
        public int Id { get; set; }
        public string TextEN { get; set; }
        public string TextAR { get; set; }
        public bool IsActive { get; set; }
    }
    public class RecordSectionDTO
    {
        public int Id { get; set; }
        public string TextEN { get; set; }
        public string TextAR { get; set; }
        public bool IsActive { get; set; }
        public bool IsExpanded { get; set; }
    }

    public class ContactMessageDTO
    {
        public Guid UserId { get; set; }
        public Guid ClinicId { get; set; }
        public string Subject { get; set; }
        public string Message { get; set; }
    }

    public class DoctorAnyValueDTO
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public enum ItemsType
    {
        Complaint,
        Examination,
        ExaminationArea,
        Diagnosis,
        Ray,
        RayArea,
        Analysis,
        PhysicalTherapy,
        PhysicalTherapyArea,
        Operation,
        Medicine
    }
}
