using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using clinic_api.Data;
using clinic_api.Models;
using clinic_api.DTOs;
using System.IdentityModel.Tokens.Jwt;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClinicController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ClinicController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Clinic
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Clinic>>> GetClinics()
        {
            return await _context.Clinics.ToListAsync();
        }

        // GET: api/Clinic/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Clinic>> GetClinic(Guid id)
        {
            var clinic = await _context.Clinics.FindAsync(id);

            if (clinic == null)
            {
                return NotFound();
            }

            return clinic;
        }

        // GET: api/Clinic/GetBookingSetting/5/6
        [HttpGet("GetBookingSetting/{id}/{clinicId}")]
        public async Task<ActionResult<ClinicGetBookingSettingDTO>> GetBookingSetting(Guid id, Guid clinicId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var clinic = await _context.Clinics.FindAsync(clinicId);
            if (clinic == null)
            {
                return NotFound();
            }
            int[] weekDays = { 6, 0, 1, 2, 3, 4, 5 };
            var model = new ClinicGetBookingSettingDTO
            {
                EntryOrderId = clinic.EntryOrderId,
                BookingPeriod = clinic.BookingPeriod,
                ConsultExpiration = clinic.ConsultExpiration,
                IsAllDaysOn = clinic.IsAllDaysOn,
                IsAllDaysSameTime = clinic.IsAllDaysSameTime,
                //WorkDays = Array.ConvertAll(clinic.WorkDays.Split(", ").ToArray(), s => int.Parse(s))
                WorkDays = clinic.WorkDays.Split(",").ToArray().Select(int.Parse).ToArray(),
                WeekEnds = weekDays.Except(clinic.WorkDays.Split(",").ToArray().Select(int.Parse).ToArray()).ToArray(),
                AllDaysTimeFrom = clinic.AllDaysTimeFrom,
                AllDaysTimeTo = clinic.AllDaysTimeTo,
                IsSaturdayOn = clinic.WorkDays.Contains('6'),
                SaturdayTimeFrom = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeFrom : clinic.SaturdayTimeFrom,
                SaturdayTimeTo = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeTo : clinic.SaturdayTimeTo,
                IsSundayOn = clinic.WorkDays.Contains('0'),
                SundayTimeFrom = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeFrom : clinic.SundayTimeFrom,
                SundayTimeTo = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeTo : clinic.SundayTimeTo,
                IsMondayOn = clinic.WorkDays.Contains('1'),
                MondayTimeFrom = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeFrom : clinic.MondayTimeFrom,
                MondayTimeTo = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeTo : clinic.MondayTimeTo,
                IsTuesdayOn = clinic.WorkDays.Contains('2'),
                TuesdayTimeFrom = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeFrom : clinic.TuesdayTimeFrom,
                TuesdayTimeTo = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeTo : clinic.TuesdayTimeTo,
                IsWednesdayOn = clinic.WorkDays.Contains('3'),
                WednesdayTimeFrom = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeFrom : clinic.WednesdayTimeFrom,
                WednesdayTimeTo = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeTo : clinic.WednesdayTimeTo,
                IsThursdayOn = clinic.WorkDays.Contains('4'),
                ThursdayTimeFrom = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeFrom : clinic.ThursdayTimeFrom,
                ThursdayTimeTo = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeTo : clinic.ThursdayTimeTo,
                IsFridayOn = clinic.WorkDays.Contains('5'),
                FridayTimeFrom = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeFrom : clinic.FridayTimeFrom,
                FridayTimeTo = clinic.IsAllDaysSameTime == true ? clinic.AllDaysTimeTo : clinic.FridayTimeTo
            };
            return model;
        }

        // GET: api/Clinic/GetPricesSetting/5/6
        [HttpGet("GetPricesSetting/{id}/{clinicId}")]
        public async Task<ActionResult<ClinicGetPricesSettingDTO>> GetPricesSetting(Guid id, Guid clinicId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var clinic = await _context.Clinics.Include(t => t.ClinicBookingTypes).Include(s => s.ClinicServices).Include(d => d.ClinicDiscounts).FirstOrDefaultAsync(c => c.Id == clinicId);
            if (clinic == null)
            {
                return NotFound();
            }
            var model = new ClinicGetPricesSettingDTO
            {
                BookingTypes = clinic.ClinicBookingTypes.Where(s => s.Type != "justService").Select(t => new BookingType
                {
                    Id = t.Id,
                    Type = t.Text,
                    Price = t.Price
                }).ToList(),
                ServiceTypes = clinic.ClinicServices.Select(s => new ServiceType
                {
                    Id = s.Id,
                    Service = s.Service,
                    Price = s.Price
                }).ToList(),
                DiscountTypes = clinic.ClinicDiscounts.Select(d => new DiscountType
                {
                    Id = d.Id,
                    Discount = d.Discount,
                    Price = d.Price,
                    IsPercent = d.IsPercent
                }).ToList(),
            };
            return model;
        }

        // PUT: api/Clinic/PutBookingSetting/5
        [HttpPut("PutBookingSetting/{id}")]
        public async Task<IActionResult> PutBookingSetting(Guid id, ClinicPutBookingSettingDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var clinic = _context.Clinics.Find(model.ClinicId);
            clinic.EntryOrderId = model.EntryOrderId;
            clinic.BookingPeriod = model.BookingPeriod;
            clinic.ConsultExpiration = model.ConsultExpiration;
            clinic.WorkDays = model.WorkDays;
            clinic.IsAllDaysOn = model.IsAllDaysOn;
            clinic.IsAllDaysSameTime = model.IsAllDaysSameTime;
            clinic.AllDaysTimeFrom = model.AllDaysTimeFrom;
            clinic.AllDaysTimeTo = model.AllDaysTimeTo;
            clinic.SaturdayTimeFrom = model.SaturdayTimeFrom;
            clinic.SaturdayTimeTo = model.SaturdayTimeTo;
            clinic.SundayTimeFrom = model.SundayTimeFrom;
            clinic.SundayTimeTo = model.SundayTimeTo;
            clinic.MondayTimeFrom = model.MondayTimeFrom;
            clinic.MondayTimeTo = model.MondayTimeTo;
            clinic.TuesdayTimeFrom = model.TuesdayTimeFrom;
            clinic.TuesdayTimeTo = model.TuesdayTimeTo;
            clinic.WednesdayTimeFrom = model.WednesdayTimeFrom;
            clinic.WednesdayTimeTo = model.WednesdayTimeTo;
            clinic.ThursdayTimeFrom = model.ThursdayTimeTo;
            clinic.ThursdayTimeTo = model.ThursdayTimeTo;
            clinic.FridayTimeFrom = model.FridayTimeFrom;
            clinic.FridayTimeTo = model.FridayTimeTo;
            clinic.UpdatedBy = id;
            clinic.UpdatedOn = DateTime.Now;

            _context.Entry(clinic).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClinicExists(model.ClinicId))
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

        // PUT: api/Clinic/PutPricesSetting/5/6
        [HttpPut("PutPricesSetting/{id}/{clinicId}")]
        public async Task<IActionResult> PutPricesSetting(Guid id, Guid clinicId, ClinicGetPricesSettingDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            foreach (var type in model.BookingTypes)
            {
                if (type.Id == 0)
                {
                    _context.ClinicBookingTypes.Add(new ClinicBookingType
                    {
                        ClinicId = clinicId,
                        Type = type.Type,
                        Text = type.Type,
                        Price = type.Price,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now,
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now
                    });
                }
                else
                {
                    var clinicType = _context.ClinicBookingTypes.Find(type.Id);
                    clinicType.Price = type.Price;
                    clinicType.UpdatedBy = id;
                    clinicType.UpdatedOn = DateTime.Now;
                    _context.Entry(clinicType).State = EntityState.Modified;
                }
            }
            foreach (var service in model.ServiceTypes)
            {
                if (service.Id == 0)
                {
                    _context.ClinicServices.Add(new ClinicService
                    {
                        ClinicId = clinicId,
                        Service = service.Service,
                        Price = service.Price,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now,
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now
                    });
                }
                else
                {
                    var clinicService = _context.ClinicServices.Find(service.Id);
                    clinicService.Price = service.Price;
                    clinicService.UpdatedBy = id;
                    clinicService.UpdatedOn = DateTime.Now;
                    _context.Entry(clinicService).State = EntityState.Modified;
                }
            }
            foreach (var discount in model.DiscountTypes)
            {
                if (discount.Id == 0)
                {
                    _context.ClinicDiscounts.Add(new ClinicDiscount
                    {
                        ClinicId = clinicId,
                        Discount = discount.Discount,
                        IsPercent = discount.IsPercent,
                        Price = discount.Price,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now,
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now
                    });
                }
                else
                {
                    var clinicDiscount = _context.ClinicDiscounts.Find(discount.Id);
                    clinicDiscount.Price = discount.Price;
                    clinicDiscount.IsPercent = discount.IsPercent;
                    clinicDiscount.UpdatedBy = id;
                    clinicDiscount.UpdatedOn = DateTime.Now;
                    _context.Entry(clinicDiscount).State = EntityState.Modified;
                }
            }

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClinicExists(clinicId))
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

        // POST: api/Clinic
        [HttpPost]
        public async Task<ActionResult<Clinic>> PostClinic(Clinic clinic)
        {
            _context.Clinics.Add(clinic);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ClinicExists(clinic.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetClinic", new { id = clinic.Id }, clinic);
        }

        // DELETE: api/Clinic/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Clinic>> DeleteClinic(Guid id)
        {
            var clinic = await _context.Clinics.FindAsync(id);
            if (clinic == null)
            {
                return NotFound();
            }

            _context.Clinics.Remove(clinic);
            await _context.SaveChangesAsync();

            return clinic;
        }

        private bool ClinicExists(Guid id)
        {
            return _context.Clinics.Any(e => e.Id == id);
        }
    }
}
