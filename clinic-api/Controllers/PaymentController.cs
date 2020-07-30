using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;
using clinic_api.Data;
using clinic_api.DTOs;
using clinic_api.Helper;
using clinic_api.Models;
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

        // GET: api/Pay
        [HttpGet("{id}/{doctorId}/{paymentDate}")]
        public async Task<ActionResult<GetIncomeListDTO>> GetPayments(Guid id, Guid doctorId, string paymentDate)
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
                .Select(p => new IncomeList
                {
                    BookId = p.Booking.Id,
                    PatientCodeId = p.Booking.Patient.SeqNo,
                    PatientId = p.Booking.PatientId,
                    PaymentDate = p.CreatedOn,
                    BookingDate = p.Booking.BookingDateTime,
                    Type = p.Booking.Type.Text,
                    Services = p.Booking.BookingServices.Select(s => s.Service.Service).ToArray(),
                    Name = p.Booking.Patient.FullName,
                    TotalPrice = p.Booking.Type.Price + (p.Booking.BookingServices.Any() ? p.Booking.BookingServices.Sum(s => s.Service.Price) : 0) - (p.Booking.Discount != null ? ((bool)p.Booking.Discount.IsPercent ? ((p.Booking.Type.Price + (p.Booking.BookingServices.Any() ? p.Booking.BookingServices.Sum(s => s.Service.Price) : 0) * p.Booking.Discount.Price) / 100) : p.Booking.Discount.Price) : 0),
                    Paid = p.Paid,
                }).ToListAsync();

            var model = new GetIncomeListDTO
            {
                PaymentsList = paymentList,
                WeekEnds = weekEnds,
            };

            return model;
        }

        // GET: api/Pay/GetIncomeMonthly
        [HttpGet("GetIncomeMonthly/{id}/{doctorId}")]
        public async Task<ActionResult<IEnumerable<MonthIncomeDTO>>> GetIncomeMonthly(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var model = await _context.BookingPayments
                .Where(p => p.Booking.DoctorId == doctorId && p.Booking.IsCanceled != true && p.Booking.Patient.IsDeleted != true)
                .Include(b => b.Booking)
                .GroupBy(p => new { p.CreatedOn.Month, p.CreatedOn.Year })
                .OrderBy(y => y.Key.Year).ThenBy(m => m.Key.Month)
                .Select(p => new MonthIncomeDTO
                {
                    Month = p.Key.Year.ToString() + "-" + p.Key.Month.ToString() + "-1",
                    TotalPaid = p.Sum(x => x.Paid)
                }).ToListAsync();

            return model;
        }

        // GET: api/Pay/GetExpenseMonthly
        [HttpGet("GetExpenseMonthly/{id}/{doctorId}")]
        public async Task<ActionResult<IEnumerable<GetExpenseListDTO>>> GetExpenseMonthly(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var doctorExpenses = await _context.DoctorExpenses
                .Where(p => p.DoctorId == doctorId && p.IsDeleted != true)
                .Include(b => b.ExpenseItem).Include(t => t.ExpenseType)
                .Select(e => new ExpenseList
                {
                    Id = e.Id,
                    Date = e.ExpenseDate,
                    Amount = e.ExpenseAmount,
                    Item = e.ExpenseItem.ExpenseItem,
                    Type = e.ExpenseType.Value,
                    Note = e.Note
                }).ToListAsync();

            var model = doctorExpenses
                .GroupBy(p => new { p.Date.Month, p.Date.Year })
                .OrderByDescending(y => y.Key.Year).ThenByDescending(m => m.Key.Month)
                .Select(p => new GetExpenseListDTO
                {
                    Month = p.Key.Year.ToString() + "-" + p.Key.Month.ToString() + "-1",
                    ExpensesList = p.OrderByDescending(d => d.Date)
                }).ToList();

            return model;
        }

        // GET: api/Pay/GetExpenseDetails
        [HttpGet("GetExpenseDetails/{id}/{doctorId}/{expenseId}")]
        public async Task<ActionResult<GetExpenseDetailsDTO>> GetExpenseDetails(Guid id, Guid doctorId, int expenseId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var model = new GetExpenseDetailsDTO
            {
                ExpenseDetails = expenseId == 0 ? null : await _context.DoctorExpenses.Where(i => i.Id == expenseId).Select(e => new ExpenseDetailsDTO
                {
                    Id = e.Id,
                    Amount = e.ExpenseAmount,
                    Date = e.ExpenseDate,
                    ItemId = e.ExpenseItemId,
                    TypeId = e.ExpenseTypeId,
                    Note = e.Note
                }).FirstOrDefaultAsync(),
                ExpenseItemValues = await _context.DoctorExpenseItems.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                .OrderBy(e => e.ExpenseItem)
                .Select(e => new ExpenseItemValueDTO
                {
                    Id = e.Id,
                    Text = e.ExpenseItem
                }).ToListAsync(),
                ExpenseTypeValues = await _context.SysDoctorExpenseTypes
                .Select(e => new ExpenseItemValueDTO
                {
                    Id = e.Id,
                    Text = e.Value
                }).ToListAsync(),
            };
            return model;
        }

        // POST: api/Pay/PostExpenseItem
        [HttpPost("PostExpenseItem/{id}")]
        public async Task<ActionResult<ExpenseItemValueDTO>> PostExpenseItem(Guid id, PostExpenseItemValueDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var newItem = new DoctorExpenseItemValue
            {
                DoctorId = model.DoctorId,
                ExpenseItem = model.Item,
                CreatedBy = id,
                IsActive = true,
                IsDeleted = false,
                CreatedOn = DateTime.Now.ToEgyptTime(),
                UpdatedBy = id,
                UpdatedOn = DateTime.Now.ToEgyptTime()
            };
            _context.DoctorExpenseItems.Add(newItem);

            await _context.SaveChangesAsync();

            return new ExpenseItemValueDTO
            {
                Id = newItem.Id,
                Text = newItem.ExpenseItem
            };
        }

        // POST: api/Pay/
        [HttpPost("{id}/{doctorId}")]
        public async Task<IActionResult> PostExpense(Guid id, Guid doctorId, ExpenseDetailsDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var newExpense = new DoctorExpense
            {
                DoctorId = doctorId,
                ExpenseDate = model.Date,
                ExpenseAmount = model.Amount,
                ExpenseItemId = model.ItemId,
                ExpenseTypeId = model.TypeId,
                Note = model.Note,
                CreatedBy = id,
                IsDeleted = false,
                CreatedOn = DateTime.Now.ToEgyptTime(),
                UpdatedBy = id,
                UpdatedOn = DateTime.Now.ToEgyptTime()
            };
            _context.DoctorExpenses.Add(newExpense);

            await _context.SaveChangesAsync();

            return Ok();
        }

        // PUT: api/Pay/
        [HttpPut("{id}")]
        public async Task<IActionResult> PutExpense(Guid id, ExpenseDetailsDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var expense = _context.DoctorExpenses.Find(model.Id);
            expense.ExpenseAmount = model.Amount;
            expense.ExpenseDate = model.Date;
            expense.ExpenseItemId = model.ItemId;
            expense.ExpenseTypeId = model.TypeId;
            expense.Note = model.Note;
            expense.UpdatedBy = id;
            expense.UpdatedOn = DateTime.Now.ToEgyptTime();

            _context.Entry(expense).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return Ok();
        }

        // DELETE: api/Pay/
        [HttpDelete("{id}/{expenseId}")]
        public async Task<IActionResult> DeleteExpense(Guid id, int expenseId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var expense = _context.DoctorExpenses.Find(expenseId);
            expense.IsDeleted = true;
            expense.UpdatedBy = id;
            expense.UpdatedOn = DateTime.Now.ToEgyptTime();

            _context.Entry(expense).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return Ok();
        }

        // GET: api/Pay/GetProfitDaily
        [HttpGet("GetProfitDaily/{id}/{doctorId}")]
        public async Task<ActionResult<IEnumerable<DayProfitDTO>>> GetProfitDaily(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var dailyIncome = await _context.BookingPayments
                .Where(p => p.Booking.DoctorId == doctorId && p.Booking.IsCanceled != true && p.Booking.Patient.IsDeleted != true)
                .Include(b => b.Booking)
                .GroupBy(p => new { p.CreatedOn.Day, p.CreatedOn.Month, p.CreatedOn.Year })
                .OrderByDescending(y => y.Key.Year).ThenByDescending(m => m.Key.Month).ThenByDescending(m => m.Key.Day)
                .Select(p => new DayProfitDTO
                {
                    Day = p.Key.Year.ToString() + "-" + p.Key.Month.ToString() + "-" + p.Key.Day.ToString(),
                    TotalIncomes = p.Sum(x => x.Paid)
                }).ToListAsync();

            var dailyExpense = await _context.DoctorExpenses
                .Where(p => p.DoctorId == doctorId && p.IsDeleted != true && p.ExpenseTypeId == 1) // المصروفات المثرية اليومية
                .GroupBy(p => new { p.ExpenseDate.Day, p.ExpenseDate.Month, p.ExpenseDate.Year })
                .OrderByDescending(y => y.Key.Year).ThenByDescending(m => m.Key.Month).ThenByDescending(m => m.Key.Day)
                .Select(p => new DayProfitDTO
                {
                    Day = p.Key.Year.ToString() + "-" + p.Key.Month.ToString() + "-" + p.Key.Day.ToString(),
                    TotalExpenses = p.Sum(x => x.ExpenseAmount)
                }).ToListAsync();

            foreach (var item in dailyIncome)
            {
                var sameDay = dailyExpense.FirstOrDefault(m => m.Day == item.Day);
                if (sameDay != null)
                {
                    item.TotalExpenses = sameDay.TotalExpenses;
                }
            }

            return dailyIncome;
        }

        // GET: api/Pay/GetProfitMonthly
        [HttpGet("GetProfitMonthly/{id}/{doctorId}")]
        public async Task<ActionResult<IEnumerable<MonthProfitDTO>>> GetProfitMonthly(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var monthlyIncome = await _context.BookingPayments
                .Where(p => p.Booking.DoctorId == doctorId && p.Booking.IsCanceled != true && p.Booking.Patient.IsDeleted != true)
                .Include(b => b.Booking)
                .GroupBy(p => new { p.CreatedOn.Month, p.CreatedOn.Year })
                .OrderByDescending(y => y.Key.Year).ThenByDescending(m => m.Key.Month)
                .Select(p => new MonthProfitDTO
                {
                    Month = p.Key.Year.ToString() + "-" + p.Key.Month.ToString() + "-1",
                    TotalIncomes = p.Sum(x => x.Paid)
                }).ToListAsync();

            var monthlyExpense = await _context.DoctorExpenses
                .Where(p => p.DoctorId == doctorId && p.IsDeleted != true)
                .GroupBy(p => new { p.ExpenseDate.Month, p.ExpenseDate.Year })
                .OrderByDescending(y => y.Key.Year).ThenByDescending(m => m.Key.Month)
                .Select(p => new MonthProfitDTO
                {
                    Month = p.Key.Year.ToString() + "-" + p.Key.Month.ToString() + "-1",
                    TotalExpenses = p.Sum(x => x.ExpenseAmount)
                }).ToListAsync();

            foreach (var item in monthlyIncome)
            {
                var sameMonth = monthlyExpense.FirstOrDefault(m => m.Month == item.Month);
                if (sameMonth != null)
                {
                    item.TotalExpenses = sameMonth.TotalExpenses;
                }
            }

            //var model = monthlyIncome.Join(monthlyExpense, arg => arg.Month, arg => arg.Month,
            //    (first, second) => new MonthProfitDTO { Month = first.Month, TotalIncomes = first.TotalIncomes, TotalExpenses = second.TotalExpenses }).ToList();


            return monthlyIncome;
        }
    }
}