﻿using System;
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

        // GET: api/PatientDetails/GetPatientExaminations/5
        [HttpGet("GetPatientExams/{id}/{patientId}/{doctorId}")]
        public async Task<ActionResult<GetPatientExaminationsDTO>> GetPatientExams(Guid id, Guid patientId, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = _context.Patients.Where(p => p.Id == patientId).Include(e => e.PatientExaminations).FirstOrDefault();
            if (patient == null)
            {
                return NotFound();
            }
            GetPatientExaminationsDTO model = new GetPatientExaminationsDTO
            {
                ExaminationTypeValues = await _context.DoctorExaminationsValues.Where(d => d.DoctorId == doctorId).Select(c => new ExaminationTypeValue
                {
                    TypeId = c.Id,
                    TypeText = c.Examination
                }).ToListAsync(),
                ExaminationAreaValues = await _context.DoctorExaminationAreasValues.Where(d => d.DoctorId == doctorId).Select(c => new ExaminationAreaValue
                {
                    AreaId = c.Id,
                    AreaText = c.ExaminationArea
                }).ToListAsync(),
                PressureValues = await _context.SysBloodPressureValues.Select(c => new BloodPressureValue
                {
                    Id = c.Id,
                    Pressure = c.Value
                }).ToListAsync(),
                PatientExaminations = new PatientExaminationsDetails
                {
                    Length = patient.Length,
                    Weight = patient.Weight,
                    Mass = patient.BodyMass,
                    Temperature = patient.Temperature,
                    PressureId = patient.BloodPressureId,
                    Examinations = patient.PatientExaminations.Select(e => new PatientExaminationList
                    {
                        Id = e.Id,
                        TypeId = e.ExaminationId,
                        AreaId = e.ExaminationAreaId,
                        CreatedOn = e.CreatedOn
                    }).ToList()
                }
            };

            return model;
        }

        // PUT: api/PatientDetails/PutPatientExaminations/5
        [HttpPut("PutPatientExaminations/{id}/{patientId}")]
        public async Task<IActionResult> PutPatientExaminations(Guid id, Guid patientId, PatientExaminationsDetails model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = _context.Patients.Where(p => p.Id == patientId).Include(e => e.PatientExaminations).FirstOrDefault();
            patient.Length = model.Length;
            patient.Weight = model.Weight;
            patient.BodyMass = model.Mass;
            patient.Temperature = model.Temperature;
            patient.BloodPressureId = model.PressureId;

            foreach (var exam in model.Examinations)
            {
                if (exam.Id == 0)
                {
                    _context.PatientExaminations.Add(new PatientExamination
                    {
                        PatientId = patientId,
                        ExaminationId = exam.TypeId,
                        ExaminationAreaId = exam.AreaId,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now,
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now
                    });
                }
                else
                {
                    var oldPatientExams = patient.PatientExaminations.FirstOrDefault(i => i.Id == exam.Id);
                    oldPatientExams.ExaminationId = exam.TypeId;
                    oldPatientExams.ExaminationAreaId = exam.AreaId;
                    oldPatientExams.UpdatedBy = id;
                    oldPatientExams.UpdatedOn = DateTime.Now;
                }
            }
            _context.Entry(patient).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return NoContent();
        }

        // GET: api/PatientDetails/GetPatientDiagnosis/5
        [HttpGet("GetPatientDiagnosis/{id}/{patientId}/{doctorId}")]
        public async Task<ActionResult<GetPatientDiagnosis>> GetPatientDiagnosis(Guid id, Guid patientId, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = _context.Patients.Where(p => p.Id == patientId).Include(e => e.PatientDiagnosis).FirstOrDefault();
            if (patient == null)
            {
                return NotFound();
            }
            GetPatientDiagnosis model = new GetPatientDiagnosis
            {
                DiagnosisValues = await _context.DoctorDiagnosisValues.Where(d => d.DoctorId == doctorId).Select(c => new DiagnosisValue
                {
                    Id = c.Id,
                    Text = c.Diagnosis
                }).ToListAsync(),
                DiseaseValues = await _context.SysDiseaseGradesValues.Select(c => new DiseaseValue
                {
                    Id = c.Id,
                    Text = c.Value
                }).ToListAsync(),
                PatientDiagnosis = patient.PatientDiagnosis.Select(e => new PatientDiagnosisList
                {
                    Id = e.Id,
                    DiagnosisId = e.DiagnosisId,
                    GradeId = e.GradeId,
                    Note = e.Note,
                    CreatedOn = e.CreatedOn
                }).ToList()
            };

            return model;
        }

        // PUT: api/PatientDetails/PutPatientDiagnosis/5
        [HttpPut("PutPatientDiagnosis/{id}/{patientId}")]
        public async Task<IActionResult> PutPatientDiagnosis(Guid id, Guid patientId, PutPatientDiagnosis model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = _context.Patients.Where(p => p.Id == patientId).Include(e => e.PatientDiagnosis).FirstOrDefault();

            foreach (var diagnose in model.PatientDiagnosis)
            {
                if (diagnose.Id == 0)
                {
                    _context.PatientDiagnosis.Add(new PatientDiagnosis
                    {
                        PatientId = patientId,
                        DiagnosisId = diagnose.DiagnosisId,
                        GradeId = diagnose.GradeId,
                        Note = diagnose.Note,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now,
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now
                    });
                }
                else
                {
                    var oldPatientDiagnose= patient.PatientDiagnosis.FirstOrDefault(i => i.Id == diagnose.Id);
                    oldPatientDiagnose.DiagnosisId = diagnose.DiagnosisId;
                    oldPatientDiagnose.GradeId = diagnose.GradeId;
                    oldPatientDiagnose.Note = diagnose.Note;
                    oldPatientDiagnose.UpdatedBy = id;
                    oldPatientDiagnose.UpdatedOn = DateTime.Now;
                }
            }
            _context.Entry(patient).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}