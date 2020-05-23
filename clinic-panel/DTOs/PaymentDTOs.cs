using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class PaymentDTOs
    {
        public decimal AllPayments { get; set; }
        //public decimal DuePayments { get; set; }
        public decimal ExpensesBalance { get; set; }
        public decimal SpentExpenses { get; set; }
        public decimal RemainingExpenses { get; set; }
        public decimal AhmedProfits { get; set; }
        public decimal AhmedWithdrawnProfits { get; set; }
        public decimal AhmedRemainingProfits { get; set; }
        public decimal HatemProfits { get; set; }
        public decimal HatemWithdrawnProfits { get; set; }
        public decimal HatemRemainingProfits { get; set; }
    }

    public class ExpenseDTO
    {
        public decimal ExpenseCost { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime ExpenseDate { get; set; }
        public string Note { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        [DataType(DataType.Date)]
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
    }

    public class CreateExpenseDTO
    {
        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal ExpenseCost { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public DateTime ExpenseDate { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Note { get; set; }
    }

    public class CreateWithdrawalDTO
    {
        public int ExpenseTypeId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal ExpenseCost { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public DateTime ExpenseDate { get; set; }
    }
}