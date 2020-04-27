using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class ComplaintDoctorDTO
    {
        public Guid DoctorId { get; set; }
        public List<GeneralComplaint> GeneralComplaints { get; set; }
        public List<DetailedComplaint> DetailedComplaints { get; set; }
    }

    public class GeneralComplaint
    {
        public int Id { get; set; }
        public string Complaint { get; set; }
    }

    public class DetailedComplaint
    {
        public int Id { get; set; }
        public string Complaint { get; set; }
        public int ChoicesCount { get; set; }
    }

    public class ComplaintCreateDTO
    {
        public Guid DoctorId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Complaint { get; set; }
    }

    public class ComplaintCreateChoiceDTO
    {
        public Guid DoctorId { get; set; }
        public int DetailedComplaintId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Choice { get; set; }
    }
}