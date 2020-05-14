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
}
