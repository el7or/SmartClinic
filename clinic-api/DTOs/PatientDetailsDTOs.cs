using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    // Diseases
    public class GetPatientDiseaseDTO
    {
        public int Id { get; set; }
        public string QuestionTextAR { get; set; }
        public string QuestionTextEN { get; set; }
        public bool? IsYes { get; set; }
        public string Note { get; set; }
    }
    public class PutPatientDiseaseDTO
    {
        public List<GetPatientDiseaseDTO> PatientDiseaseList { get; set; }
    }

    // Complaints
    public class GetPatientComplaintDTO
    {
        public List<ComplaintGeneralValue> ComplaintGeneralValues { get; set; }
        public List<ComplaintDetailsValue> ComplaintDetailsValues { get; set; }
        public List<PatientGeneralComplaintList> PatientGeneralComplaints { get; set; }
        public List<PatientDetailsComplaintList> PatientDetailsComplaints { get; set; }
    }
    public class PutPatientComplaintDTO
    {
        public List<PatientGeneralComplaintList> PatientGeneralComplaints { get; set; }
        public List<PatientDetailsComplaintList> PatientDetailsComplaints { get; set; }
    }
    public class ComplaintGeneralValue
    {
        public int CompId { get; set; }
        public string CompName { get; set; }
    }
    public class PatientGeneralComplaintList
    {
        public int Id { get; set; }
        public int CompId { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
    }
    public class ComplaintDetailsValue
    {
        public int CompId { get; set; }
        public string CompName { get; set; }
        public List<ComplaintChoiceValue> CompChoises { get; set; }
    }
    public class ComplaintChoiceValue
    {
        public int ChoiceId { get; set; }
        public string ChoiceName { get; set; }
    }
    public class PatientDetailsComplaintList
    {
        public int Id { get; set; }
        public int CompId { get; set; }
        public int? ChoiceId { get; set; }
        public string Period { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
        public List<ComplaintChoiceValue> AllChoices { get; set; }
    }

    // History
    public class PatientHistoryDTO
    {
        public string TreatmentHistory { get; set; }
        public string FamilyHistory { get; set; }
    }
}
