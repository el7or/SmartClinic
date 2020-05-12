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

        // GET: api/Booking
        [HttpGet("GetPatientBookings/{id}/{patientId}")]
        public async Task<ActionResult<IEnumerable<GetPatientBooking>>> GetPatientBookings(Guid id,Guid patientId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = _context.Bookings.Where(p => p.PatientId == patientId).Include(t => t.Type).Include(s => s.BookingServices).OrderByDescending(d => d.CreatedOn).Select(b => new GetPatientBooking
            {
                BookId = b.Id,
                Date = b.BookingDateTime,
                Type = b.Type.Text,
                Servcies = b.BookingServices.Select(s => s.Service.Service).ToArray(),
                IsEnter = b.IsEnter,
                IsCanceled = b.IsCanceled
            });
            return await model.ToListAsync();
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
            var patientLastBooking = patient.Bookings.Where(b => b.Id != bookingId).OrderByDescending(d => d.BookingDateTime).FirstOrDefault();
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
                    DoctorAllBookingSameDay = _context.Bookings.Where(b => b.Patient.DoctorId == patient.DoctorId && b.BookingDateTime.Date == DateTime.Parse(bookingDate).Date).Include(t => t.Type).Select(b => new BookingBrief
                    {
                        BookId = b.Id,
                        Time = new DateTime(2020, 1, 1, b.BookingDateTime.Hour, b.BookingDateTime.Minute, 0),
                        Type = b.Type.Text
                    }).ToList()
                }
            };
            if (bookingId != 0)
            {
                var booking = await _context.Bookings.Where(b => b.Id == bookingId).Include(s => s.BookingServices).Include(p => p.BookingPayments).FirstOrDefaultAsync();
                model.BookingDetails = new BookingDetails
                {
                    BookingDateTime = booking.BookingDateTime,
                    BookingTypeId = booking.TypeId,
                    BookingServicesIds = booking.BookingServices.Select(s => s.ServiceId).ToArray(),
                    BookingDiscountId = booking.DiscountId,
                    BookingPayments = booking.BookingPayments.Sum(p => p.Paid),
                    IsCanceled = booking.IsCanceled
                };
            }

            return model;
        }

        // GET: api/Booking/GetChangeDate/5
        [HttpGet("GetChangeDate/{id}/{patientId}/{bookingDate}")]
        public async Task<ActionResult<BookingGetChangeDateDTO>> GetChangeDate(Guid id, Guid patientId, string bookingDate)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = await _context.Patients.Where(i => i.Id == patientId).Include(c => c.Clinic).FirstOrDefaultAsync();

            if (patient == null)
            {
                return NotFound();
            }
            var model = new BookingGetChangeDateDTO
            {
                ClinicDayTimeFrom = (bool)patient.Clinic.IsAllDaysSameTime ? patient.Clinic.AllDaysTimeFrom : (DateTime)patient.Clinic.GetType().GetProperty(DateTime.Parse(bookingDate).DayOfWeek.ToString() + "TimeFrom").GetValue(patient.Clinic, null),
                ClinicDayTimeTo = (bool)patient.Clinic.IsAllDaysSameTime ? patient.Clinic.AllDaysTimeTo : (DateTime)patient.Clinic.GetType().GetProperty(DateTime.Parse(bookingDate).DayOfWeek.ToString() + "TimeTo").GetValue(patient.Clinic, null),
                DoctorAllBookingSameDay = _context.Bookings.Where(b => b.Patient.DoctorId == patient.DoctorId && b.BookingDateTime.Date == DateTime.Parse(bookingDate).Date).Include(t => t.Type).Select(b => new BookingBrief
                {
                    BookId = b.Id,
                    Time = new DateTime(2020, 1, 1, b.BookingDateTime.Hour, b.BookingDateTime.Minute, 0),
                    Type = b.Type.Text
                }).ToList()
            };

            return model;
        }

        // PUT: api/Booking/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBooking(Guid id, BookingPutDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var booking = await _context.Bookings.Where(b => b.Id == model.BookingId)
                .Include(s => s.BookingServices).Include(p => p.BookingPayments).FirstOrDefaultAsync();
            booking.BookingDateTime = model.BookingDateTime;
            booking.TypeId = model.TypeId;
            booking.DiscountId = model.DiscountId == 0 ? (int?)null : model.DiscountId;
            booking.UpdatedBy = id;
            booking.UpdatedOn = DateTime.Now;

            _context.BookingServices.RemoveRange(booking.BookingServices);
            foreach (var serviceId in model.ServicesIds)
            {
                booking.BookingServices.Add(new BookingService { Booking = booking, ServiceId = serviceId });
            }

            _context.BookingPayments.RemoveRange(booking.BookingPayments);
            booking.BookingPayments.Add(new BookingPayment
            {
                Booking = booking,
                Paid = model.Paid,
                CreatedBy = id,
                CreatedOn = DateTime.Now,
                UpdatedBy = id,
                UpdatedOn = DateTime.Now
            });

            _context.Entry(booking).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookingExists(booking.Id))
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
        [HttpPost("{id}")]
        public async Task<IActionResult> PostBooking(Guid id, BookingPostDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var booking = new Booking
            {
                PatientId = model.PatientId,
                DoctorId = model.DoctorId,
                BookingDateTime = model.BookingDateTime,
                TypeId = model.TypeId,
                DiscountId = model.DiscountId == 0 ? (int?)null : model.DiscountId,
                IsActive = true,
                IsDeleted = false,
                CreatedBy = id,
                CreatedOn = DateTime.Now,
                UpdatedBy = id,
                UpdatedOn = DateTime.Now
            };
            foreach (var serviceId in model.ServicesIds)
            {
                booking.BookingServices.Add(new BookingService { Booking = booking, ServiceId = serviceId });
            }
            booking.BookingPayments.Add(new BookingPayment
            {
                Booking = booking,
                Paid = model.Paid,
                CreatedBy = id,
                CreatedOn = DateTime.Now,
                UpdatedBy = id,
                UpdatedOn = DateTime.Now
            });

            _context.Bookings.Add(booking);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (BookingExists(booking.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return Ok();
        }

        // DELETE: api/Booking/5
        [HttpDelete("{id}/{bookId}")]
        public async Task<IActionResult> DeleteBooking(Guid id,int bookId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var booking = await _context.Bookings.FindAsync(bookId);
            if (booking == null)
            {
                return NotFound();
            }
            booking.IsCanceled = true;
            booking.CanceledOn = DateTime.Now;
            booking.UpdatedBy = id;
            booking.UpdatedOn = DateTime.Now;

            _context.Entry(booking).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookingExists(booking.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return Ok();
        }

        private bool BookingExists(int id)
        {
            return _context.Bookings.Any(e => e.Id == id);
        }
    }
}
