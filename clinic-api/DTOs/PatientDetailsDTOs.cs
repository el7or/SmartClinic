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

    // Examinations
    public class GetPatientExaminationsDTO
    {
        public List<ExaminationTypeValue> ExaminationTypeValues { get; set; }
        public List<ExaminationAreaValue> ExaminationAreaValues { get; set; }
        public List<BloodPressureValue> PressureValues { get; set; }
        public PatientExaminationsDetails PatientExaminations { get; set; }
    }
    public class ExaminationTypeValue
    {
        public int TypeId { get; set; }
        public string TypeText { get; set; }
    }
    public class ExaminationAreaValue
    {
        public int AreaId { get; set; }
        public string AreaText { get; set; }
    }
    public class BloodPressureValue
    {
        public int Id { get; set; }
        public string Pressure { get; set; }
    }
    public class PatientExaminationsDetails
    {
        public decimal? Weight { get; set; }
        public decimal? Length { get; set; }
        public decimal? Mass { get; set; }
        public int? PressureId { get; set; }
        public decimal? Temperature { get; set; }
        public List<PatientExaminationList> Examinations { get; set; }
    }
    public class PatientExaminationList
    {
        public int Id { get; set; }
        public int TypeId { get; set; }
        public int? AreaId { get; set; }
        public DateTime CreatedOn { get; set; }
    }

    // Diagnosis
    public class GetPatientDiagnosis
    {
        public List<DiagnosisValue> DiagnosisValues { get; set; }
        public List<DiseaseValue> DiseaseValues { get; set; }
        public List<PatientDiagnosisList> PatientDiagnosis { get; set; }
    }
    public class DiagnosisValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class DiseaseValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class PatientDiagnosisList
    {
        public int Id { get; set; }
        public int DiagnosisId { get; set; }
        public int? GradeId { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
    }
    public class PutPatientDiagnosis
    {
        public List<PatientDiagnosisList> PatientDiagnosis { get; set; }
    }

    // Precriptions
    public class GetPatientPrescriptions
    {
        public List<MedicineValue> MedicineValues { get; set; }
        public List<ConcentrationValue> ConcentrationValues { get; set; }
        public List<FormValue> FormValues { get; set; }
        public List<DoseValue> DoseValues { get; set; }
        public List<TimingValue> TimingValues { get; set; }
        public List<PeriodValue> PeriodValues { get; set; }
        public List<PatientPrescriptionList> PrevPatientPrescriptions { get; set; }
    }
    public class MedicineValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class ConcentrationValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class FormValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class DoseValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class TimingValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class PeriodValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class PatientPrescriptionList
    {
        public int Id { get; set; }
        public List<PrescriptionMedicineList> Medicines { get; set; }
        public string Note { get; set; }
        public string[] MedicinesNames { get; set; }
        public DateTime CreatedOn { get; set; }
        public bool? IsPrint { get; set; }
    }
    public class PrescriptionMedicineList
    {
        public int MedicineId { get; set; }
        public string MedicineName { get; set; }
        public int? ConcentrationId { get; set; }
        public int? FormId { get; set; }
        public int? DoseId { get; set; }
        public int? TimingId { get; set; }
        public int? PeriodId { get; set; }
    }

    // Requests
    public class GetPatientRequests
    {
        public List<RayValue> RayValues { get; set; }
        public List<RayAreaValue> RayAreaValues { get; set; }
        public List<AnalysisValue> AnalysisValues { get; set; }
        public List<PatientRequestList> PrevPatientRequests { get; set; }
    }
    public class RayValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class RayAreaValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class AnalysisValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class PatientRequestList
    {
        public int Id { get; set; }
        public DateTime? RequestDate { get; set; }
        public string RequestType { get; set; }
        public int RequestId { get; set; }
        public string RequestName { get; set; }
        public int? RayAreaId { get; set; }
        public string RayAreaName { get; set; }
        public string Note { get; set; }
        public bool? isHasResult { get; set; }
    }
    public class PutPatientRequests
    {
        public List<PatientRequestList> NewPatientRequests { get; set; }
    }
}
