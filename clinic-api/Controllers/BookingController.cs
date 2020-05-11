using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using clinic_api.Data;
using clinic_api.Models;
using System.IdentityModel.Tokens.Jwt;
using clinic_api.DTOs;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public BookingController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Booking
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Booking>>> GetBookings()
        {
            return await _context.Bookings.ToListAsync();
        }

        // GET: api/Booking/5
        [HttpGet("{id}/{patientId}/{bookingId}/{bookingDate}")]
        public async Task<ActionResult<BookingGetDTO>> GetBooking(Guid id, Guid patientId, int bookingId, string bookingDate)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = await _context.Patients.Where(i => i.Id == patientId)
                .Include(c => c.Clinic).ThenInclude(t => t.ClinicBookingTypes)
                .Include(c => c.Clinic).ThenInclude(s => s.ClinicServices)
                .Include(c => c.Clinic).ThenInclude(d => d.ClinicDiscounts)
                .Include(b => b.Bookings).ThenInclude(t => t.Type).FirstOrDefaultAsync();
            var patientLastBooking = patient.Bookings.OrderByDescending(d => d.BookingDateTime).FirstOrDefault();
            int[] weekDays = { 6, 0, 1, 2, 3, 4, 5 };

            if (patient == null)
            {
                return NotFound();
            }
            var model = new BookingGetDTO
            {
                BookingSetting = new BookingSetting
                {
                    PatientName = patient.FullName,
                    PatientLastBookingDate = patientLastBooking?.BookingDateTime,
                    PatientLastBookingType = patientLastBooking?.Type.Text,
                    ClinicWeekEnds = weekDays.Except(patient.Clinic.WorkDays.Split(",").ToArray().Select(int.Parse).ToArray()).ToArray(),
                    ClinicBookingPeriod = patient.Clinic.BookingPeriod,
                    ClinicConsultExpiration = patient.Clinic.ConsultExpiration,
                    ClinicDayTimeFrom = (bool)patient.Clinic.IsAllDaysSameTime ? patient.Clinic.AllDaysTimeFrom : (DateTime)patient.Clinic.GetType().GetProperty(DateTime.Parse(bookingDate).DayOfWeek.ToString() + "TimeFrom").GetValue(patient.Clinic, null),
                    ClinicDayTimeTo = (bool)patient.Clinic.IsAllDaysSameTime ? patient.Clinic.AllDaysTimeTo : (DateTime)patient.Clinic.GetType().GetProperty(DateTime.Parse(bookingDate).DayOfWeek.ToString() + "TimeTo").GetValue(patient.Clinic, null),
                    ClinicBookingTypes = patient.Clinic.ClinicBookingTypes.Select(t => new BookingType { Id = t.Id, Type = t.Text, Price = t.Price }).ToList(),
                    ClinicBookingServices = patient.Clinic.ClinicServices.Select(t => new ServiceType { Id = t.Id, Service = t.Service, Price = t.Price }).ToList(),
                    ClinicBookingDiscounts = patient.Clinic.ClinicDiscounts.Select(t => new DiscountType { Id = t.Id, Discount = t.Discount, Price = t.Price, IsPercent = t.IsPercent }).ToList(),
                    DoctorAllBookingSameDay = _context.Bookings.Where(b => b.Patient.DoctorId == patient.DoctorId && b.BookingDateTime.Date == DateTime.Parse(bookingDate).Date).Include(t => t.Type).Select(b => new BookingBrief { BookId = b.Id, Time = b.BookingDateTime, Type = b.Type.Text }).ToList()
                }
            };
            if (bookingId != 0)
            {
                var booking = await _context.Bookings.FindAsync(id);
                model.BookingDetails = new BookingDetails
                {
                    BookingDateTime = booking.BookingDateTime,
                    BookingTypeId = booking.TypeId,
                    BookingServicesIds = booking.BookingServices.Select(s => s.ServiceId).ToArray(),
                    BookingDiscountId = booking.DiscountId,
                    BookingPayments = booking.BookingPayments.Sum(p => p.Paid)
                };
            }
            else
            {
                model.BookingDetails = new BookingDetails
                {
                    BookingTypeId = model.BookingSetting.ClinicBookingTypes[0].Id
                };
            }

            return model;
        }

        // PUT: api/Booking/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBooking(int id, Booking booking)
        {
            if (id != booking.Id)
            {
                return BadRequest();
            }

            _context.Entry(booking).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookingExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Booking
        [HttpPost]
        public async Task<ActionResult<Booking>> PostBooking(Booking booking)
        {
            _context.Bookings.Add(booking);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBooking", new { id = booking.Id }, booking);
        }

        // DELETE: api/Booking/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Booking>> DeleteBooking(int id)
        {
            var booking = await _context.Bookings.FindAsync(id);
            if (booking == null)
            {
                return NotFound();
            }

            _context.Bookings.Remove(booking);
            await _context.SaveChangesAsync();

            return booking;
        }

        private bool BookingExists(int id)
        {
            return _context.Bookings.Any(e => e.Id == id);
        }
    }
}
