using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class GetPaymentListDTO
    {
        public List<PaymentList> PaymentsList { get; set; }
        public int[] WeekEnds { get; set; }
    }
    public class PaymentList
    {
        public int BookId { get; set; }
        public int PatientCodeId { get; set; }
        public Guid PatientId { get; set; }
        public DateTime PaymentDate { get; set; }
        public string Type { get; set; }
        public string[] Services { get; set; }
        public string Name { get; set; }
        public decimal? TotalPrice { get; set; }
        public decimal Paid { get; set; }
    }

    public class MonthPaymentDTO
    {
        public int Month { get; set; }
        public int Year { get; set; }
        public decimal TotalPaid { get; set; }
    }
}
