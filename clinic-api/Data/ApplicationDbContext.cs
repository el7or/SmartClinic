﻿using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using clinic_api.Models;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Data
{
    public class ApplicationUser : IdentityUser<Guid>
    {
        [StringLength(256)]
        public string FullName { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime EditedOn { get; set; }
        public Guid EditedBy { get; set; }
        public DateTime LastActive { get; set; }
        public virtual ICollection<ApplicationUserRole> UserRoles { get; set; }
        public virtual ICollection<ApplicationUserClaim> Claims { get; set; }
        public virtual ICollection<ApplicationUserLogin> Logins { get; set; }
        public virtual ICollection<ApplicationUserToken> Tokens { get; set; }
        public virtual ICollection<ClinicUser> ClinicUsers { get; set; }
        public virtual ICollection<ChatMessage> MessagesSent { get; set; }
        public virtual ICollection<ChatMessage> MessagesReceived { get; set; }
        public virtual ICollection<Doctor> Doctors { get; set; }
        public virtual ICollection<Pharmacy> Pharmacies { get; set; }
        public virtual ICollection<Subscription> Subscriptions { get; set; }
    }
    public class ApplicationRole : IdentityRole<Guid>
    {
        [StringLength(256)]
        public string Title { get; set; }
        public string Description { get; set; }
        public virtual ICollection<ApplicationUserRole> UserRoles { get; set; }
        public virtual ICollection<ApplicationRoleClaim> RoleClaims { get; set; }
    }
    public class ApplicationUserRole : IdentityUserRole<Guid>
    {
        public virtual ApplicationUser User { get; set; }
        public virtual ApplicationRole Role { get; set; }
    }
    public class ApplicationUserClaim : IdentityUserClaim<Guid>
    {
        public virtual ApplicationUser User { get; set; }
    }
    public class ApplicationUserLogin : IdentityUserLogin<Guid>
    {
        public virtual ApplicationUser User { get; set; }
    }
    public class ApplicationRoleClaim : IdentityRoleClaim<Guid>
    {
        public virtual ApplicationRole Role { get; set; }
    }
    public class ApplicationUserToken : IdentityUserToken<Guid>
    {
        public virtual ApplicationUser User { get; set; }
    }

    public class ApplicationDbContext : IdentityDbContext<
        ApplicationUser, ApplicationRole, Guid,
        ApplicationUserClaim, ApplicationUserRole, ApplicationUserLogin,
        ApplicationRoleClaim, ApplicationUserToken>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<BookingPayment> BookingPayments { get; set; }
        public virtual DbSet<BookingService> BookingServices { get; set; }
        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<ChatMessage> ChatMessages { get; set; }
        public virtual DbSet<ClinicUser> ClinicUsers { get; set; }
        public virtual DbSet<Clinic> Clinics { get; set; }
        public virtual DbSet<DoctorAnalysisValue> DoctorAnalysisValues { get; set; }
        public virtual DbSet<DoctorClinic> DoctorClinics { get; set; }
        public virtual DbSet<DoctorPharmacy> DoctorPharmacies { get; set; }
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
        public virtual DbSet<DoctorPhysicalTherapyAreaValue> DoctorPhysicalTherapyAreaValues { get; set; }
        public virtual DbSet<DoctorPhysicalTherapyValue> DoctorPhysicalTherapyValues { get; set; }
        public virtual DbSet<Doctor> Doctors { get; set; }
        public virtual DbSet<DoctorBookingType> DoctorBookingTypes { get; set; }
        public virtual DbSet<DoctorDiscount> DoctorDiscounts { get; set; }
        public virtual DbSet<DoctorService> DoctorServices { get; set; }
        public virtual DbSet<DoctorExpense> DoctorExpenses { get; set; }
        public virtual DbSet<DoctorExpenseItemValue> DoctorExpenseItems { get; set; }
        public virtual DbSet<Expense> Expenses { get; set; }
        public virtual DbSet<PatientAnalysis> PatientAnalysis { get; set; }
        public virtual DbSet<PatientAnalysisFile> PatientAnalysisFiles { get; set; }
        public virtual DbSet<PatientDetailedComplaint> PatientDetailedComplaints { get; set; }
        public virtual DbSet<PatientDiagnosis> PatientDiagnosis { get; set; }
        public virtual DbSet<PatientDisease> PatientDiseases { get; set; }
        public virtual DbSet<PatientExamination> PatientExaminations { get; set; }
        public virtual DbSet<PatientGeneralComplaint> PatientGeneralComplaints { get; set; }
        public virtual DbSet<PatientOperation> PatientOperations { get; set; }
        public virtual DbSet<PatientPrescription> PatientPrescriptions { get; set; }
        public virtual DbSet<PatientRayFile> PatientRayFiles { get; set; }
        public virtual DbSet<PatientRay> PatientRays { get; set; }
        public virtual DbSet<PatientPhysicalTherapy> PatientPhysicalTherapies { get; set; }
        public virtual DbSet<PatientReferral> PatientReferrals { get; set; }
        public virtual DbSet<Patient> Patients { get; set; }
        public virtual DbSet<Pharmacy> Pharmacies { get; set; }
        public virtual DbSet<PrescriptionMedicine> PrescriptionMedicines { get; set; }
        public virtual DbSet<Plan> Plans { get; set; }
        public virtual DbSet<Subscription> Subscriptions { get; set; }
        public virtual DbSet<SubscriptionPayment> SubscriptionPayments { get; set; }
        public virtual DbSet<SysAnalysisFileTypesValue> SysAnalysisFileTypesValues { get; set; }
        public virtual DbSet<SysBloodPressureValue> SysBloodPressureValues { get; set; }
        public virtual DbSet<SysCitiesValue> SysCitiesValues { get; set; }
        public virtual DbSet<SysDiseaseGradesValue> SysDiseaseGradesValues { get; set; }
        public virtual DbSet<SysDiseasesQuestionsValue> SysDiseasesQuestionsValues { get; set; }
        public virtual DbSet<SysDoctorExpenseTypeValue> SysDoctorExpenseTypes { get; set; }
        public virtual DbSet<SysDoctorsSpecialty> SysDoctorsSpecialties { get; set; }
        public virtual DbSet<SysEntryOrderValue> SysEntryOrderValues { get; set; }
        public virtual DbSet<SysExpenseType> SysExpenseTypes { get; set; }
        public virtual DbSet<SysGovernoratesValue> SysGovernoratesValues { get; set; }
        public virtual DbSet<SysMedicineDosesValue> SysMedicineDosesValues { get; set; }
        public virtual DbSet<SysMedicineQuantityValue> SysMedicineQuantityValues { get; set; }
        public virtual DbSet<SysMedicinePeriodsValue> SysMedicinePeriodsValues { get; set; }
        public virtual DbSet<SysMedicineTimingsValue> SysMedicineTimingsValues { get; set; }
        public virtual DbSet<SysPatientRecordSectionsValue> SysPatientRecordSectionsValues { get; set; }
        public virtual DbSet<SysRayFileTypesValue> SysRayFileTypesValues { get; set; }
        public virtual DbSet<SysRenewalTypeValue> SysRenewalTypeValues { get; set; }
        public virtual DbSet<SysSocialStatusValue> SysSocialStatusValues { get; set; }
        public virtual DbSet<SysSubscriberTypeValue> SysSubscriberTypeValues { get; set; }
        public virtual DbSet<SysSubscriptionTypeValue> SysSubscriptionTypeValues { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<ApplicationUser>(b =>
            {
                // Each User can have many UserClaims
                b.HasMany(e => e.Claims)
                    .WithOne(e => e.User)
                    .HasForeignKey(uc => uc.UserId)
                    .IsRequired();

                // Each User can have many UserLogins
                b.HasMany(e => e.Logins)
                    .WithOne(e => e.User)
                    .HasForeignKey(ul => ul.UserId)
                    .IsRequired();

                // Each User can have many UserTokens
                b.HasMany(e => e.Tokens)
                    .WithOne(e => e.User)
                    .HasForeignKey(ut => ut.UserId)
                    .IsRequired();

                // Each User can have many entries in the UserRole join table
                b.HasMany(e => e.UserRoles)
                    .WithOne(e => e.User)
                    .HasForeignKey(ur => ur.UserId)
                    .IsRequired();

                // Each User can have many entries in the ClinicUsers join table
                b.HasMany(e => e.ClinicUsers)
                    .WithOne(e => e.User)
                    .HasForeignKey(ur => ur.UserId)
                    .IsRequired();
            });

            modelBuilder.Entity<ApplicationRole>(b =>
            {
                // Each Role can have many entries in the UserRole join table
                b.HasMany(e => e.UserRoles)
                    .WithOne(e => e.Role)
                    .HasForeignKey(ur => ur.RoleId)
                    .IsRequired();

                // Each Role can have many associated RoleClaims
                b.HasMany(e => e.RoleClaims)
                    .WithOne(e => e.Role)
                    .HasForeignKey(rc => rc.RoleId)
                    .IsRequired();
            });

            modelBuilder.Entity<BookingPayment>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.NextPaymentDate).HasColumnType("datetime");

                entity.Property(e => e.Paid).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Booking)
                    .WithMany(p => p.BookingPayments)
                    .HasForeignKey(d => d.BookingId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BookingPayments_Bookings");
            });

            modelBuilder.Entity<BookingService>(entity =>
            {
                entity.HasKey(e => new { e.BookingId, e.ServiceId });

                entity.HasOne(d => d.Booking)
                    .WithMany(p => p.BookingServices)
                    .HasForeignKey(d => d.BookingId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BookingServices_Bookings");

                entity.HasOne(d => d.Service)
                    .WithMany(p => p.BookingServices)
                    .HasForeignKey(d => d.ServiceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BookingServices_DoctorServices");
            });

            modelBuilder.Entity<Booking>(entity =>
            {
                entity.Property(e => e.AttendanceTime).HasColumnType("datetime");

                entity.Property(e => e.BookingDateTime).HasColumnType("datetime");

                entity.Property(e => e.CanceledOn).HasColumnType("datetime");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.EntryTime).HasColumnType("datetime");

                entity.Property(e => e.FinishTime).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Bookings_Patients");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Bookings_Doctors");

                entity.HasOne(d => d.Clinic)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.ClinicId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Bookings_Clinics");

                entity.HasOne(d => d.Type)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.TypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Bookings_DoctorBookingTypes");

                entity.HasOne(d => d.Discount)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.DiscountId)
                    .HasConstraintName("FK_Bookings_DoctorDiscounts");
            });

            modelBuilder.Entity<ChatMessage>(entity =>
            {
                entity.Property(e => e.MessageText).IsRequired();

                entity.Property(e => e.SentOn).HasColumnType("datetime");

                entity.HasOne(d => d.Sender)
                    .WithMany(p => p.MessagesSent)
                    .HasForeignKey(d => d.SenderId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("FK_MessagesSent_AspNetUsers");

                entity.HasOne(d => d.Receiver)
                    .WithMany(p => p.MessagesReceived)
                    .HasForeignKey(d => d.ReceiverId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("FK_MessagesReceived_AspNetUsers");
            });

            modelBuilder.Entity<ClinicUser>(entity =>
            {
                entity.HasKey(e => new { e.ClinicId, e.UserId });

                entity.HasOne(d => d.Clinic)
                    .WithMany(p => p.ClinicUsers)
                    .HasForeignKey(d => d.ClinicId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ClinicUsers_Clinics");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.ClinicUsers)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ClinicUsers_AspNetUsers");
            });

            modelBuilder.Entity<Clinic>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ClinicName).IsRequired();

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasMany(e => e.ClinicUsers)
                    .WithOne(e => e.Clinic)
                    .HasForeignKey(ur => ur.ClinicId)
                    .IsRequired();
            });

            modelBuilder.Entity<DoctorAnalysisValue>(entity =>
            {
                entity.Property(e => e.AnalysisName).IsRequired();

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorAnalysisValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorAnalysisValues_Doctors");
            });

            modelBuilder.Entity<DoctorClinic>(entity =>
            {
                entity.HasKey(e => new { e.DoctorId, e.ClinicId });

                entity.HasOne(d => d.Clinic)
                    .WithMany(p => p.DoctorClinics)
                    .HasForeignKey(d => d.ClinicId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorClinics_Clinics");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorClinics)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorClinics_Doctors");
            });

            modelBuilder.Entity<DoctorPharmacy>(entity =>
            {
                entity.HasKey(e => new { e.DoctorId, e.PharmacyId });

                entity.HasOne(d => d.Pharmacy)
                    .WithMany(p => p.DoctorPharmacies)
                    .HasForeignKey(d => d.PharmacyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorPharmacies_Pharmacies");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorPharmacies)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorPharmacies_Doctors");
            });

            modelBuilder.Entity<DoctorComplaintChoicesValue>(entity =>
            {
                entity.Property(e => e.Choice).IsRequired();

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.DetailedComplaint)
                    .WithMany(p => p.DoctorComplaintChoicesValues)
                    .HasForeignKey(d => d.DetailedComplaintId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorComplaintChoicesValues_DoctorDetailedComplaintsValues");
            });

            modelBuilder.Entity<DoctorDetailedComplaintsValue>(entity =>
            {
                entity.Property(e => e.Complaint).IsRequired();

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorDetailedComplaintsValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorDetailedComplaintsValues_Doctors");
            });

            modelBuilder.Entity<DoctorDiagnosisValue>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Diagnosis).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorDiagnosisValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorDiagnosisValues_Doctors");
            });

            modelBuilder.Entity<DoctorExaminationAreasValue>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ExaminationArea).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorExaminationAreasValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorExaminationAreasValues_Doctors");
            });

            modelBuilder.Entity<DoctorExaminationsValue>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Examination).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorExaminationsValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorExaminationsValues_Doctors");
            });

            modelBuilder.Entity<DoctorGeneralComplaintsValue>(entity =>
            {
                entity.Property(e => e.Complaint).IsRequired();

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorGeneralComplaintsValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorGeneralComplaintsValues_Doctors");
            });

            modelBuilder.Entity<DoctorMedicinesValue>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.MedicineName).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorMedicinesValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorMedicinesValues_Doctors");
            });

            modelBuilder.Entity<DoctorOperationTypesValue>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.OperationType).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorOperationTypesValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorOperationTypesValues_Doctors");
            });

            modelBuilder.Entity<DoctorRayAreasValue>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.RayArea).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorRayAreasValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorRayAreas_Doctors");
            });

            modelBuilder.Entity<DoctorRaysValue>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.RayName).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorRaysValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorRaysValues_Doctors");
            });

            modelBuilder.Entity<DoctorPhysicalTherapyAreaValue>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.PhysicalTherapyArea).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorPhysicalTherapyAreaValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorPhysicalTherapyAreas_Doctors");
            });

            modelBuilder.Entity<DoctorPhysicalTherapyValue>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.PhysicalTherapyName).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorPhysicalTherapiesValues)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorPhysicalTherapyValues_Doctors");
            });

            modelBuilder.Entity<Doctor>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.FullName).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.Property(e => e.AllDaysTimeFrom).HasColumnType("datetime");

                entity.Property(e => e.AllDaysTimeTo).HasColumnType("datetime");

                entity.Property(e => e.FridayTimeFrom).HasColumnType("datetime");

                entity.Property(e => e.MondayTimeFrom).HasColumnType("datetime");

                entity.Property(e => e.SaturdayTimeFrom).HasColumnType("datetime");

                entity.Property(e => e.SundayTimeFrom).HasColumnType("datetime");

                entity.Property(e => e.ThursdayTimeFrom).HasColumnType("datetime");

                entity.Property(e => e.TuesdayTimeFrom).HasColumnType("datetime");

                entity.Property(e => e.WednesdayTimeFrom).HasColumnType("datetime");

                entity.HasOne(d => d.EntryOrder)
                    .WithMany(p => p.Doctors)
                    .HasForeignKey(d => d.EntryOrderId)
                    .HasConstraintName("FK_Clinics_SysEntryOrderValues");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Doctors)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Doctors_AspNetUsers");

                entity.HasOne(d => d.Specialty)
                    .WithMany(p => p.Doctors)
                    .HasForeignKey(d => d.SpecialtyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Doctors_SysDoctorsSpecialties");
            });

            modelBuilder.Entity<DoctorBookingType>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Type).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorBookingTypes)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorBookingTypes_Doctors");
            });

            modelBuilder.Entity<DoctorDiscount>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Discount).IsRequired();

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorDiscounts)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorDiscounts_Doctors");
            });

            modelBuilder.Entity<DoctorService>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Service).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorServices)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorServices_Doctors");
            });

            modelBuilder.Entity<DoctorExpense>(entity =>
            {
                entity.Property(e => e.ExpenseAmount).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorExpenses)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorExpenses_Doctors");

                entity.HasOne(d => d.ExpenseItem)
                    .WithMany(p => p.DoctorExpenses)
                    .HasForeignKey(d => d.ExpenseItemId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorExpenses_DoctorExpenseItems");

                entity.HasOne(d => d.ExpenseType)
                    .WithMany(p => p.DoctorExpenses)
                    .HasForeignKey(d => d.ExpenseTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorExpenses_DoctorExpenseTypes");
            });

            modelBuilder.Entity<DoctorExpenseItemValue>(entity =>
            {
                entity.Property(e => e.ExpenseItem).IsRequired();

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.DoctorExpenseItems)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_DoctorExpenseItems_Doctors");
            });

            modelBuilder.Entity<SysDoctorExpenseTypeValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<Expense>(entity =>
            {
                entity.Property(e => e.ExpenseCost).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ExpenseDate).HasColumnType("datetime");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.ExpenseType)
                    .WithMany(p => p.Expenses)
                    .HasForeignKey(d => d.ExpenseTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Expenses_SysExpenseTypes");
            });

            modelBuilder.Entity<PatientAnalysis>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ResultDate).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Analysis)
                    .WithMany(p => p.PatientAnalysis)
                    .HasForeignKey(d => d.AnalysisId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientAnalysis_DoctorAnalysisValues");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientAnalysis)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientAnalysis_Patients");

                entity.HasOne(d => d.ResultGrade)
                    .WithMany(p => p.PatientAnalysis)
                    .HasForeignKey(d => d.ResultGradeId)
                    .HasConstraintName("FK_PatientAnalysis_SysDiseaseGradesValues");
            });

            modelBuilder.Entity<PatientAnalysisFile>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.Property(e => e.Url).IsRequired();

                entity.HasOne(d => d.FileType)
                    .WithMany(p => p.PatientAnalysisFiles)
                    .HasForeignKey(d => d.FileTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientAnalysisFiles_SysAnalysisFileTypesValues");

                entity.HasOne(d => d.PatientAnalysis)
                    .WithMany(p => p.PatientAnalysisFiles)
                    .HasForeignKey(d => d.PatientAnalysisId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientAnalysisFiles_PatientAnalysis");
            });

            modelBuilder.Entity<PatientDetailedComplaint>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.ComplaintChoice)
                    .WithMany(p => p.PatientDetailedComplaints)
                    .HasForeignKey(d => d.ComplaintChoiceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientDetailedComplaints_DoctorComplaintChoicesValues");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientDetailedComplaints)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientDetailedComplaints_Patients");

                entity.HasOne(d => d.DetailedComplaint)
                    .WithMany(p => p.PatientDetailedComplaints)
                    .HasForeignKey(d => d.DetailedComplaintId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientDetailedComplaints_DoctorDetailedComplaintsValues");
            });

            modelBuilder.Entity<PatientDiagnosis>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Diagnosis)
                    .WithMany(p => p.PatientDiagnosis)
                    .HasForeignKey(d => d.DiagnosisId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientDiagnosis_DoctorDiagnosisValues");

                entity.HasOne(d => d.Grade)
                    .WithMany(p => p.PatientDiagnosis)
                    .HasForeignKey(d => d.GradeId)
                    .HasConstraintName("FK_PatientDiagnosis_SysDiseaseGradesValues");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientDiagnosis)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientDiagnosis_Patients");
            });

            modelBuilder.Entity<PatientDisease>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Disease)
                    .WithMany(p => p.PatientDiseases)
                    .HasForeignKey(d => d.DiseaseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientDiseases_SysDiseasesQuestionsValues");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientDiseases)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientDiseases_Patients");
            });

            modelBuilder.Entity<PatientExamination>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.ExaminationArea)
                    .WithMany(p => p.PatientExaminations)
                    .HasForeignKey(d => d.ExaminationAreaId)
                    .HasConstraintName("FK_PatientExaminations_DoctorExaminationAreasValues");

                entity.HasOne(d => d.Examination)
                    .WithMany(p => p.PatientExaminations)
                    .HasForeignKey(d => d.ExaminationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientExaminations_DoctorExaminationsValues");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientExaminations)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientExaminations_Patients");
            });

            modelBuilder.Entity<PatientGeneralComplaint>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.GeneralComplaint)
                    .WithMany(p => p.PatientGeneralComplaints)
                    .HasForeignKey(d => d.GeneralComplaintId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientGeneralComplaints_DoctorGeneralComplaintsValues");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientGeneralComplaints)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientGeneralComplaints_Patients");
            });

            modelBuilder.Entity<PatientOperation>(entity =>
            {
                entity.Property(e => e.Cost).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.OperationDate).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.OperationType)
                    .WithMany(p => p.PatientOperations)
                    .HasForeignKey(d => d.OperationTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientOperations_DoctorOperationTypesValues");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientOperations)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientOperations_Patients");
            });

            modelBuilder.Entity<PatientPrescription>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientPrescriptions)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientPrescriptions_Patients");

                entity.HasOne(d => d.Pharmacy)
                    .WithMany(p => p.PatientPrescriptions)
                    .HasForeignKey(d => d.PharmacyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientPrescriptions_Pharmacies");
            });

            modelBuilder.Entity<PrescriptionMedicine>(entity =>
            {
                entity.HasKey(e => new { e.PrescriptionId, e.MedicineId });

                entity.HasOne(d => d.Dose)
                    .WithMany(p => p.PrescriptionMedicines)
                    .HasForeignKey(d => d.DoseId)
                    .HasConstraintName("FK_PrescriptionMedicines_SysMedicineDosesValues");

                entity.HasOne(d => d.Quantity)
                    .WithMany(p => p.PrescriptionMedicines)
                    .HasForeignKey(d => d.QuantityId)
                    .HasConstraintName("FK_PrescriptionMedicines_SysMedicineQuantityValues");

                entity.HasOne(d => d.Medicine)
                    .WithMany(p => p.PrescriptionMedicines)
                    .HasForeignKey(d => d.MedicineId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PrescriptionMedicines_DoctorMedicinesValue");

                entity.HasOne(d => d.Period)
                    .WithMany(p => p.PrescriptionMedicines)
                    .HasForeignKey(d => d.PeriodId)
                    .HasConstraintName("FK_PrescriptionMedicines_SysMedicinePeriodsValues");

                entity.HasOne(d => d.Timing)
                    .WithMany(p => p.PrescriptionMedicines)
                    .HasForeignKey(d => d.TimingId)
                    .HasConstraintName("FK_PrescriptionMedicines_SysMedicineTimingsValues");
            });

            modelBuilder.Entity<PatientRayFile>(entity =>
        {
            entity.Property(e => e.CreatedOn).HasColumnType("datetime");

            entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

            entity.Property(e => e.Url).IsRequired();

            entity.HasOne(d => d.FileType)
                .WithMany(p => p.PatientRayFiles)
                .HasForeignKey(d => d.FileTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PatientRayFiles_SysRayFileTypesValues");

            entity.HasOne(d => d.PatientRay)
                .WithMany(p => p.PatientRayFiles)
                .HasForeignKey(d => d.PatientRayId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PatientRayFiles_PatientRays");
        });

            modelBuilder.Entity<PatientRay>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.ResultDate).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientRays)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientRays_Patients");

                entity.HasOne(d => d.RayArea)
                    .WithMany(p => p.PatientRays)
                    .HasForeignKey(d => d.RayAreaId)
                    .HasConstraintName("FK_PatientRays_DoctorRayAreas");

                entity.HasOne(d => d.Ray)
                    .WithMany(p => p.PatientRays)
                    .HasForeignKey(d => d.RayId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientRays_DoctorRaysValues");

                entity.HasOne(d => d.ResultGrade)
                    .WithMany(p => p.PatientRays)
                    .HasForeignKey(d => d.ResultGradeId)
                    .HasConstraintName("FK_PatientRays_SysDiseaseGradesValues");
            });

            modelBuilder.Entity<PatientPhysicalTherapy>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientPhysicalTherapies)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientPhysicalTherapy_Patients");

                entity.HasOne(d => d.PhysicalTherapyArea)
                    .WithMany(p => p.PatientPhysicalTherapies)
                    .HasForeignKey(d => d.PhysicalTherapyAreaId)
                    .HasConstraintName("FK_PatientPhysicalTherapy_DoctorRayAreas");

                entity.HasOne(d => d.PhysicalTherapy)
                    .WithMany(p => p.PatientPhysicalTherapies)
                    .HasForeignKey(d => d.PhysicalTherapyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientPhysicalTherapy_DoctorRaysValues");
            });

            modelBuilder.Entity<PatientReferral>(entity =>
            {
                entity.Property(e => e.ApprovedOn).HasColumnType("datetime");

                entity.Property(e => e.CanceledOn).HasColumnType("datetime");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.Note).IsRequired();

                entity.Property(e => e.ReadOn).HasColumnType("datetime");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.PatientReferrals)
                    .HasForeignKey(d => d.PatientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientReferrals_Patients");

                entity.HasOne(d => d.ReferralToDoctor)
                    .WithMany(p => p.PatientReferrals)
                    .HasForeignKey(d => d.ReferralToDoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PatientReferrals_Doctors");

                entity.HasOne(d => d.PatientDiagnosis)
                    .WithMany(p => p.PatientReferrals)
                    .HasForeignKey(d => d.PatientDiagnosisId)
                    .HasConstraintName("FK_PatientReferrals_PatientDiagnosis");
            });

            modelBuilder.Entity<Patient>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BodyMass).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.FullName).IsRequired();

                entity.Property(e => e.Length).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Temperature).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.Property(e => e.Weight).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.BloodPressure)
                    .WithMany(p => p.Patients)
                    .HasForeignKey(d => d.BloodPressureId)
                    .HasConstraintName("FK_Patients_SysBloodPressureValues");

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Patients)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK_Patients_SysCitiesValues");

                entity.HasOne(d => d.Clinic)
                    .WithMany(p => p.Patients)
                    .HasForeignKey(d => d.ClinicId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Patients_Clinics");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.Patients)
                    .HasForeignKey(d => d.DoctorId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Patients_Doctors");

                entity.HasOne(d => d.Governorate)
                    .WithMany(p => p.Patients)
                    .HasForeignKey(d => d.GovernorateId)
                    .HasConstraintName("FK_Patients_SysGovernoratesValues");

                entity.HasOne(d => d.SocialStatus)
                    .WithMany(p => p.Patients)
                    .HasForeignKey(d => d.SocialStatusId)
                    .HasConstraintName("FK_Patients_SysSocialStatusValues");
            });

            modelBuilder.Entity<Pharmacy>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.PharmacyName).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Pharmacies)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Pharmacies_AspNetUsers");
            });

            modelBuilder.Entity<Plan>(entity =>
            {
                entity.Property(e => e.AnnualRenewalFee).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.MonthlyRenewalFee).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.SignUpFee).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Title).IsRequired();

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.SubscriberType)
                    .WithMany(p => p.Plans)
                    .HasForeignKey(d => d.SubscriberTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Plans_SysSubscriberTypeValues");

                entity.HasOne(d => d.RenewalType)
                    .WithMany(p => p.Plans)
                    .HasForeignKey(d => d.RenewalTypeId)
                    .HasConstraintName("FK_Plans_SysRenewalTypeValues");
            });

            modelBuilder.Entity<Subscription>(entity =>
            {
                entity.Property(e => e.AnnualRenewalFee).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.EndDate).HasColumnType("date");

                entity.Property(e => e.MonthlyRenewalFee).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.SignUpFee).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.StartDate).HasColumnType("date");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Subscriptions)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Subscriptions_AspNetUsers");

                entity.HasOne(d => d.Plan)
                    .WithMany(p => p.Subscriptions)
                    .HasForeignKey(d => d.PlanId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Subscriptions_Plans");

                entity.HasOne(d => d.SubscriberType)
                    .WithMany(p => p.Subscriptions)
                    .HasForeignKey(d => d.SubscriberTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Subscriptions_SysSubscriberTypeValues");

                entity.HasOne(d => d.SubscriptionType)
                    .WithMany(p => p.Subscriptions)
                    .HasForeignKey(d => d.SubscriptionTypeId)
                    .HasConstraintName("FK_Subscriptions_SysSubscriptionTypeValues");
            });

            modelBuilder.Entity<SubscriptionPayment>(entity =>
            {
                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.NextPaymentDate).HasColumnType("datetime");

                entity.Property(e => e.Paid).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.UpdatedOn).HasColumnType("datetime");

                entity.HasOne(d => d.Subscription)
                    .WithMany(p => p.SubscriptionPayments)
                    .HasForeignKey(d => d.SubscriptionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SubscriptionPayments_Subscriptions");
            });

            modelBuilder.Entity<SysAnalysisFileTypesValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysBloodPressureValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysCitiesValue>(entity =>
            {
                entity.HasOne(d => d.Gov)
                    .WithMany(p => p.SysCitiesValues)
                    .HasForeignKey(d => d.GovId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SysCitiesValues_SysGovernoratesValues");
            });

            modelBuilder.Entity<SysDiseaseGradesValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysDiseasesQuestionsValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysDoctorsSpecialty>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysEntryOrderValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysExpenseType>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysGovernoratesValue>(entity =>
            {
            });

            modelBuilder.Entity<SysMedicineDosesValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysMedicineQuantityValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysMedicinePeriodsValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysMedicineTimingsValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysPatientRecordSectionsValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysRayFileTypesValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysRenewalTypeValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysSocialStatusValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysSubscriberTypeValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });

            modelBuilder.Entity<SysSubscriptionTypeValue>(entity =>
            {
                entity.Property(e => e.Text).IsRequired();

                entity.Property(e => e.Value).IsRequired();
            });
        }
    }
}
