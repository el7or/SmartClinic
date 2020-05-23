using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Models
{
    public class Expense
    {
        public int Id { get; set; }
        public int ExpenseTypeId { get; set; }
        public decimal ExpenseCost { get; set; }
        public DateTime ExpenseDate { get; set; }
        public string Note { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual SysExpenseType ExpenseType { get; set; }
    }
}
