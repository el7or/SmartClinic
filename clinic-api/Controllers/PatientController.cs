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
using X.PagedList;
using clinic_api.Helper;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PatientController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public PatientController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Patient/5
        [HttpGet("{id}/{clinicId}/{seqNo}")]
        public async Task<ActionResult<PatientGetDTO>> GetPatient(Guid id, Guid clinicId, int seqNo)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = await _context.Patients.Where(p => p.ClinicId == clinicId && p.SeqNo == seqNo && p.IsDeleted != true)
            .Include(b => b.Bookings).Include(s => s.City).FirstOrDefaultAsync();
            var patientHeaderInfo = new PatientGetDTO
            {
                PatientId = patient.Id,
                Age = patient.Age,
                Name = patient.FullName,
                VisitsCount = patient.Bookings.Count(),
                AreaTextEN = patient.City?.TextEN,
                AreaTextAR = patient.City?.TextAR
            };
            return patientHeaderInfo;
        }

        // GET: api/Patient/5 (get patients list)
        [HttpGet("{id}/{pageNo}/{pageSize}/{clinicId}/{doctorId?}")]
        public async Task<ActionResult<PatientsGetPagedDTO>> GetPatients(Guid id, int pageNo, int pageSize, Guid clinicId, Guid? doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            if (doctorId == null)
            {
                var patients = await _context.Patients.Include(b => b.Bookings).Where(c => c.ClinicId == clinicId && c.IsDeleted != true).OrderByDescending(d => d.CreatedOn)
                    .Select(p => new PatientsListDTO
                    {
                        Id = p.Id,
                        CodeId = p.SeqNo,
                        Name = p.FullName,
                        Mobile = p.Phone,
                        VisitsCount = p.Bookings.Count(),
                        LastVisit = p.Bookings.Count() == 0 ? (DateTime?)null : p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().BookingDateTime,
                        LastVisitType = p.Bookings.Count() == 0 ? "" : p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().Type.Text,
                        LastVisitBookId = p.Bookings.Count() == 0 ? 0 : (p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().IsAttend == true || p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().IsCanceled == true ? 0 : p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().Id)
                    }).ToPagedListAsync(pageNo, pageSize);
                var patientPagination = new PagedList
                {
                    PageCount = patients.PageCount,
                    PageNumber = patients.PageNumber,
                    PageSize = patients.PageSize,
                    TotalItemCount = patients.TotalItemCount
                };
                return new PatientsGetPagedDTO
                {
                    Patients = patients,
                    Pagination = patientPagination
                };
            }
            else
            {
                var patients = await _context.Patients.Include(b => b.Bookings).Where(c => c.DoctorId == doctorId && c.ClinicId == clinicId && c.IsDeleted != true).OrderByDescending(d => d.CreatedOn)
                    .Select(p => new PatientsListDTO
                    {
                        Id = p.Id,
                        CodeId = p.SeqNo,
                        Name = p.FullName,
                        Mobile = p.Phone,
                        VisitsCount = p.Bookings.Count(),
                        LastVisit = p.Bookings.Count() == 0 ? (DateTime?)null : p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().BookingDateTime,
                        LastVisitType = p.Bookings.Count() == 0 ? "" : p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().Type.Text,
                        LastVisitBookId = p.Bookings.Count() == 0 ? 0 : (p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().IsAttend == true || p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().IsCanceled == true ? 0 : p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().Id)
                    }).ToPagedListAsync(pageNo, pageSize);
                var patientPagination = new PagedList
                {
                    PageCount = patients.PageCount,
                    PageNumber = patients.PageNumber,
                    PageSize = patients.PageSize,
                    TotalItemCount = patients.TotalItemCount
                };
                return new PatientsGetPagedDTO
                {
                    Patients = patients,
                    Pagination = patientPagination
                };
            }
        }

        // GET: api/Patient/5
        [HttpGet("SearchPatients/{id}/{clinicId}/{pageNo}/{pageSize}/{searchText}")]
        public async Task<ActionResult<PatientsGetPagedDTO>> SearchPatients(Guid id, Guid clinicId, int pageNo, int pageSize, string searchText)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            searchText = searchText.Trim().Normalize_AR();
            var patients = await _context.Patients.Include(b => b.Bookings)
                .Where(p => p.ClinicId == clinicId && p.IsDeleted != true && (p.FullName.Contains(searchText) || p.Phone.Trim() == searchText || p.Phone2.Trim() == searchText)).OrderByDescending(d => d.CreatedOn)
                .Select(p => new PatientsListDTO
                {
                    Id = p.Id,
                    CodeId = p.SeqNo,
                    Name = p.FullName,
                    Mobile = p.Phone,
                    VisitsCount = p.Bookings.Count(),
                    LastVisit = p.Bookings.Count() == 0 ? (DateTime?)null : p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().BookingDateTime,
                    LastVisitType = p.Bookings.Count() == 0 ? "" : p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().Type.Text,
                    LastVisitBookId = p.Bookings.Count() == 0 ? 0 : (p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().IsAttend == true || p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().IsCanceled == true ? 0 : p.Bookings.OrderByDescending(d => d.CreatedOn).FirstOrDefault().Id)
                }).ToPagedListAsync(pageNo, pageSize);
            var patientPagination = new PagedList
            {
                PageCount = patients.PageCount,
                PageNumber = patients.PageNumber,
                PageSize = patients.PageSize,
                TotalItemCount = patients.TotalItemCount
            };
            return new PatientsGetPagedDTO
            {
                Patients = patients,
                Pagination = patientPagination
            };
        }

        // GET: api/Patient/5
        [HttpGet("CheckPatientExist/{id}/{clinicId}/{patientName}")]
        public async Task<ActionResult<int>> CheckPatientExist(Guid id, Guid clinicId, string patientName)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            patientName = patientName.Trim().Normalize_AR();
            var isPatientExist = await _context.Patients.FirstOrDefaultAsync(p => p.ClinicId == clinicId && p.IsDeleted != true && (p.FullName == patientName));
            if (isPatientExist == null)
            {
                return 0;
            }
            else
            {
                return isPatientExist.SeqNo;
            }
        }

        // GET: api/Patient/5
        [HttpGet("GetPatientBasic/{id}/{patientId}")]
        public async Task<ActionResult<PatientValuesGetDTO>> GetPatientBasic(Guid id, string patientId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            PatientGetBasicDTO patientDetails = null;
            if (patientId != "new")
            {
                var patient = await _context.Patients.FirstOrDefaultAsync(p => p.Id == Guid.Parse(patientId) && p.IsDeleted != true);
                patientDetails = new PatientGetBasicDTO
                {
                    PatientId = patient.Id,
                    Age = patient.Age,
                    Career = patient.Career,
                    Gender = patient.Gender,
                    Mobile = patient.Phone,
                    Mobile2 = patient.Phone2,
                    Name = patient.FullName,
                    Status = patient.SocialStatusId,
                    City = patient.GovernorateId,
                    Area = patient.CityId,
                    DoctorId = patient.DoctorId,
                    Note = patient.Note
                };
            }
            var patientWithValues = new PatientValuesGetDTO
            {
                SocialStatus = _context.SysSocialStatusValues.Select(s => new SocialStatusDTO
                {
                    Id = s.Id,
                    TextEN = s.Value,
                    TextAR = s.Text
                }).ToList(),
                CityValue = _context.SysGovernoratesValues.OrderBy(a => a.TextAR).Select(g => new CityDTO
                {
                    Id = g.Id,
                    TextAR = g.TextAR,
                    TextEN = g.TextEN,
                    Cities = g.SysCitiesValues.OrderBy(a => a.TextAR).Select(c => new City
                    {
                        Id = c.Id,
                        TextAR = c.TextAR,
                        TextEN = c.TextEN
                    }).ToList()
                }).ToList(),
                BasicInfo = patientDetails
            };

            return patientWithValues;
        }

        // PUT: api/Patient/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPatient(Guid id, PatientPutDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = await _context.Patients.FirstOrDefaultAsync(p => p.Id == model.PatientId && p.IsDeleted != true);
            patient.FullName = model.FullName.Trim().Normalize_AR();
            patient.Phone = model.Phone.Trim();
            patient.Phone2 = model.Phone2 == null ? null : model.Phone2.Trim();
            patient.Age = model.Age;
            patient.Gender = model.Gender;
            patient.SocialStatusId = model.SocialStatusId;
            patient.Career = model.Career;
            patient.GovernorateId = model.GovernorateId;
            patient.CityId = model.CityId;
            patient.Note = model.Note;
            patient.UpdatedBy = id;
            patient.UpdatedOn = DateTime.Now.ToEgyptTime();
            _context.Entry(patient).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PatientExists(id))
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

        // POST: api/Patient
        [HttpPost("{id}")]
        public async Task<IActionResult> PostPatient(Guid id, PatientPostDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            int seqNo = _context.Patients.Where(p => p.ClinicId == model.ClinicId && p.IsDeleted != true).Count() + 1;
            var patient = new Patient
            {
                Id = Guid.NewGuid(),
                DoctorId = model.DoctorId,
                ClinicId = model.ClinicId,
                SeqNo = seqNo,
                FullName = model.FullName.Trim().Normalize_AR(),
                Phone = model.Phone.Trim(),
                Phone2 = model.Phone2 == null ? null : model.Phone2.Trim(),
                Age = model.Age,
                Gender = model.Gender,
                SocialStatusId = model.SocialStatusId,
                Career = model.Career,
                GovernorateId = model.GovernorateId,
                CityId = model.CityId,
                Note = model.Note,
                IsActive = true,
                IsDeleted = false,
                CreatedBy = id,
                CreatedOn = DateTime.Now.ToEgyptTime(),
                UpdatedBy = id,
                UpdatedOn = DateTime.Now.ToEgyptTime()
            };
            _context.Patients.Add(patient);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (PatientExists(patient.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return Ok(new { seqNo = patient.SeqNo, patientId = patient.Id });
        }

        // DELETE: api/Patient/5
        [HttpDelete("{id}/{patientId}")]
        public async Task<ActionResult<Patient>> DeletePatient(Guid id, Guid patientId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = await _context.Patients.FindAsync(patientId);
            if (patient == null)
            {
                return NotFound();
            }

            patient.IsDeleted = true;
            patient.UpdatedBy = id;
            patient.UpdatedOn = DateTime.Now.ToEgyptTime();
            _context.Entry(patient).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return NoContent();
        }

        // GET: api/Patient/GetPatientFile/5
        [HttpGet("GetPatientFile/{id}/{doctorId}/{patientId}")]
        public async Task<ActionResult<GetPatientRecordDTO>> GetPatientFile(Guid id, Guid doctorId, Guid patientId)
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
            var today = DateTime.Now.ToEgyptTime().Date;
            var todayBooking = await _context.Bookings.FirstOrDefaultAsync(b => b.PatientId == patientId && b.BookingDateTime.Date == today);
            if (doctor.PatientRecordSections == "All")
            {
                var model = new GetPatientRecordDTO
                {
                    RecordItems = await _context.SysPatientRecordSectionsValues.Select(d => new RecordSectionDTO
                    {
                        Id = d.Id,
                        TextAR = d.Text,
                        TextEN = d.Value,
                        IsActive = true,
                        IsExpanded = d.Value == "Diagnosis" ? true : false
                    }).ToListAsync(),
                    TodayBookingId = todayBooking == null ? 0 : todayBooking.Id
                };
                return model;
            }
            else
            {
                int[] ids = doctor.PatientRecordSections.Split(",").ToArray().Select(int.Parse).ToArray();
                var model = new GetPatientRecordDTO
                {
                    RecordItems = await _context.SysPatientRecordSectionsValues.Select(d => new RecordSectionDTO
                    {
                        Id = d.Id,
                        TextAR = d.Text,
                        TextEN = d.Value,
                        IsActive = ids.Contains(d.Id),
                        IsExpanded = d.Value == "Diagnosis" ? true : false
                    }).ToListAsync(),
                    TodayBookingId = todayBooking == null ? 0 : todayBooking.Id
                };
                return model;
            }
        }

        private bool PatientExists(Guid id)
        {
            return _context.Patients.Any(e => e.Id == id);
        }
    }
}
