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
using CloudinaryDotNet;
using Microsoft.Extensions.Options;
using clinic_api.Helper;
using CloudinaryDotNet.Actions;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClinicController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IOptions<CloudinarySettings> _cloudinaryConfig;
        private Cloudinary _cloudinary;

        public ClinicController(ApplicationDbContext context, IOptions<CloudinarySettings> cloudinaryConfig)
        {
            _context = context;
            _cloudinaryConfig = cloudinaryConfig;
            Account account = new Account(_cloudinaryConfig.Value.CloudName, _cloudinaryConfig.Value.ApiKey, _cloudinaryConfig.Value.ApiSecret);
            _cloudinary = new Cloudinary(account);
        }

        // GET: api/Clinic/GetBookingSetting/5/6
        [HttpGet("GetBookingSetting/{id}/{doctorId}")]
        public async Task<ActionResult<ClinicGetBookingSettingDTO>> GetBookingSetting(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var doctor = await _context.Doctors.FindAsync(doctorId);
            if (doctor == null)
            {
                return NotFound();
            }
            int[] weekDays = { 6, 0, 1, 2, 3, 4, 5 };
            var model = new ClinicGetBookingSettingDTO
            {
                EntryOrderId = doctor.EntryOrderId,
                BookingPeriod = doctor.BookingPeriod,
                ConsultExpiration = doctor.ConsultExpiration,
                IsAllDaysOn = doctor.IsAllDaysOn,
                IsAllDaysSameTime = doctor.IsAllDaysSameTime,
                //WorkDays = Array.ConvertAll(clinic.WorkDays.Split(", ").ToArray(), s => int.Parse(s))
                WorkDays = doctor.WorkDays.Split(",").ToArray().Select(int.Parse).ToArray(),
                WeekEnds = weekDays.Except(doctor.WorkDays.Split(",").ToArray().Select(int.Parse).ToArray()).ToArray(),
                AllDaysTimeFrom = doctor.AllDaysTimeFrom,
                AllDaysTimeTo = doctor.AllDaysTimeTo,
                IsSaturdayOn = doctor.WorkDays.Contains('6'),
                SaturdayTimeFrom = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeFrom : doctor.SaturdayTimeFrom,
                SaturdayTimeTo = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeTo : doctor.SaturdayTimeTo,
                IsSundayOn = doctor.WorkDays.Contains('0'),
                SundayTimeFrom = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeFrom : doctor.SundayTimeFrom,
                SundayTimeTo = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeTo : doctor.SundayTimeTo,
                IsMondayOn = doctor.WorkDays.Contains('1'),
                MondayTimeFrom = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeFrom : doctor.MondayTimeFrom,
                MondayTimeTo = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeTo : doctor.MondayTimeTo,
                IsTuesdayOn = doctor.WorkDays.Contains('2'),
                TuesdayTimeFrom = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeFrom : doctor.TuesdayTimeFrom,
                TuesdayTimeTo = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeTo : doctor.TuesdayTimeTo,
                IsWednesdayOn = doctor.WorkDays.Contains('3'),
                WednesdayTimeFrom = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeFrom : doctor.WednesdayTimeFrom,
                WednesdayTimeTo = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeTo : doctor.WednesdayTimeTo,
                IsThursdayOn = doctor.WorkDays.Contains('4'),
                ThursdayTimeFrom = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeFrom : doctor.ThursdayTimeFrom,
                ThursdayTimeTo = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeTo : doctor.ThursdayTimeTo,
                IsFridayOn = doctor.WorkDays.Contains('5'),
                FridayTimeFrom = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeFrom : doctor.FridayTimeFrom,
                FridayTimeTo = doctor.IsAllDaysSameTime == true ? doctor.AllDaysTimeTo : doctor.FridayTimeTo
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
            var doctor = _context.Doctors.Find(model.DoctorId);
            doctor.EntryOrderId = model.EntryOrderId;
            doctor.BookingPeriod = model.BookingPeriod;
            doctor.ConsultExpiration = model.ConsultExpiration;
            doctor.WorkDays = model.WorkDays;
            doctor.IsAllDaysOn = model.IsAllDaysOn;
            doctor.IsAllDaysSameTime = model.IsAllDaysSameTime;
            doctor.AllDaysTimeFrom = model.AllDaysTimeFrom;
            doctor.AllDaysTimeTo = model.AllDaysTimeTo;
            doctor.SaturdayTimeFrom = model.SaturdayTimeFrom;
            doctor.SaturdayTimeTo = model.SaturdayTimeTo;
            doctor.SundayTimeFrom = model.SundayTimeFrom;
            doctor.SundayTimeTo = model.SundayTimeTo;
            doctor.MondayTimeFrom = model.MondayTimeFrom;
            doctor.MondayTimeTo = model.MondayTimeTo;
            doctor.TuesdayTimeFrom = model.TuesdayTimeFrom;
            doctor.TuesdayTimeTo = model.TuesdayTimeTo;
            doctor.WednesdayTimeFrom = model.WednesdayTimeFrom;
            doctor.WednesdayTimeTo = model.WednesdayTimeTo;
            doctor.ThursdayTimeFrom = model.ThursdayTimeTo;
            doctor.ThursdayTimeTo = model.ThursdayTimeTo;
            doctor.FridayTimeFrom = model.FridayTimeFrom;
            doctor.FridayTimeTo = model.FridayTimeTo;
            doctor.UpdatedBy = id;
            doctor.UpdatedOn = DateTime.Now.ToEgyptTime();

            _context.Entry(doctor).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClinicExists(model.DoctorId))
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

        // GET: api/Clinic/GetPricesSetting/5/6
        [HttpGet("GetPricesSetting/{id}/{doctorId}")]
        public async Task<ActionResult<ClinicGetPricesSettingDTO>> GetPricesSetting(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var doctor = await _context.Doctors.Include(t => t.DoctorBookingTypes).Include(s => s.DoctorServices).Include(d => d.DoctorDiscounts).FirstOrDefaultAsync(c => c.Id == doctorId);
            if (doctor == null)
            {
                return NotFound();
            }
            var model = new ClinicGetPricesSettingDTO
            {
                BookingTypes = doctor.DoctorBookingTypes.Where(s => s.Type != "justService").Select(t => new BookingType
                {
                    Id = t.Id,
                    Type = t.Text,
                    Price = t.Price
                }).ToList(),
                ServiceTypes = doctor.DoctorServices.Select(s => new ServiceType
                {
                    Id = s.Id,
                    Service = s.Service,
                    Price = s.Price
                }).ToList(),
                DiscountTypes = doctor.DoctorDiscounts.Select(d => new DiscountType
                {
                    Id = d.Id,
                    Discount = d.Discount,
                    Price = d.Price,
                    IsPercent = d.IsPercent
                }).ToList(),
            };
            return model;
        }

        // PUT: api/Clinic/PutPricesSetting/5/6
        [HttpPut("PutPricesSetting/{id}/{doctorId}")]
        public async Task<IActionResult> PutPricesSetting(Guid id, Guid doctorId, ClinicGetPricesSettingDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            foreach (var type in model.BookingTypes)
            {
                if (type.Id == 0)
                {
                    _context.DoctorBookingTypes.Add(new DoctorBookingType
                    {
                        DoctorId = doctorId,
                        Type = type.Type,
                        Text = type.Type,
                        Price = type.Price,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
                    });
                }
                else
                {
                    var clinicType = _context.DoctorBookingTypes.Find(type.Id);
                    clinicType.Price = type.Price;
                    clinicType.UpdatedBy = id;
                    clinicType.UpdatedOn = DateTime.Now.ToEgyptTime();
                    _context.Entry(clinicType).State = EntityState.Modified;
                }
            }
            foreach (var service in model.ServiceTypes)
            {
                if (service.Id == 0)
                {
                    _context.DoctorServices.Add(new DoctorService
                    {
                        DoctorId = doctorId,
                        Service = service.Service,
                        Price = service.Price,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
                    });
                }
                else
                {
                    var clinicService = _context.DoctorServices.Find(service.Id);
                    clinicService.Price = service.Price;
                    clinicService.UpdatedBy = id;
                    clinicService.UpdatedOn = DateTime.Now.ToEgyptTime();
                    _context.Entry(clinicService).State = EntityState.Modified;
                }
            }
            foreach (var discount in model.DiscountTypes)
            {
                if (discount.Id == 0)
                {
                    _context.DoctorDiscounts.Add(new DoctorDiscount
                    {
                        DoctorId = doctorId,
                        Discount = discount.Discount,
                        IsPercent = discount.IsPercent,
                        Price = discount.Price,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
                    });
                }
                else
                {
                    var clinicDiscount = _context.DoctorDiscounts.Find(discount.Id);
                    clinicDiscount.Price = discount.Price;
                    clinicDiscount.IsPercent = discount.IsPercent;
                    clinicDiscount.UpdatedBy = id;
                    clinicDiscount.UpdatedOn = DateTime.Now.ToEgyptTime();
                    _context.Entry(clinicDiscount).State = EntityState.Modified;
                }
            }

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClinicExists(doctorId))
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

        // GET: api/Clinic/GetPrintSetting/5/6
        [HttpGet("GetPrintSetting/{id}/{doctorId}")]
        public async Task<ActionResult<ClinicGetPrintSettingDTO>> GetPrintSetting(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var clinic = await _context.Doctors.FindAsync(doctorId);
            if (clinic == null)
            {
                return NotFound();
            }
            var model = new ClinicGetPrintSettingDTO
            {
                Address1 = clinic.PrintAddress1,
                Address2 = clinic.PrintAddress2,
                Address3 = clinic.PrintAddress3,
                ClinicTitle = clinic.PrintClinicName,
                DoctorDegree = clinic.PrintDoctorDegree,
                DoctorName = clinic.PrintDoctorName,
                LogoUrl = clinic.PrintLogoUrl,
                Phone1 = clinic.PrintPhone1,
                Phone2 = clinic.PrintPhone2,
                Phone3 = clinic.PrintPhone3
            };
            return model;
        }

        // PUT: api/Clinic/PutPrintSetting/5 (if update print setting without update logo image)
        [HttpPut("PutPrintSetting/{id}")]
        public async Task<IActionResult> PutPrintSetting(Guid id, ClinicPutPrintSettingDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var doctor = _context.Doctors.Find(model.DoctorId);
            doctor.PrintDoctorDegree = model.DoctorDegree;
            doctor.PrintDoctorName = model.DoctorName;
            doctor.PrintAddress1 = model.Address1;
            doctor.PrintAddress2 = model.Address2;
            doctor.PrintAddress3 = model.Address3;
            doctor.PrintClinicName = model.ClinicTitle;
            doctor.PrintPhone1 = model.Phone1;
            doctor.PrintPhone2 = model.Phone2;
            doctor.PrintPhone3 = model.Phone3;
            doctor.UpdatedBy = id;
            doctor.UpdatedOn = DateTime.Now.ToEgyptTime();

            _context.Entry(doctor).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClinicExists(model.DoctorId))
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

        // POST: api/Clinic/PostPrintSetting/5 (if update print setting and update logo image)
        [HttpPost("PostPrintSetting/{id}")]
        public async Task<IActionResult> PostPrintSetting(Guid id, [FromForm] ClinicPostPrintSettingDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var doctor = _context.Doctors.Find(model.DoctorId);

            // delete old logo from cloudinary
            if (doctor.PrintLogoPublicId != null)
            {
                var deletionParams = new DeletionParams(doctor.PrintLogoPublicId);
                var deletionResult = _cloudinary.Destroy(deletionParams);
                if (deletionResult.Result != "ok") { return BadRequest(); }
            }

            // add new logo to cloudinary and get url
            var file = model.File;
            var uploadResult = new ImageUploadResult();
            if (file != null && file.Length > 0)
            {
                using (var stream = file.OpenReadStream())
                {
                    var uploadParams = new ImageUploadParams()
                    {
                        File = new FileDescription(file.Name, stream),
                        Transformation = new Transformation().Width(180).Crop("fit")
                    };
                    uploadResult = _cloudinary.Upload(uploadParams);
                }
            }

            doctor.PrintDoctorDegree = model.DoctorDegree;
            doctor.PrintDoctorName = model.DoctorName;
            doctor.PrintClinicName = model.ClinicTitle;
            doctor.PrintAddress1 = model.Address1=="null"? null : model.Address1;
            doctor.PrintAddress2 = model.Address2 == "null" ? null : model.Address2;
            doctor.PrintAddress3 = model.Address3 == "null" ? null : model.Address3;
            doctor.PrintPhone1 = model.Phone1 == "null" ? null : model.Phone1;
            doctor.PrintPhone2 = model.Phone2 == "null" ? null : model.Phone2;
            doctor.PrintPhone3 = model.Phone3 == "null" ? null : model.Phone3;
            doctor.PrintLogoUrl = uploadResult.Uri.ToString();
            doctor.PrintLogoPublicId = uploadResult.PublicId;
            doctor.UpdatedBy = id;
            doctor.UpdatedOn = DateTime.Now.ToEgyptTime();

            _context.Entry(doctor).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClinicExists(model.DoctorId))
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

        // GET: api/Clinic/GetClinicUsers/5/6
        [HttpGet("GetClinicUsers/{id}/{clinicId}")]
        public async Task<ActionResult<IEnumerable<UserGetClinicUser>>> GetClinicUsers(Guid id, Guid clinicId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var users = _context.Users.Where(d => d.IsDeleted != true && d.ClinicUsers.FirstOrDefault().ClinicId == clinicId).Include(r => r.UserRoles).Select(u => new UserGetClinicUser
            {
                Id = u.Id,
                FullName = u.FullName,
                RoleTitle = u.UserRoles.FirstOrDefault().Role.Title,
                IsActive = u.IsActive
            });
            return await users.ToListAsync();
        }

        //// GET: api/Clinic
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<Clinic>>> GetClinics()
        //{
        //    return await _context.Clinics.ToListAsync();
        //}

        //// GET: api/Clinic/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<Clinic>> GetClinic(Guid id)
        //{
        //    var clinic = await _context.Clinics.FindAsync(id);

        //    if (clinic == null)
        //    {
        //        return NotFound();
        //    }

        //    return clinic;
        //}

        //// POST: api/Clinic
        //[HttpPost]
        //public async Task<ActionResult<Clinic>> PostClinic(Clinic clinic)
        //{
        //    _context.Clinics.Add(clinic);
        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateException)
        //    {
        //        if (ClinicExists(clinic.Id))
        //        {
        //            return Conflict();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return CreatedAtAction("GetClinic", new { id = clinic.Id }, clinic);
        //}

        //// DELETE: api/Clinic/5
        //[HttpDelete("{id}")]
        //public async Task<ActionResult<Clinic>> DeleteClinic(Guid id)
        //{
        //    var clinic = await _context.Clinics.FindAsync(id);
        //    if (clinic == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.Clinics.Remove(clinic);
        //    await _context.SaveChangesAsync();

        //    return clinic;
        //}

        private bool ClinicExists(Guid id)
        {
            return _context.Clinics.Any(e => e.Id == id);
        }
    }
}
