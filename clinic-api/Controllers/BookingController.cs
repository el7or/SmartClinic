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
using clinic_api.Helper;
using Microsoft.AspNetCore.SignalR;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IHubContext<ChatHub> _hub;

        public BookingController(ApplicationDbContext context, IHubContext<ChatHub> hub)
        {
            _context = context;
            _hub = hub;
        }

        // GET: api/Booking
        [HttpGet("{id}/{doctorId}/{bookingDate}")]
        public async Task<ActionResult<GetBookingsDTO>> GetBookings(Guid id, Guid doctorId, string bookingDate)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var clinic = await _context.Clinics.Where(c => c.DoctorClinics.Any(d => d.DoctorId == doctorId))
                .Include(c => c.DoctorClinics).Include(e => e.EntryOrder).FirstOrDefaultAsync();
            int[] weekDays = { 6, 0, 1, 2, 3, 4, 5 };
            int[] weekEnds = weekDays.Except(clinic.WorkDays.Split(",").ToArray().Select(int.Parse).ToArray()).ToArray();

            var bookingList = await _context.Bookings.Where(b => b.Patient.DoctorId == doctorId && b.Patient.IsDeleted != true && b.BookingDateTime.Date == DateTime.Parse(bookingDate).Date)
                .Include(p => p.Patient).Include(t => t.Type).Include(s => s.BookingServices).Include(d => d.Discount).Include(p => p.BookingPayments)
                .OrderBy(b => b.DaySeqNo)
                .Select(b => new BookingList
                {
                    BookId = b.Id,
                    PatientCodeId = b.Patient.SeqNo,
                    PatientId = b.PatientId,
                    DaySeqNo = b.DaySeqNo,
                    Time = b.BookingDateTime,
                    Type = b.Type.Text,
                    Services = b.BookingServices.Select(s => s.Service.Service).ToArray(),
                    Name = b.Patient.FullName,
                    Mobile = b.Patient.Phone,
                    IsEnter = b.IsEnter,
                    EntryTime = b.EntryTime,
                    IsAttend = b.IsAttend,
                    AttendTime = b.AttendanceTime,
                    IsCanceled = b.IsCanceled,
                    Paid = b.BookingPayments.Sum(p => p.Paid),
                    Due = b.Type.Price + (b.BookingServices.Count() > 0 ? b.BookingServices.Sum(s => s.Service.Price) : 0) - (b.Discount != null ? ((bool)b.Discount.IsPercent ? ((b.Type.Price + (b.BookingServices.Count() > 0 ? b.BookingServices.Sum(s => s.Service.Price) : 0) * b.Discount.Price) / 100) : b.Discount.Price) : 0) - (b.BookingPayments.Any() ? b.BookingPayments.Sum(p => p.Paid) : 0),
                }).ToListAsync();

            var model = new GetBookingsDTO
            {
                BookingsList = bookingList,
                WeekEnds = weekEnds,
                SortBookingsByText = clinic.EntryOrder.Value
            };

            return model;
        }

        // PUT: api/Booking/5
        [HttpPut("PutBookingList/{id}")]
        public async Task<IActionResult> PutBookingList(Guid id, BookingPutListDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            for (int i = 0; i < model.BookingsList.Count(); i++)
            {
                model.BookingsList[i].DaySeqNo = i + 1;
                var book = _context.Bookings.Find(model.BookingsList[i].BookId);
                book.DaySeqNo = i + 1;
                book.IsEnter = model.BookingsList[i].IsEnter;
                book.EntryTime = model.BookingsList[i].IsEnter != true ? null : model.BookingsList[i].EntryTimeString;
                book.IsAttend = model.BookingsList[i].IsAttend;
                book.AttendanceTime = model.BookingsList[i].IsAttend != true ? null : model.BookingsList[i].AttendTimeString;
                _context.Entry(book).State = EntityState.Modified;
            }
            await _context.SaveChangesAsync();

            var usersInClinic = _context.Clinics.Where(i => i.Id == model.ClinicId).Include(u => u.ClinicUsers).FirstOrDefault().ClinicUsers.Where(u => u.UserId != id).Select(u => u.UserId).ToArray();
            foreach (var userId in usersInClinic)
            {
                await _hub.Clients.User(userId.ToString()).SendAsync("UpdateTodayBooking");
            }

            return NoContent();
        }

        // GET: api/Booking
        [HttpGet("GetPatientBookings/{id}/{patientId}")]
        public async Task<ActionResult<IEnumerable<GetPatientBookingDTO>>> GetPatientBookings(Guid id, Guid patientId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = _context.Bookings.Where(p => p.PatientId == patientId && p.Patient.IsDeleted != true)
                .Include(p => p.Patient).Include(p => p.BookingPayments).Include(s => s.Type).Include(s => s.Discount).Include("BookingServices.Service")
                .OrderByDescending(d => d.CreatedOn).Select(b => new GetPatientBookingDTO
                {
                    BookId = b.Id,
                    Date = b.BookingDateTime,
                    Type = b.Type.Text,
                    Servcies = b.BookingServices.Select(s => s.Service.Service).ToArray(),
                    IsEnter = b.IsEnter,
                    IsCanceled = b.IsCanceled,
                    Due = (b.Type.Price + (b.BookingServices.Any() ? b.BookingServices.Sum(s => s.Service.Price) : 0) - (b.DiscountId != null ? b.Discount.Price : 0)) - (b.BookingPayments.Any() ? b.BookingPayments.Sum(p => p.Paid) : 0)
                });
            return await model.ToListAsync();
        }

        // GET: api/Booking
        [HttpGet("GetHomeBookings/{id}/{doctorId}/{clinicId}")]
        public async Task<IActionResult> GetHomeBookings(Guid id, Guid doctorId, Guid clinicId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var doctor = _context.Doctors.Find(doctorId);
            var calEvents = _context.Bookings.Include(p => p.Patient).Where(b => b.DoctorId == doctorId && b.IsCanceled != true && b.Patient.IsDeleted != true)
                .GroupBy(b => b.BookingDateTime.Date)
                .Select(b => new
                {
                    Title = "عدد الحجوزات: " + b.Count(),
                    Start = b.Key.ToString("yyyy-MM-dd"),
                    Description = doctor.FullName
                }).ToList();
            var clinic = await _context.Clinics.FindAsync(clinicId);
            int[] weekDays = { 6, 0, 1, 2, 3, 4, 5 };
            var model = new
            {
                CalendarEvents = calEvents,
                WeekEnds = weekDays.Except(clinic.WorkDays.Split(",").ToArray().Select(int.Parse).ToArray()).ToArray()
            };
            return Ok(model);
        }

        // GET: api/Booking/5
        [HttpGet("{id}/{patientId}/{bookingId}/{bookingDate}")]
        public async Task<ActionResult<BookingGetDTO>> GetBooking(Guid id, Guid patientId, int bookingId, string bookingDate)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = await _context.Patients.Where(i => i.Id == patientId && i.IsDeleted != true)
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
                    DoctorAllBookingSameDay = _context.Bookings.Where(b => b.Patient.DoctorId == patient.DoctorId && b.Patient.IsDeleted != true && b.BookingDateTime.Date == DateTime.Parse(bookingDate).Date && b.IsCanceled != true)
                    .Include(t => t.Type).Include(p => p.Patient).OrderBy(t => t.BookingDateTime).Select(b => new BookingBrief
                    {
                        BookId = b.Id,
                        PatientId = b.PatientId,
                        PatientName = b.Patient.FullName,
                        Time = new DateTime(2020, 1, 1, b.BookingDateTime.Hour, b.BookingDateTime.Minute, 0),
                        Type = b.Type.Text
                    }).ToList()
                }
            };
            if (bookingId == 0)
            {
                model.PrevBookingsDues = _context.Bookings.Where(p => p.PatientId == patientId && p.IsCanceled != true)
                    .Include(p => p.BookingPayments).Include(s => s.Type).Include(s => s.Discount).Include("BookingServices.Service")
                    .Where(b => b.BookingPayments.Sum(p => p.Paid) < (b.Type.Price + (b.BookingServices.Any() ? b.BookingServices.Sum(s => s.Service.Price) : 0) - (b.DiscountId != null ? b.Discount.Price : 0)))
                    .Select(b => new PrevBookingDue
                    {
                        BookingId = b.Id,
                        BookingDate = b.BookingDateTime,
                        BookingType = b.Type.Text,
                        BookingDue = b.Type.Price + (b.BookingServices.Any() ? b.BookingServices.Sum(s => s.Service.Price) : 0) - (b.DiscountId != null ? b.Discount.Price : 0) - (b.BookingPayments.Any() ? b.BookingPayments.Sum(p => p.Paid) : 0),
                        BookingPaid = 0
                    }).ToList();
            }
            else
            {
                var booking = await _context.Bookings.Where(b => b.Id == bookingId).Include(s => s.BookingServices).Include(p => p.BookingPayments).FirstOrDefaultAsync();
                model.BookingDetails = new BookingDetails
                {
                    BookingDateTime = booking.BookingDateTime,
                    BookingTypeId = booking.TypeId,
                    BookingServicesIds = booking.BookingServices.Select(s => s.ServiceId).ToArray(),
                    BookingDiscountId = booking.DiscountId,
                    BookingPayments = booking.BookingPayments.Sum(p => p.Paid),
                    IsCanceled = booking.IsCanceled,
                    IsEnter = booking.IsEnter
                };
                model.PrevBookingsDues = _context.Bookings.Where(b => b.PatientId == patientId && b.IsCanceled != true && b.Id != bookingId)
                    .Include(p => p.BookingPayments).Include(s => s.Type).Include(s => s.Discount).Include("BookingServices.Service")
                    .Where(b => b.BookingPayments.Sum(p => p.Paid) < (b.Type.Price + (b.BookingServices.Any() ? b.BookingServices.Sum(s => s.Service.Price) : 0) - (b.DiscountId != null ? b.Discount.Price : 0)))
                    .Select(b => new PrevBookingDue
                    {
                        BookingId = b.Id,
                        BookingDate = b.BookingDateTime,
                        BookingType = b.Type.Text,
                        BookingDue = b.Type.Price + (b.BookingServices.Any() ? b.BookingServices.Sum(s => s.Service.Price) : 0) - (b.DiscountId != null ? b.Discount.Price : 0) - (b.BookingPayments.Any() ? b.BookingPayments.Sum(p => p.Paid) : 0),
                        BookingPaid = 0
                    }).ToList();
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
            var patient = await _context.Patients.Where(i => i.Id == patientId && i.IsDeleted != true).Include(c => c.Clinic).FirstOrDefaultAsync();

            if (patient == null)
            {
                return NotFound();
            }
            var model = new BookingGetChangeDateDTO
            {
                ClinicDayTimeFrom = (bool)patient.Clinic.IsAllDaysSameTime ? patient.Clinic.AllDaysTimeFrom : (DateTime)patient.Clinic.GetType().GetProperty(DateTime.Parse(bookingDate).DayOfWeek.ToString() + "TimeFrom").GetValue(patient.Clinic, null),
                ClinicDayTimeTo = (bool)patient.Clinic.IsAllDaysSameTime ? patient.Clinic.AllDaysTimeTo : (DateTime)patient.Clinic.GetType().GetProperty(DateTime.Parse(bookingDate).DayOfWeek.ToString() + "TimeTo").GetValue(patient.Clinic, null),
                DoctorAllBookingSameDay = _context.Bookings.Where(b => b.Patient.DoctorId == patient.DoctorId && b.Patient.IsDeleted != true && b.BookingDateTime.Date == DateTime.Parse(bookingDate).Date && b.IsCanceled != true)
                .Include(t => t.Type).Include(p => p.Patient).OrderBy(t => t.BookingDateTime).Select(b => new BookingBrief
                {
                    BookId = b.Id,
                    PatientId = b.PatientId,
                    PatientName = b.Patient.FullName,
                    Time = new DateTime(2020, 1, 1, b.BookingDateTime.Hour, b.BookingDateTime.Minute, 0),
                    Type = b.Type.Text
                }).ToList()
            };

            return model;
        }

        // PUT: api/Booking/5
        [HttpPut("{id}/{clinicId}")]
        public async Task<IActionResult> PutBooking(Guid id, Guid clinicId, BookingPutDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var booking = await _context.Bookings.Where(b => b.Id == model.BookingId)
                .Include(s => s.BookingServices).Include(p => p.BookingPayments).Include(p => p.Patient).FirstOrDefaultAsync();
            booking.BookingDateTime = model.BookingDateTime;
            booking.TypeId = model.TypeId;
            booking.DiscountId = model.DiscountId == 0 ? null : model.DiscountId;
            booking.UpdatedBy = id;
            booking.UpdatedOn = DateTime.Now.ToEgyptTime();

            _context.BookingServices.RemoveRange(booking.BookingServices);
            foreach (var serviceId in model.ServicesIds)
            {
                booking.BookingServices.Add(new BookingService { Booking = booking, ServiceId = serviceId });
            }
            if (model.Paid > 0)
            {
                booking.BookingPayments.Add(new BookingPayment
                {
                    Booking = booking,
                    Paid = model.Paid,
                    CreatedBy = id,
                    CreatedOn = DateTime.Now.ToEgyptTime(),
                    UpdatedBy = id,
                    UpdatedOn = DateTime.Now.ToEgyptTime()
                });
            }
            _context.Entry(booking).State = EntityState.Modified;
            foreach (var item in model.PrevBookingsDues)
            {
                if (item.BookingPaid > 0)
                {
                    var prevBooking = await _context.Bookings.Where(b => b.Id == item.BookingId)
                   .Include(p => p.BookingPayments).FirstOrDefaultAsync();

                    prevBooking.BookingPayments.Add(new BookingPayment
                    {
                        BookingId = item.BookingId,
                        Paid = (decimal)item.BookingPaid,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
                    });
                    _context.Entry(prevBooking).State = EntityState.Modified;
                }
            }
            _context.SaveChanges();

            // reorder sequance number for bookings in same date
            if (model.BookingDateTime.Date != DateTime.Now.ToEgyptTime().Date)
            {
                var sameDayBookings = _context.Bookings.Where(p => p.BookingDateTime.Date == model.BookingDateTime.Date && p.DoctorId == model.DoctorId).OrderBy(d => d.BookingDateTime).ToList();
                for (int i = 0; i < sameDayBookings.Count(); i++)
                {
                    sameDayBookings[i].DaySeqNo = i + 1;
                    _context.Entry(sameDayBookings[i]).State = EntityState.Modified;
                }
            }

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
            if (booking.BookingDateTime.Date == DateTime.Now.ToEgyptTime().Date)
            {
                var usersInClinic = _context.Clinics.Where(i => i.Id == clinicId).Include(u => u.ClinicUsers).FirstOrDefault().ClinicUsers.Where(u => u.UserId != id).Select(u => u.UserId).ToArray();
                foreach (var userId in usersInClinic)
                {
                    await _hub.Clients.User(userId.ToString()).SendAsync("UpdateTodayBooking", booking.Patient.FullName);
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
            var lastBookingInDay = _context.Bookings.Where(p => p.BookingDateTime.Date == model.BookingDateTime.Date && p.DoctorId == model.DoctorId).OrderByDescending(s => s.DaySeqNo).FirstOrDefault();
            var booking = new Booking
            {
                PatientId = model.PatientId,
                DoctorId = model.DoctorId,
                DaySeqNo = lastBookingInDay == null ? 1 : lastBookingInDay.DaySeqNo + 1,
                BookingDateTime = model.BookingDateTime,
                TypeId = model.TypeId,
                DiscountId = model.DiscountId == 0 ? null : model.DiscountId,
                IsActive = true,
                IsDeleted = false,
                CreatedBy = id,
                CreatedOn = DateTime.Now.ToEgyptTime(),
                UpdatedBy = id,
                UpdatedOn = DateTime.Now.ToEgyptTime()
            };
            foreach (var serviceId in model.ServicesIds)
            {
                booking.BookingServices.Add(new BookingService { Booking = booking, ServiceId = serviceId });
            }
            if (model.Paid > 0)
            {
                booking.BookingPayments.Add(new BookingPayment
                {
                    Booking = booking,
                    Paid = model.Paid,
                    CreatedBy = id,
                    CreatedOn = DateTime.Now.ToEgyptTime(),
                    UpdatedBy = id,
                    UpdatedOn = DateTime.Now.ToEgyptTime()
                });
            }

            _context.Bookings.Add(booking);

            foreach (var item in model.PrevBookingsDues)
            {
                if (item.BookingPaid > 0)
                {
                    var prevBooking = await _context.Bookings.Where(b => b.Id == item.BookingId)
                   .Include(p => p.BookingPayments).FirstOrDefaultAsync();

                    prevBooking.BookingPayments.Add(new BookingPayment
                    {
                        BookingId = item.BookingId,
                        Paid = (decimal)item.BookingPaid,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
                    });
                    _context.Entry(prevBooking).State = EntityState.Modified;
                }
            }
            _context.SaveChanges();

            // reorder sequance number for bookings in same date
            if (model.BookingDateTime.Date != DateTime.Now.ToEgyptTime().Date && lastBookingInDay != null)
            {
                var sameDayBookings = _context.Bookings.Where(p => p.BookingDateTime.Date == model.BookingDateTime.Date && p.DoctorId == model.DoctorId).OrderBy(b => b.BookingDateTime).ToList();
                for (int i = 0; i < sameDayBookings.Count(); i++)
                {
                    sameDayBookings[i].DaySeqNo = i + 1;
                    _context.Entry(sameDayBookings[i]).State = EntityState.Modified;
                }
            }

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
        public async Task<IActionResult> DeleteBooking(Guid id, int bookId)
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
            booking.CanceledOn = DateTime.Now.ToEgyptTime();
            booking.UpdatedBy = id;
            booking.UpdatedOn = DateTime.Now.ToEgyptTime();

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
