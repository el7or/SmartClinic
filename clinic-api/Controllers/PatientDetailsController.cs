using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;
using clinic_api.Data;
using clinic_api.DTOs;
using clinic_api.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PatientDetailsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public PatientDetailsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/PatientDetails/GetPatientDiseases/5
        [HttpGet("GetPatientDiseases/{id}/{patientId}")]
        public async Task<ActionResult<IEnumerable<PatientDiseaseDTO>>> GetPatientDiseases(Guid id, Guid patientId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var doctor = _context.Patients.Include(d => d.Doctor).FirstOrDefault(i => i.Id==patientId).Doctor;

            if (doctor == null)
            {
                return NotFound();
            }
            var model = _context.SysDiseasesQuestionsValues.Select(d => new PatientDiseaseDTO
            {
                Id = d.Id,
                QuestionTextAR = d.Text,
                QuestionTextEN = d.Value,
                IsYes = _context.PatientDiseases.Any(p => p.DiseaseId == d.Id && p.PatientId == patientId),
                Note = _context.PatientDiseases.FirstOrDefault(p => p.DiseaseId == d.Id && p.PatientId == patientId).Note
            });
            if (doctor.DiseasesQuestions == "All")
            {                
                return await model.ToListAsync();
            }
            else
            {
                int[] ids = doctor.DiseasesQuestions.Split(",").ToArray().Select(int.Parse).ToArray();
                return await model.Where(i => ids.Contains(i.Id)).ToListAsync();
            }
        }

        // PUT: api/PatientDetails/PutPatientDiseases/5
        [HttpPut("PutPatientDiseases/{id}/{patientId}")]
        public async Task<IActionResult> PutPatientDiseases(Guid id, Guid patientId, PutPatientDiseaseDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var oldPatientDiseases = _context.PatientDiseases.Where(p => p.PatientId == patientId).ToList();
            if(oldPatientDiseases.Count > 0) { _context.PatientDiseases.RemoveRange(oldPatientDiseases); }
            foreach (var disease in model.PatientDiseaseList.Where(y => y.IsYes == true))
            {
                _context.PatientDiseases.Add(new PatientDisease
                {
                    DiseaseId = disease.Id,
                    PatientId = patientId,
                    Note = disease.Note,
                    CreatedBy = id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = id,
                    UpdatedOn = DateTime.Now
                });
            }
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}