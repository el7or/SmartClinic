﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace clinic_panel.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SmartClinicDBContext : DbContext
    {
        public SmartClinicDBContext()
            : base("name=SmartClinicDBContext")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<AspNetUserToken> AspNetUserTokens { get; set; }
        public virtual DbSet<BookingPayment> BookingPayments { get; set; }
        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<ClinicBookingType> ClinicBookingTypes { get; set; }
        public virtual DbSet<ClinicDiscount> ClinicDiscounts { get; set; }
        public virtual DbSet<Clinic> Clinics { get; set; }
        public virtual DbSet<ClinicService> ClinicServices { get; set; }
        public virtual DbSet<DoctorAnalysisValue> DoctorAnalysisValues { get; set; }
        public virtual DbSet<DoctorComplaintChoicesValue> DoctorComplaintChoicesValues { get; set; }
        public virtual DbSet<DoctorDetailedComplaintsValue> DoctorDetailedComplaintsValues { get; set; }
        public virtual DbSet<DoctorDiagnosisValue> DoctorDiagnosisValues { get; set; }
        public virtual DbSet<DoctorExaminationAreasValue> DoctorExaminationAreasValues { get; set; }
        public virtual DbSet<DoctorExaminationsValue> DoctorExaminationsValues { get; set; }
        public virtual DbSet<DoctorGeneralComplaintsValue> DoctorGeneralComplaintsValues { get; set; }
        public virtual DbSet<DoctorMedicinesValue> DoctorMedicinesValues { get; set; }
        public virtual DbSet<DoctorOperationTypesValue> DoctorOperationTypesValues { get; set; }
        public virtual DbSet<DoctorRayAreasValue> DoctorRayAreasValues { get; set; }
        public virtual DbSet<DoctorRaysValue> DoctorRaysValues { get; set; }
        public virtual DbSet<Doctor> Doctors { get; set; }
        public virtual DbSet<PatientAnalysi> PatientAnalysis { get; set; }
        public virtual DbSet<PatientAnalysisFile> PatientAnalysisFiles { get; set; }
        public virtual DbSet<PatientDetailedComplaint> PatientDetailedComplaints { get; set; }
        public virtual DbSet<PatientDiagnosi> PatientDiagnosis { get; set; }
        public virtual DbSet<PatientDiseas> PatientDiseases { get; set; }
        public virtual DbSet<PatientExamination> PatientExaminations { get; set; }
        public virtual DbSet<PatientGeneralComplaint> PatientGeneralComplaints { get; set; }
        public virtual DbSet<PatientOperation> PatientOperations { get; set; }
        public virtual DbSet<PatientPrescription> PatientPrescriptions { get; set; }
        public virtual DbSet<PatientRayFile> PatientRayFiles { get; set; }
        public virtual DbSet<PatientRay> PatientRays { get; set; }
        public virtual DbSet<PatientReferral> PatientReferrals { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<Plan> Plans { get; set; }
        public virtual DbSet<Subscription> Subscriptions { get; set; }
        public virtual DbSet<SysAnalysisFileTypesValue> SysAnalysisFileTypesValues { get; set; }
        public virtual DbSet<SysBloodPressureValue> SysBloodPressureValues { get; set; }
        public virtual DbSet<SysCitiesValue> SysCitiesValues { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<SysDiseaseGradesValue> SysDiseaseGradesValues { get; set; }
        public virtual DbSet<SysDiseasesQuestionsValue> SysDiseasesQuestionsValues { get; set; }
        public virtual DbSet<SysDoctorsSpecialty> SysDoctorsSpecialties { get; set; }
        public virtual DbSet<SysEntryOrderValue> SysEntryOrderValues { get; set; }
        public virtual DbSet<SysGovernoratesValue> SysGovernoratesValues { get; set; }
        public virtual DbSet<SysMedicineConcentrationsValue> SysMedicineConcentrationsValues { get; set; }
        public virtual DbSet<SysMedicineDosesValue> SysMedicineDosesValues { get; set; }
        public virtual DbSet<SysMedicineFormsValue> SysMedicineFormsValues { get; set; }
        public virtual DbSet<SysMedicinePeriodsValue> SysMedicinePeriodsValues { get; set; }
        public virtual DbSet<SysMedicinesValue> SysMedicinesValues { get; set; }
        public virtual DbSet<SysMedicineTimingsValue> SysMedicineTimingsValues { get; set; }
        public virtual DbSet<SysPatientRecordSectionsValue> SysPatientRecordSectionsValues { get; set; }
        public virtual DbSet<SysRayFileTypesValue> SysRayFileTypesValues { get; set; }
        public virtual DbSet<SysRenewalTypeValue> SysRenewalTypeValues { get; set; }
        public virtual DbSet<SysSocialStatusValue> SysSocialStatusValues { get; set; }
        public virtual DbSet<SysSubscriberTypeValue> SysSubscriberTypeValues { get; set; }
        public virtual DbSet<SysSubscriptionTypeValue> SysSubscriptionTypeValues { get; set; }

        public System.Data.Entity.DbSet<clinic_panel.DTOs.UserRolesDTO> UserRolesDTOes { get; set; }
    }
}
