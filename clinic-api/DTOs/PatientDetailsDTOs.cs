using Microsoft.AspNetCore.Http;
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
        public string CompName { get; set; }
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
        public List<PatientExaminationListDTO> Examinations { get; set; }
    }
    public class PatientExaminationListDTO
    {
        public int Id { get; set; }
        public int TypeId { get; set; }
        public string TypeName { get; set; }
        public int? AreaId { get; set; }
        public string AreaName { get; set; }
        public DateTime CreatedOn { get; set; }
    }

    // Diagnosis
    public class GetPatientDiagnosisDTO
    {
        public List<DiagnosisValue> DiagnosisValues { get; set; }
        public List<GradeValue> DiseaseValues { get; set; }
        public List<PatientDiagnosisListDTO> PatientDiagnosis { get; set; }
    }
    public class DiagnosisValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class GradeValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class PatientDiagnosisListDTO
    {
        public int Id { get; set; }
        public int DiagnosisId { get; set; }
        public string DiagnosisName { get; set; }
        public bool? IsNameValid { get; set; }
        public int? GradeId { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
    }
    public class PutPatientDiagnosisDTO
    {
        public List<PatientDiagnosisListDTO> PatientDiagnosis { get; set; }
    }
    public class PostDoctorDiagnosisDTO
    {
        public Guid DoctorId { get; set; }
        public string Diagnosis { get; set; }
    }

    // Precriptions
    public class GetPatientPrescriptionsDTO
    {
        public List<MedicineValue> MedicineValues { get; set; }
        public List<QuantityValue> QuantityValues { get; set; }
        public List<DoseValue> DoseValues { get; set; }
        public List<TimingValue> TimingValues { get; set; }
        public List<PeriodValue> PeriodValues { get; set; }
        public List<PharmacyValue> PharmacyValues { get; set; }
        public Guid? DoctorPharmacyId { get; set; }
        public List<PatientPrescriptionListDTO> PrevPatientPrescriptions { get; set; }
    }
    public class MedicineValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class QuantityValue
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
    public class PharmacyValue
    {
        public Guid Id { get; set; }
        public string Text { get; set; }
    }
    public class PatientPrescriptionListDTO
    {
        public int Id { get; set; }
        public List<PrescriptionMedicineListDTO> Medicines { get; set; }
        public string Note { get; set; }
        public string[] MedicinesNames { get; set; }
        public DateTime CreatedOn { get; set; }
        public bool? IsPrint { get; set; }
        public Guid? PharmacyId { get; set; }
    }
    public class PrescriptionMedicineListDTO
    {
        public int MedicineId { get; set; }
        public string MedicineName { get; set; }
        public int? QuantityId { get; set; }
        public int? DoseId { get; set; }
        public int? TimingId { get; set; }
        public int? PeriodId { get; set; }
    }

    // Requests
    public class GetPatientRequestsDTO
    {
        public List<RayValue> RayValues { get; set; }
        public List<RayAreaValue> RayAreaValues { get; set; }
        public List<AnalysisValue> AnalysisValues { get; set; }
        public List<PatientRequestListDTO> PrevPatientRequests { get; set; }
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
    public class PatientRequestListDTO
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
    public class PostPatientRequestsDTO
    {
        public List<PatientRequestListDTO> NewPatientRequests { get; set; }
    }

    // Operations
    public class GetPatientOperationsDTO
    {
        public List<OperationTypeValue> OperationTypeValues { get; set; }
        public List<PatientOperationListDTO> PrevPatientOperations { get; set; }
    }
    public class OperationTypeValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class PatientOperationListDTO
    {
        public int Id { get; set; }
        public int TypeId { get; set; }
        public string Type { get; set; }
        public DateTime? Date { get; set; }
        public string Place { get; set; }
        public decimal? Cost { get; set; }
        public string Note { get; set; }
    }
    public class CalendarOperationListDTO
    {
        public int Id { get; set; }
        public string PatientName { get; set; }
        public int PatientCodeId { get; set; }
        public string Type { get; set; }
        public string Place { get; set; }
        public decimal? Cost { get; set; }
        public string Note { get; set; }
    }
    public class PostPatientOperationDTO
    {
        public int TypeId { get; set; }
        public DateTime? Date { get; set; }
        public string Place { get; set; }
        public decimal? Cost { get; set; }
        public string Note { get; set; }
    }
    public class PutPatientOperationDTO
    {
        public int Id { get; set; }
        public int TypeId { get; set; }
        public DateTime? Date { get; set; }
        public string Place { get; set; }
        public decimal? Cost { get; set; }
        public string Note { get; set; }
    }

    // Rays
    public class RaysListDTO
    {
        public int Id { get; set; }
        public string XrayName { get; set; }
        public string XrayArea { get; set; }
        public DateTime RequestDate { get; set; }
        public bool? IsHasResult { get; set; }
        public DateTime? ResultDate { get; set; }
        public string ResultGrade { get; set; }
    }
    public class RayDetailsDTO
    {
        public int Id { get; set; }
        public string XrayName { get; set; }
        public string XrayArea { get; set; }
        public DateTime RequestDate { get; set; }
        public bool? IsHasResult { get; set; }
        public DateTime? ResultDate { get; set; }
        public string ResultText { get; set; }
        public int? ResultGradeId { get; set; }
        public List<GradeValue> GradeValues { get; set; }
        public List<RayFileTypeValue> XrayFileTypes { get; set; }
        public List<RayFileList> XraysFiles { get; set; }
    }
    public class RayFileTypeValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class RayFileList
    {
        public int Id { get; set; }
        public DateTime UploadDate { get; set; }
        public string FileType { get; set; }
        public string FileNote { get; set; }
        public string FileUrl { get; set; }
    }
    public class PutRayDTO
    {
        public int Id { get; set; }
        public string ResultText { get; set; }
        public int? ResultGradeId { get; set; }
    }
    public class PostRayFileDTO
    {
        public int RayId { get; set; }
        public IFormFile File { get; set; }
        public int FileTypeId { get; set; }
        public string Note { get; set; }
    }

    // Analysis
    public class AnalysisListDTO
    {
        public int Id { get; set; }
        public string AnalysisName { get; set; }
        public DateTime RequestDate { get; set; }
        public bool? IsHasResult { get; set; }
        public DateTime? ResultDate { get; set; }
        public string ResultGrade { get; set; }
    }
    public class AnalysisDetailsDTO
    {
        public int Id { get; set; }
        public string AnalysisName { get; set; }
        public DateTime RequestDate { get; set; }
        public bool? IsHasResult { get; set; }
        public DateTime? ResultDate { get; set; }
        public string ResultText { get; set; }
        public string ResultNote { get; set; }
        public List<AnalysisFileTypeValue> AnalysisFileTypes { get; set; }
        public List<AnalysisFileList> AnalysisFiles { get; set; }
    }
    public class AnalysisFileTypeValue
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class AnalysisFileList
    {
        public int Id { get; set; }
        public DateTime UploadDate { get; set; }
        public string FileType { get; set; }
        public string FileNote { get; set; }
        public string FileUrl { get; set; }
    }
    public class PutAnalysisDTO
    {
        public int Id { get; set; }
        public string ResultText { get; set; }
        public string resultNote { get; set; }
    }
    public class PostAnalysisFileDTO
    {
        public int AnalysisId { get; set; }
        public IFormFile File { get; set; }
        public int FileTypeId { get; set; }
        public string Note { get; set; }
    }

    // Referrals
    public class GetPatientReferralsDTO
    {
        public List<SpecialtyValue> SpecialtyValues { get; set; }
        public List<PatientDiagnosisRef> PatientDiagnosis { get; set; }
        public List<PatientReferralListDTO> PrevPatientReferrals { get; set; }
    }
    public class SpecialtyValue
    {
        public int SpecialtyId { get; set; }
        public string SpecialtyName { get; set; }
        public List<DoctorValue> Doctors { get; set; }
    }
    public class DoctorValue
    {
        public Guid DoctorId { get; set; }
        public string DoctorName { get; set; }
    }
    public class PatientDiagnosisRef
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class PatientReferralListDTO
    {
        public int Id { get; set; }
        public string SpecialtyName { get; set; }
        public string DoctorName { get; set; }
        public string DiagnosisName { get; set; }
        public string Note { get; set; }
        public DateTime CreatedOn { get; set; }
    }
    public class PostPatientReferralDTO
    {
        public int SpecialtyId { get; set; }
        public Guid DoctorId { get; set; }
        public int? DiagnosisId { get; set; }
        public string Note { get; set; }
    }

    // Externals
    public class DoctorExternalListDTO
    {
        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public string PatientName { get; set; }
        public string PatientMobile { get; set; }
        public string PatientGovernorateEN { get; set; }
        public string PatientGovernorateAR { get; set; }
        public string RequestType { get; set; }
        public string ReferralFromDoctor { get; set; }
        public DateTime CreatedOn { get; set; }
        public string Note { get; set; }
        public DateTime? RequestBookDateTime { get; set; }
    }
}
