using System;
using System.Collections.Generic;

namespace clinic_api.Models
{
    public partial class PatientOperation
    {
        public int Id { get; set; }
        public Guid PatientId { get; set; }
        public int OperationTypeId { get; set; }
        public DateTime? OperationDate { get; set; }
        public string Place { get; set; }
        public decimal? Cost { get; set; }
        public string Note { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual DoctorOperationTypesValue OperationType { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
