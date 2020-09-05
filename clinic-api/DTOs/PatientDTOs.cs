﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class PatientsGetPagedDTO
    {
        public IEnumerable<PatientsListDTO> Patients { get; set; }
        public PagedList Pagination { get; set; }
        
    }
    public class PatientsListDTO
    {
        public Guid Id { get; set; }
        public int CodeId { get; set; }
        public string Name { get; set; }
        public string Mobile { get; set; }
        public int VisitsCount { get; set; }
        public DateTime? LastVisit { get; set; }
        public string LastVisitType { get; set; }
        public int LastVisitBookId { get; set; }
    }
    public class PagedList
    {
        public int PageCount { get; set; }
        public int TotalItemCount { get; set; }
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
    }

    public class PatientGetDTO
    {
        public Guid PatientId { get; set; }
        public string Name { get; set; }
        public int? Age { get; set; }
        public int VisitsCount { get; set; }
        public string AreaTextEN { get; set; }
        public string AreaTextAR { get; set; }
    }

    public class PatientValuesGetDTO
    {
        public List<SocialStatusDTO> SocialStatus { get; set; }
        public List<CityDTO> CityValue { get; set; }
        public PatientGetBasicDTO BasicInfo { get; set; }
    }
    public class PatientGetBasicDTO
    {
        public Guid PatientId { get; set; }
        public string Name { get; set; }
        public string Mobile { get; set; }
        public string Mobile2 { get; set; }
        public int? Age { get; set; }
        public bool? Gender { get; set; }
        public int? Status { get; set; }
        public string Career { get; set; }
        public int? City { get; set; }
        public int? Area { get; set; }
        public Guid? DoctorId { get; set; }
        public string Note { get; set; }
    }

    public class PatientPostDTO
    {
        public Guid DoctorId { get; set; }
        public Guid ClinicId { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string Phone2 { get; set; }
        public int? Age { get; set; }
        public bool? Gender { get; set; }
        public int? SocialStatusId { get; set; }
        public string Career { get; set; }
        public int? GovernorateId { get; set; }
        public int? CityId { get; set; }
        public string Note { get; set; }
    }

    public class PatientPutDTO
    {
        public Guid PatientId { get; set; }
        public Guid DoctorId { get; set; }
        public Guid ClinicId { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string Phone2 { get; set; }
        public int? Age { get; set; }
        public bool? Gender { get; set; }
        public int? SocialStatusId { get; set; }
        public string Career { get; set; }
        public int? GovernorateId { get; set; }
        public int? CityId { get; set; }
        public string Note { get; set; }
    }

    public class GetPatientRecordDTO
    {
        public List<RecordSectionDTO> RecordItems { get; set; }
        public int TodayBookingId { get; set; }
    }
}
