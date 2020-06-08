using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;
using clinic_api.Data;
using clinic_api.DTOs;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PayController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public PayController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Payment
        [HttpGet("{id}/{doctorId}/{paymentDate}")]
        public async Task<ActionResult<GetPaymentListDTO>> GetPayments(Guid id, Guid doctorId, string paymentDate)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var clinic = await _context.Clinics.Where(c => c.DoctorClinics.Any(d => d.DoctorId == doctorId))
                .Include(c => c.DoctorClinics).Include(e => e.EntryOrder).FirstOrDefaultAsync();
            int[] weekDays = { 6, 0, 1, 2, 3, 4, 5 };
            int[] weekEnds = weekDays.Except(clinic.WorkDays.Split(",").ToArray().Select(int.Parse).ToArray()).ToArray();

            var paymentList = await _context.BookingPayments
                .Where(p => p.Booking.DoctorId == doctorId && p.Booking.IsCanceled != true && p.Booking.Patient.IsDeleted != true && p.CreatedOn.Date == DateTime.Parse(paymentDate).Date)
                .Include(b => b.Booking).ThenInclude(p => p.Patient)
                .Include(b => b.Booking).ThenInclude(t => t.Type)
                .Include(b => b.Booking).ThenInclude(s => s.BookingServices)
                .Include(b => b.Booking).ThenInclude(d => d.Discount)
                .OrderByDescending(p => p.CreatedOn)
                .Select(p => new PaymentList
                {
                    BookId = p.Booking.Id,
                    PatientCodeId = p.Booking.Patient.SeqNo,
                    PatientId = p.Booking.PatientId,
                    PaymentDate = p.CreatedOn,
                    Type = p.Booking.Type.Text,
                    Services = p.Booking.BookingServices.Select(s => s.Service.Service).ToArray(),
                    Name = p.Booking.Patient.FullName,
                    TotalPrice = p.Booking.Type.Price + (p.Booking.BookingServices.Any() ? p.Booking.BookingServices.Sum(s => s.Service.Price) : 0) - (p.Booking.Discount != null ? ((bool)p.Booking.Discount.IsPercent ? ((p.Booking.Type.Price + (p.Booking.BookingServices.Any() ? p.Booking.BookingServices.Sum(s => s.Service.Price) : 0) * p.Booking.Discount.Price) / 100) : p.Booking.Discount.Price) : 0),
                    Paid = p.Paid,
                }).ToListAsync();

            var model = new GetPaymentListDTO
            {
                PaymentsList = paymentList,
                WeekEnds = weekEnds,
            };

            return model;
        }

        // GET: api/Payment/GetIncomeMonthly
        [HttpGet("GetIncomeMonthly/{id}/{doctorId}")]
        public async Task<ActionResult<IEnumerable<MonthPaymentDTO>>> GetIncomeMonthly(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var model = await _context.BookingPayments
                .Where(p => p.Booking.DoctorId == doctorId && p.Booking.IsCanceled != true && p.Booking.Patient.IsDeleted != true)
                .Include(b => b.Booking)
                .GroupBy(p => new { p.CreatedOn.Month, p.CreatedOn.Year})
                .OrderBy(y => y.Key.Year).ThenBy(m => m.Key.Month)
                .Select(p => new MonthPaymentDTO
                {
                    Month = p.Key.Month,
                    Year = p.Key.Year,
                    TotalPaid = p.Sum(x => x.Paid)
                }).ToListAsync();

            return model;
        }
    }
}