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
    public class PatientController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public PatientController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Patient
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Patient>>> GetPatients()
        {
            return await _context.Patients.ToListAsync();
        }

        // GET: api/Patient/5
        [HttpGet("{id}/{clinicId}/{seqNo}")]
        public async Task<ActionResult<PatientGetDTO>> GetPatient(Guid id, Guid clinicId, int seqNo)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = await _context.Patients.FirstOrDefaultAsync(p => p.ClinicId == clinicId && p.SeqNo == seqNo);

            if (patient == null)
            {
                return NotFound();
            }

            return new PatientGetDTO
            {
                PatientId = patient.Id,
                Age = patient.Age,
                Career = patient.Career,
                Gender = patient.Gender,
                Mobile = patient.Phone,
                Name = patient.FullName,
                Status = patient.SocialStatusId,
                City = patient.GovernorateId,
                Area = patient.CityId
            };
        }

        // PUT: api/Patient/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPatient(Guid id, PatientPutDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = await _context.Patients.FirstOrDefaultAsync(p => p.ClinicId == model.ClinicId && p.SeqNo == model.Id);
            patient.FullName = model.FullName;
            patient.Phone = model.Phone;
            patient.Age = model.Age;
            patient.Gender = model.Gender;
            patient.SocialStatusId = model.SocialStatusId;
            patient.Career = model.Career;
            patient.GovernorateId = model.GovernorateId;
            patient.CityId = model.CityId;
            patient.UpdatedBy = id;
            patient.UpdatedOn = DateTime.Now;
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
            int seqNo = _context.Patients.Where(p => p.ClinicId == model.ClinicId).Count() + 1;
            var patient = new Patient
            {
                Id = Guid.NewGuid(),
                DoctorId = model.DoctorId,
                ClinicId = model.ClinicId,
                SeqNo = seqNo,
                FullName = model.FullName,
                Phone = model.Phone,
                Age = model.Age,
                Gender = model.Gender,
                SocialStatusId = model.SocialStatusId,
                Career = model.Career,
                GovernorateId = model.GovernorateId,
                CityId = model.CityId,
                IsActive = true,
                IsDeleted = false,
                CreatedBy = id,
                CreatedOn = DateTime.Now,
                UpdatedBy = id,
                UpdatedOn = DateTime.Now
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

            return Ok(new { seqNo = patient.SeqNo });
        }

        // DELETE: api/Patient/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Patient>> DeletePatient(Guid id)
        {
            var patient = await _context.Patients.FindAsync(id);
            if (patient == null)
            {
                return NotFound();
            }

            _context.Patients.Remove(patient);
            await _context.SaveChangesAsync();

            return patient;
        }

        private bool PatientExists(Guid id)
        {
            return _context.Patients.Any(e => e.Id == id);
        }
    }
}
