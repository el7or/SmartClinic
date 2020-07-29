using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Models
{
    public class DoctorExpense
    {
        public int Id { get; set; }
        public Guid DoctorId { get; set; }
        public int ExpenseItemId { get; set; }
        public int ExpenseTypeId { get; set; }
        public DateTime ExpenseDate { get; set; }
        public decimal ExpenseAmount { get; set; }
        public string Note { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual Doctor Doctor { get; set; }
        public virtual DoctorExpenseItemValue ExpenseItem { get; set; }
        public virtual SysDoctorExpenseTypeValue ExpenseType { get; set; }
    }
}
