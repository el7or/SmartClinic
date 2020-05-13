using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class PatientDiseaseDTO
    {
        public int Id { get; set; }
        public string QuestionTextAR { get; set; }
        public string QuestionTextEN { get; set; }
        public bool? IsYes { get; set; }
        public string Note { get; set; }
    }
    public class PutPatientDiseaseDTO
    {
        public List<PatientDiseaseDTO> PatientDiseaseList { get; set; }
    }
}
