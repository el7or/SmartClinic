using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class GetIncomeListDTO
    {
        public List<IncomeList> PaymentsList { get; set; }
        public int[] WeekEnds { get; set; }
    }
    public class IncomeList
    {
        public int BookId { get; set; }
        public int PatientCodeId { get; set; }
        public Guid PatientId { get; set; }
        public DateTime PaymentDate { get; set; }
        public DateTime BookingDate { get; set; }
        public string Type { get; set; }
        public string[] Services { get; set; }
        public string Name { get; set; }
        public decimal? TotalPrice { get; set; }
        public decimal Paid { get; set; }
    }
    public class MonthIncomeDTO
    {
        public string Month { get; set; }
        public decimal TotalPaid { get; set; }
    }

    public class GetExpenseListDTO
    {
        public string Month { get; set; }
        public IEnumerable<ExpenseList> ExpensesList { get; set; }
    }
    public class ExpenseList
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public decimal Amount { get; set; }
        public string Item { get; set; }
        public string Note { get; set; }
    }
    public class ExpenseItemValueDTO
    {
        public int Id { get; set; }
        public string Text { get; set; }
    }
    public class PostExpenseItemValueDTO
    {
        public Guid DoctorId { get; set; }
        public string Item { get; set; }
    }
    public class PostExpenseDTO
    {
        public DateTime Date { get; set; }
        public decimal Amount { get; set; }
        public int ItemId { get; set; }
        public string Note { get; set; }
    }

    public class MonthProfitDTO
    {
        public string Month { get; set; }
        public decimal TotalIncomes { get; set; }
        public decimal TotalExpenses { get; set; }
    }
}
