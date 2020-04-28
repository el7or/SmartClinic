using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class OperationsDoctorDTO
    {
        public Guid DoctorId { get; set; }
        public List<Operation> Operations { get; set; }
    }
    public class Operation
    {
        public int Id { get; set; }
        public string OperationType { get; set; }
    }

    public class OperationCreateDTO
    {
        public Guid DoctorId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string OperationType { get; set; }
    }
}