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
using clinic_api.Helper;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DoctorController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public DoctorController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Doctor/GetDiseasesQuestions/5
        [HttpGet("GetDiseasesQuestions/{id}/{doctorId}")]
        public async Task<ActionResult<IEnumerable<DiseasesQuestionDTO>>> GetDiseasesQuestions(Guid id, Guid doctorId)
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
            if (doctor.DiseasesQuestions == "All")
            {
                var model = await _context.SysDiseasesQuestionsValues.Select(d => new DiseasesQuestionDTO
                {
                    Id = d.Id,
                    TextAR = d.Text,
                    TextEN = d.Value,
                    IsActive = true
                }).ToListAsync();
                return model;
            }
            else
            {
                int[] ids = doctor.DiseasesQuestions.Split(",").ToArray().Select(int.Parse).ToArray();
                var model = await _context.SysDiseasesQuestionsValues.Select(d => new DiseasesQuestionDTO
                {
                    Id = d.Id,
                    TextAR = d.Text,
                    TextEN = d.Value,
                    IsActive = ids.Contains(d.Id)
                }).ToListAsync();
                return model;
            }
        }

        // PUT: api/Doctor/PutDiseasesQuestions/5
        [HttpPut("PutDiseasesQuestions/{id}/{doctorId}/{diseasesQuestions}")]
        public async Task<IActionResult> PutDiseasesQuestions(Guid id, Guid doctorId, string diseasesQuestions)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            int[] ids = diseasesQuestions.Split(",").ToArray().Select(int.Parse).ToArray();
            if (ids.Length == _context.SysDiseasesQuestionsValues.Count()) diseasesQuestions = "All";

            var doctor = await _context.Doctors.FindAsync(doctorId);
            doctor.DiseasesQuestions = diseasesQuestions;
            _context.Entry(doctor).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return NoContent();
        }

        // GET: api/Doctor/GetRecordSections/5
        [HttpGet("GetRecordSections/{id}/{doctorId}")]
        public async Task<ActionResult<IEnumerable<RecordSectionDTO>>> GetRecordSections(Guid id, Guid doctorId)
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
            if (doctor.PatientRecordSections == "All")
            {
                var model = await _context.SysPatientRecordSectionsValues.Select(d => new RecordSectionDTO
                {
                    Id = d.Id,
                    TextAR = d.Text,
                    TextEN = d.Value,
                    IsActive = true,
                }).ToListAsync();
                return model;
            }
            else
            {
                int[] ids = doctor.PatientRecordSections.Split(",").ToArray().Select(int.Parse).ToArray();
                var model = await _context.SysPatientRecordSectionsValues.Select(d => new RecordSectionDTO
                {
                    Id = d.Id,
                    TextAR = d.Text,
                    TextEN = d.Value,
                    IsActive = ids.Contains(d.Id),
                }).ToListAsync();
                return model;
            }
        }

        // PUT: api/Doctor/PutRecordSections/5
        [HttpPut("PutRecordSections/{id}/{doctorId}/{recordSections}")]
        public async Task<IActionResult> PutRecordSections(Guid id, Guid doctorId, string recordSections)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            int[] ids = recordSections.Split(",").ToArray().Select(int.Parse).ToArray();
            if (ids.Length == _context.SysPatientRecordSectionsValues.Count()) recordSections = "All";

            var doctor = await _context.Doctors.FindAsync(doctorId);
            doctor.PatientRecordSections = recordSections;
            _context.Entry(doctor).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return NoContent();
        }

        // GET: api/Doctor/GetCompValues
        [HttpGet("GetCompValues/{id}/{doctorId}")]
        public async Task<ActionResult<IEnumerable<DoctorAnyValueDTO>>> GetCompValues(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            var model = await _context.DoctorGeneralComplaintsValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                .OrderBy(e => e.Complaint)
                .Select(e => new DoctorAnyValueDTO
                {
                    Id = e.Id,
                    Text = e.Complaint
                }).ToListAsync();

            return model;
        }

        // PUT: api/Doctor/PostDiagnosisValue/5
        [HttpPost("PostDiagnosisValue/{id}")]
        public async Task<ActionResult<DiagnosisValue>> PostDiagnosisValue(Guid id, PostDoctorDiagnosisDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var newDiagnosis = new DoctorDiagnosisValue
            {
                DoctorId = model.DoctorId,
                Diagnosis = model.Diagnosis,
                IsActive = true,
                IsDeleted = false,
                CreatedBy = id,
                CreatedOn = DateTime.Now.ToEgyptTime(),
                UpdatedBy = id,
                UpdatedOn = DateTime.Now.ToEgyptTime(),
            };
            _context.DoctorDiagnosisValues.Add(newDiagnosis);

            await _context.SaveChangesAsync();

            var diagnosisValue = new DiagnosisValue
            {
                Id = newDiagnosis.Id,
                Text = newDiagnosis.Diagnosis
            };
            return diagnosisValue;
        }
    }
}
