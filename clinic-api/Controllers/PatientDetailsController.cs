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
        public async Task<ActionResult<IEnumerable<GetPatientDiseaseDTO>>> GetPatientDiseases(Guid id, Guid patientId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var doctor = _context.Patients.Include(d => d.Doctor).FirstOrDefault(i => i.Id == patientId).Doctor;

            if (doctor == null)
            {
                return NotFound();
            }
            var model = _context.SysDiseasesQuestionsValues.Select(d => new GetPatientDiseaseDTO
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
            if (oldPatientDiseases.Count > 0) { _context.PatientDiseases.RemoveRange(oldPatientDiseases); }
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

        // GET: api/PatientDetails/GetPatientComplaints/5
        [HttpGet("GetPatientComplaints/{id}/{patientId}/{doctorId}")]
        public async Task<ActionResult<GetPatientComplaintDTO>> GetPatientComplaints(Guid id, Guid patientId, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            GetPatientComplaintDTO model = new GetPatientComplaintDTO
            {
                ComplaintGeneralValues = await _context.DoctorGeneralComplaintsValues.Where(d => d.DoctorId == doctorId).Select(c => new ComplaintGeneralValue
                {
                    CompId = c.Id,
                    CompName = c.Complaint
                }).ToListAsync(),
                ComplaintDetailsValues = await _context.DoctorDetailedComplaintsValues.Where(d => d.DoctorId == doctorId).Include(c => c.DoctorComplaintChoicesValues).Select(c => new ComplaintDetailsValue
                {
                    CompId = c.Id,
                    CompName = c.Complaint,
                    CompChoises = c.DoctorComplaintChoicesValues.Select(s => new ComplaintChoiceValue
                    {
                        ChoiceId = s.Id,
                        ChoiceName = s.Choice
                    }).ToList()
                }).ToListAsync(),
                PatientGeneralComplaints = await _context.PatientGeneralComplaints.Where(p => p.PatientId == patientId).Select(c => new PatientGeneralComplaintList
                {
                    Id = c.Id,
                    CompId = c.GeneralComplaintId,
                    Note = c.Note,
                    CreatedOn = c.CreatedOn
                }).ToListAsync(),
                PatientDetailsComplaints = await _context.PatientDetailedComplaints.Where(p => p.PatientId == patientId).Select(c => new PatientDetailsComplaintList
                {
                    Id = c.Id,
                    CompId = c.DetailedComplaintId,
                    ChoiceId = c.ComplaintChoiceId,
                    Period = c.Period,
                    Note = c.Note,
                    CreatedOn = c.CreatedOn,
                    AllChoices = _context.DoctorComplaintChoicesValues.Where(s => s.DetailedComplaintId == c.DetailedComplaintId).Select(s => new ComplaintChoiceValue
                    {
                        ChoiceId = s.Id,
                        ChoiceName = s.Choice
                    }).ToList()
                }).ToListAsync()
            };

            return model;
        }

        // PUT: api/PatientDetails/PutPatientComplaints/5
        [HttpPut("PutPatientComplaints/{id}/{patientId}")]
        public async Task<IActionResult> PutPatientComplaints(Guid id, Guid patientId, PutPatientComplaintDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            //var oldPatientGeneralComplaints = _context.PatientGeneralComplaints.Where(p => p.PatientId == patientId).ToList();
            //if (oldPatientGeneralComplaints.Count > 0) { _context.PatientGeneralComplaints.RemoveRange(oldPatientGeneralComplaints); }
            //var oldPatientDetailsComplaints = _context.PatientDetailedComplaints.Where(p => p.PatientId == patientId).ToList();
            //if (oldPatientDetailsComplaints.Count > 0) { _context.PatientDetailedComplaints.RemoveRange(oldPatientDetailsComplaints); }
            foreach (var complaint in model.PatientGeneralComplaints)
            {
                if (complaint.Id == 0)
                {
                    _context.PatientGeneralComplaints.Add(new PatientGeneralComplaint
                    {
                        PatientId = patientId,
                        GeneralComplaintId = complaint.CompId,
                        Note = complaint.Note,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now,
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now
                    });
                }
                else
                {
                    var oldPatientGeneralComplaint = _context.PatientGeneralComplaints.FirstOrDefault(i => i.Id == complaint.Id);
                    oldPatientGeneralComplaint.GeneralComplaintId = complaint.CompId;
                    oldPatientGeneralComplaint.Note = complaint.Note;
                    oldPatientGeneralComplaint.UpdatedBy = id;
                    oldPatientGeneralComplaint.UpdatedOn = DateTime.Now;
                    _context.Entry(oldPatientGeneralComplaint).State = EntityState.Modified;
                }
            }

            foreach (var complaint in model.PatientDetailsComplaints)
            {
                if (complaint.Id == 0)
                {
                    _context.PatientDetailedComplaints.Add(new PatientDetailedComplaint
                    {
                        PatientId = patientId,
                        DetailedComplaintId = complaint.CompId,
                        ComplaintChoiceId = complaint.ChoiceId,
                        Period = complaint.Period,
                        Note = complaint.Note,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now,
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now
                    });
                }
                else
                {
                    var oldPatientDetailsComplaint = _context.PatientDetailedComplaints.FirstOrDefault(i => i.Id == complaint.Id);
                    oldPatientDetailsComplaint.DetailedComplaintId = complaint.CompId;
                    oldPatientDetailsComplaint.ComplaintChoiceId = complaint.ChoiceId;
                    oldPatientDetailsComplaint.Period = complaint.Period;
                    oldPatientDetailsComplaint.Note = complaint.Note;
                    oldPatientDetailsComplaint.UpdatedBy = id;
                    oldPatientDetailsComplaint.UpdatedOn = DateTime.Now;
                    _context.Entry(oldPatientDetailsComplaint).State = EntityState.Modified;
                }
            }
            await _context.SaveChangesAsync();

            return NoContent();
        }

        // GET: api/PatientDetails/GetPatientHistory/5
        [HttpGet("GetPatientHistory/{id}/{patientId}")]
        public async Task<ActionResult<PatientHistoryDTO>> GetPatientHistory(Guid id, Guid patientId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = await _context.Patients.Where(i => i.Id == patientId).Select(p => new PatientHistoryDTO
            {
                FamilyHistory = p.FamilyHistory,
                TreatmentHistory = p.TreatmentHistory
            }).FirstOrDefaultAsync();

            return model;
        }

        // PUT: api/PatientDetails/PutPatientHistory/5
        [HttpPut("PutPatientHistory/{id}/{patientId}")]
        public async Task<IActionResult> PutPatientHistory(Guid id, Guid patientId, PatientHistoryDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = _context.Patients.FirstOrDefault(i => i.Id == patientId);
            patient.FamilyHistory = model.FamilyHistory;
            patient.TreatmentHistory = model.TreatmentHistory;
            patient.UpdatedBy = id;
            patient.UpdatedOn = DateTime.Now;
            _context.Entry(patient).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}