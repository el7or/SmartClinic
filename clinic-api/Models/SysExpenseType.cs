using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Models
{
    public class SysExpenseType
    {
        public SysExpenseType()
        {
            Expenses = new HashSet<Expense>();
        }

        public int Id { get; set; }

        [StringLength(256)]
        public string Value { get; set; }

        [StringLength(256)]
        public string Text { get; set; }

        public virtual ICollection<Expense> Expenses { get; set; }
    }
}
