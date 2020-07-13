using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;
using clinic_api.Data;
using clinic_api.DTOs;
using clinic_api.Helper;
using clinic_api.Models;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PatientDetailsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IOptions<CloudinarySettings> _cloudinaryConfig;
        private Cloudinary _cloudinary;
        private readonly IHubContext<ChatHub> _hub;

        public PatientDetailsController(ApplicationDbContext context, IOptions<CloudinarySettings> cloudinaryConfig, IHubContext<ChatHub> hub)
        {
            _context = context;
            _cloudinaryConfig = cloudinaryConfig;
            Account account = new Account(_cloudinaryConfig.Value.CloudName, _cloudinaryConfig.Value.ApiKey, _cloudinaryConfig.Value.ApiSecret);
            _cloudinary = new Cloudinary(account);
            _hub = hub;
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
                    CreatedOn = DateTime.Now.ToEgyptTime(),
                    UpdatedBy = id,
                    UpdatedOn = DateTime.Now.ToEgyptTime()
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
                PatientGeneralComplaints = await _context.PatientGeneralComplaints.Where(p => p.PatientId == patientId).Include(d => d.GeneralComplaint).Select(c => new PatientGeneralComplaintList
                {
                    Id = c.Id,
                    CompId = c.GeneralComplaintId,
                    CompName = c.GeneralComplaint.Complaint,
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
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
                    });
                }
                else
                {
                    var oldPatientGeneralComplaint = _context.PatientGeneralComplaints.FirstOrDefault(i => i.Id == complaint.Id);
                    oldPatientGeneralComplaint.GeneralComplaintId = complaint.CompId;
                    oldPatientGeneralComplaint.Note = complaint.Note;
                    oldPatientGeneralComplaint.UpdatedBy = id;
                    oldPatientGeneralComplaint.UpdatedOn = DateTime.Now.ToEgyptTime();
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
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
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
                    oldPatientDetailsComplaint.UpdatedOn = DateTime.Now.ToEgyptTime();
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
            patient.UpdatedOn = DateTime.Now.ToEgyptTime();
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
            var patient = _context.Patients.Where(p => p.Id == patientId)
                .Include(e => e.PatientExaminations).ThenInclude(d => d.Examination)
                .Include(e => e.PatientExaminations).ThenInclude(d => d.ExaminationArea)
                .FirstOrDefault();
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
                    Examinations = patient.PatientExaminations.Select(e => new PatientExaminationListDTO
                    {
                        Id = e.Id,
                        TypeId = e.ExaminationId,
                        TypeName = e.Examination.Examination,
                        AreaId = e.ExaminationAreaId,
                        AreaName = e.ExaminationArea.ExaminationArea,
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
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
                    });
                }
                else
                {
                    var oldPatientExams = patient.PatientExaminations.FirstOrDefault(i => i.Id == exam.Id);
                    oldPatientExams.ExaminationId = exam.TypeId;
                    oldPatientExams.ExaminationAreaId = exam.AreaId;
                    oldPatientExams.UpdatedBy = id;
                    oldPatientExams.UpdatedOn = DateTime.Now.ToEgyptTime();
                }
            }
            _context.Entry(patient).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return NoContent();
        }

        // GET: api/PatientDetails/GetPatientDiagnosis/5
        [HttpGet("GetPatientDiagnosis/{id}/{patientId}/{doctorId}")]
        public async Task<ActionResult<GetPatientDiagnosisDTO>> GetPatientDiagnosis(Guid id, Guid patientId, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patient = _context.Patients.Where(p => p.Id == patientId).Include(e => e.PatientDiagnosis).Include("PatientDiagnosis.Diagnosis").FirstOrDefault();
            if (patient == null)
            {
                return NotFound();
            }
            GetPatientDiagnosisDTO model = new GetPatientDiagnosisDTO
            {
                DiagnosisValues = await _context.DoctorDiagnosisValues.Where(d => d.DoctorId == doctorId).Select(c => new DiagnosisValue
                {
                    Id = c.Id,
                    Text = c.Diagnosis
                }).ToListAsync(),
                DiseaseValues = await _context.SysDiseaseGradesValues.Select(c => new GradeValue
                {
                    Id = c.Id,
                    Text = c.Value
                }).ToListAsync(),
                PatientDiagnosis = patient.PatientDiagnosis.Select(e => new PatientDiagnosisListDTO
                {
                    Id = e.Id,
                    DiagnosisId = e.DiagnosisId,
                    DiagnosisName = e.Diagnosis.Diagnosis,
                    IsNameValid = true,
                    GradeId = e.GradeId,
                    Note = e.Note,
                    CreatedOn = e.CreatedOn
                }).ToList()
            };

            return model;
        }

        // PUT: api/PatientDetails/PutPatientDiagnosis/5
        [HttpPut("PutPatientDiagnosis/{id}/{patientId}")]
        public async Task<IActionResult> PutPatientDiagnosis(Guid id, Guid patientId, PutPatientDiagnosisDTO model)
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
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
                    });
                }
                else
                {
                    var oldPatientDiagnose = patient.PatientDiagnosis.FirstOrDefault(i => i.Id == diagnose.Id);
                    oldPatientDiagnose.DiagnosisId = diagnose.DiagnosisId;
                    oldPatientDiagnose.GradeId = diagnose.GradeId;
                    oldPatientDiagnose.Note = diagnose.Note;
                    oldPatientDiagnose.UpdatedBy = id;
                    oldPatientDiagnose.UpdatedOn = DateTime.Now.ToEgyptTime();
                }
            }
            _context.Entry(patient).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return NoContent();
        }

        // GET: api/PatientDetails/GetPatientPresc/5
        [HttpGet("GetPatientPresc/{id}/{patientId}/{doctorId}")]
        public async Task<ActionResult<GetPatientPrescriptionsDTO>> GetPatientPresc(Guid id, Guid patientId, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var pharmacies = _context.Pharmacies.Where(p => p.IsDeleted != true && p.PharmacyName != "pharmacy test").OrderBy(p => p.PharmacyName);
            var doctorPharmacy = _context.Doctors.Find(doctorId).PharmacyId;
            var prevPatientPrescriptions = await _context.PatientPrescriptions.Where(p => p.PatientId == patientId).Include(e => e.PrescriptionMedicines).Include("PrescriptionMedicines.Medicine").ToListAsync();
            GetPatientPrescriptionsDTO model = new GetPatientPrescriptionsDTO
            {
                MedicineValues = _context.DoctorMedicinesValues.Where(d => d.DoctorId==doctorId).OrderBy(m => m.MedicineName).Select(v => new MedicineValue
                {
                    Id = v.Id,
                    Text = v.MedicineName
                }).ToList(),
                QuantityValues = _context.SysMedicineQuantityValues.Select(v => new QuantityValue
                {
                    Id = v.Id,
                    Text = v.Text
                }).ToList(),
                DoseValues = _context.SysMedicineDosesValues.Select(v => new DoseValue
                {
                    Id = v.Id,
                    Text = v.Text
                }).ToList(),
                TimingValues = _context.SysMedicineTimingsValues.Select(v => new TimingValue
                {
                    Id = v.Id,
                    Text = v.Text
                }).ToList(),
                PeriodValues = _context.SysMedicinePeriodsValues.Select(v => new PeriodValue
                {
                    Id = v.Id,
                    Text = v.Text
                }).ToList(),
                PharmacyValues = pharmacies.Select(p => new PharmacyValue { 
                    Id = p.Id,
                    Text = p.PharmacyName
                }).ToList(),
                DoctorPharmacyId = doctorPharmacy==null ? pharmacies.FirstOrDefault().Id : doctorPharmacy,
                PrevPatientPrescriptions = prevPatientPrescriptions.Select(p => new PatientPrescriptionListDTO
                {
                    Id = p.Id,
                    MedicinesNames = p.PrescriptionMedicines.Select(m => m.Medicine.MedicineName).ToArray(),
                    Note = p.Note,
                    CreatedOn = p.CreatedOn,
                    Medicines = p.PrescriptionMedicines.Select(m => new PrescriptionMedicineListDTO
                    {
                        MedicineId = m.MedicineId,
                        MedicineName = m.Medicine.MedicineName,
                        DoseId = m.DoseId,
                        QuantityId = m.QuantityId,
                        PeriodId = m.PeriodId,
                        TimingId = m.TimingId
                    }).ToList()
                }).ToList()
            };

            return model;
        }

        // POST: api/PatientDetails/PutPatientPresc/5
        [HttpPost("PostPatientPresc/{id}/{patientId}/{doctorId}")]
        public async Task<IActionResult> PostPatientPresc(Guid id, Guid patientId, Guid doctorId, PatientPrescriptionListDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patientPrescription = new PatientPrescription();
            if (model.Id == 0)
            {
                patientPrescription = new PatientPrescription
                {
                    PatientId = patientId,
                    Note = model.Note,
                    IsPrint = model.IsPrint,
                    PharmacyId = model.PharmacyId,
                    CreatedBy = id,
                    CreatedOn = DateTime.Now.ToEgyptTime(),
                    UpdatedBy = id,
                    UpdatedOn = DateTime.Now.ToEgyptTime(),
                    PrescriptionMedicines = model.Medicines.Select(m => new PrescriptionMedicine
                    {
                        MedicineId = m.MedicineId,
                        DoseId = m.DoseId,
                        QuantityId = m.QuantityId,
                        PeriodId = m.PeriodId,
                        TimingId = m.TimingId
                    }).ToList()
                };
                _context.PatientPrescriptions.Add(patientPrescription);
            }
            else
            {
                patientPrescription = _context.PatientPrescriptions.Include(m => m.PrescriptionMedicines).FirstOrDefault(i => i.Id == model.Id);
                patientPrescription.Note = model.Note;
                _context.PrescriptionMedicines.RemoveRange(patientPrescription.PrescriptionMedicines);
                patientPrescription.PrescriptionMedicines = model.Medicines.Select(m => new PrescriptionMedicine
                {
                    MedicineId = m.MedicineId,
                    DoseId = m.DoseId,
                    QuantityId = m.QuantityId,
                    PeriodId = m.PeriodId,
                    TimingId = m.TimingId
                }).ToList();
                patientPrescription.UpdatedBy = id;
                patientPrescription.UpdatedOn = DateTime.Now.ToEgyptTime();
                _context.Entry(patientPrescription).State = EntityState.Modified;
            }
            var doctor = _context.Doctors.Find(doctorId);
            doctor.PharmacyId = model.PharmacyId;
            _context.Entry(doctor).State = EntityState.Modified;
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (_context.PatientPrescriptions.Any(p => p.Id == patientPrescription.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // GET: api/PatientDetails/GetPatientRequest/5
        [HttpGet("GetPatientRequest/{id}/{patientId}/{doctorId}")]
        public async Task<ActionResult<GetPatientRequestsDTO>> GetPatientRequest(Guid id, Guid patientId, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var prevPatientRays = _context.PatientRays.Where(p => p.PatientId == patientId && p.IsDeleted != true).Include(e => e.Ray).Include(e => e.RayArea).Select(r => new PatientRequestListDTO
            {
                Id = r.Id,
                RequestId = r.RayId,
                RayAreaId = r.RayAreaId,
                RequestType = "ray",
                RequestName = r.Ray.RayName,
                RayAreaName = r.RayArea.RayArea,
                Note = r.RequestNote,
                RequestDate = r.CreatedOn,
                isHasResult = r.IsHasResult
            }).ToList();
            var prevPatientAnalsis = _context.PatientAnalysis.Where(p => p.PatientId == patientId && p.IsDeleted != true).Include(e => e.Analysis).Select(a => new PatientRequestListDTO
            {
                Id = a.Id,
                RequestId = a.AnalysisId,
                RayAreaId = null,
                RequestType = "analysis",
                RequestName = a.Analysis.AnalysisName,
                RayAreaName = null,
                Note = a.RequestNote,
                RequestDate = a.CreatedOn,
                isHasResult = a.IsHasResult
            }).ToList();
            GetPatientRequestsDTO model = new GetPatientRequestsDTO
            {
                RayValues = await _context.DoctorRaysValues.Where(d => d.DoctorId == doctorId).Select(v => new RayValue
                {
                    Id = v.Id,
                    Text = v.RayName
                }).ToListAsync(),
                RayAreaValues = await _context.DoctorRayAreasValues.Where(d => d.DoctorId == doctorId).Select(v => new RayAreaValue
                {
                    Id = v.Id,
                    Text = v.RayArea
                }).ToListAsync(),
                AnalysisValues = await _context.DoctorAnalysisValues.Where(d => d.DoctorId == doctorId).Select(v => new AnalysisValue
                {
                    Id = v.Id,
                    Text = v.AnalysisName
                }).ToListAsync(),
                PrevPatientRequests = prevPatientAnalsis != null ? prevPatientRays.Union(prevPatientAnalsis).OrderBy(p => p.RequestDate).ToList() : prevPatientRays
            };

            return model;
        }

        // POST: api/PatientDetails/PostPatientRequest/5
        [HttpPost("PostPatientRequest/{id}/{patientId}")]
        public async Task<IActionResult> PostPatientRequest(Guid id, Guid patientId, PostPatientRequestsDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            foreach (var item in model.NewPatientRequests)
            {
                if (item.RequestType == "ray")
                {
                    _context.PatientRays.Add(new PatientRay
                    {
                        PatientId = patientId,
                        RayId = item.RequestId,
                        RayAreaId = item.RayAreaId,
                        RequestNote = item.Note,
                        IsHasResult = false,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
                    });
                }
                else
                {
                    _context.PatientAnalysis.Add(new PatientAnalysis
                    {
                        PatientId = patientId,
                        AnalysisId = item.RequestId,
                        RequestNote = item.Note,
                        IsHasResult = false,
                        CreatedBy = id,
                        CreatedOn = DateTime.Now.ToEgyptTime(),
                        UpdatedBy = id,
                        UpdatedOn = DateTime.Now.ToEgyptTime()
                    });
                }
            }

            await _context.SaveChangesAsync();

            return NoContent();
        }

        // DELETE: api/PatientDetails/DeletePatientRequest/5
        [HttpDelete("DeletePatientRequest/{id}/{requestId}/{type}")]
        public async Task<IActionResult> DeletePatientRequest(Guid id, int requestId, string type)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            if (type == "ray")
            {
                var patientRay = _context.PatientRays.Find(requestId);
                if (patientRay == null)
                {
                    return NotFound();
                }
                patientRay.IsDeleted = true;
                patientRay.UpdatedBy = id;
                patientRay.UpdatedOn = DateTime.Now.ToEgyptTime();

                _context.Entry(patientRay).State = EntityState.Modified;
            }
            else
            {
                var patientAnalysis = _context.PatientAnalysis.Find(requestId);
                if (patientAnalysis == null)
                {
                    return NotFound();
                }
                patientAnalysis.IsDeleted = true;
                patientAnalysis.UpdatedBy = id;
                patientAnalysis.UpdatedOn = DateTime.Now.ToEgyptTime();

                _context.Entry(patientAnalysis).State = EntityState.Modified;
            }

            await _context.SaveChangesAsync();

            return Ok();
        }

        // GET: api/PatientDetails/GetOper/5
        [HttpGet("GetOper/{id}/{patientId}/{doctorId}")]
        public async Task<ActionResult<GetPatientOperationsDTO>> GetOper(Guid id, Guid patientId, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            GetPatientOperationsDTO model = new GetPatientOperationsDTO
            {
                OperationTypeValues = await _context.DoctorOperationTypesValues.Where(d => d.DoctorId == doctorId).Select(s => new OperationTypeValue
                {
                    Id = s.Id,
                    Text = s.OperationType
                }).ToListAsync(),
                PrevPatientOperations = await _context.PatientOperations.Where(p => p.PatientId == patientId)
                .Include(d => d.OperationType).Select(r => new PatientOperationListDTO
                {
                    Id = r.Id,
                    Type = r.OperationType.OperationType,
                    Date = r.OperationDate,
                    Place = r.Place,
                    Cost = r.Cost
                }).ToListAsync()
            };
            return model;
        }

        // POST: api/PatientDetails/PostPatientOper/5
        [HttpPost("PostPatientOper/{id}/{patientId}")]
        public async Task<IActionResult> PostPatientOper(Guid id, Guid patientId, PostPatientOperationDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            _context.PatientOperations.Add(new PatientOperation
            {
                PatientId = patientId,
                OperationTypeId = model.TypeId,
                OperationDate = model.Date,
                Place = model.Place,
                Cost = model.Cost,
                Note = model.Note,
                CreatedBy = id,
                CreatedOn = DateTime.Now.ToEgyptTime(),
                UpdatedBy = id,
                UpdatedOn = DateTime.Now.ToEgyptTime()
            });

            await _context.SaveChangesAsync();

            return NoContent();
        }

        // GET: api/PatientDetails/GetPatientRays/5
        [HttpGet("GetPatientRays/{id}/{patientId}")]
        public async Task<ActionResult<IEnumerable<RaysListDTO>>> GetPatientRays(Guid id, Guid patientId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = await _context.PatientRays.Include(d => d.Ray).Include(d => d.RayArea).Include(g => g.ResultGrade).Where(p => p.PatientId == patientId && p.IsDeleted != true).Select(r => new RaysListDTO
            {
                Id = r.Id,
                XrayName = r.Ray.RayName,
                XrayArea = r.RayArea.RayArea,
                RequestDate = r.CreatedOn,
                IsHasResult = r.IsHasResult,
                ResultDate = r.ResultDate,
                ResultGrade = r.ResultGrade.Text
            }).ToListAsync();
            return model;
        }

        // GET: api/PatientDetails/GetRay/5
        [HttpGet("GetRay/{id}/{rayId}")]
        public async Task<ActionResult<RayDetailsDTO>> GetRay(Guid id, int rayId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = await _context.PatientRays.Where(i => i.Id == rayId && i.IsDeleted != true).Include(r => r.Ray).Include(r => r.RayArea)
                .Include(r => r.PatientRayFiles).Include("PatientRayFiles.FileType").Select(r => new RayDetailsDTO
                {
                    Id = r.Id,
                    XrayName = r.Ray.RayName,
                    XrayArea = r.RayArea.RayArea,
                    RequestDate = r.CreatedOn,
                    IsHasResult = r.IsHasResult,
                    ResultDate = r.ResultDate,
                    ResultText = r.ResultText,
                    ResultGradeId = r.ResultGradeId,
                    GradeValues = _context.SysDiseaseGradesValues.Select(g => new GradeValue
                    {
                        Id = g.Id,
                        Text = g.Text
                    }).ToList(),
                    XrayFileTypes = _context.SysRayFileTypesValues.Select(t => new RayFileTypeValue
                    {
                        Id = t.Id,
                        Text = t.Text
                    }).ToList(),
                    XraysFiles = r.PatientRayFiles.Select(f => new RayFileList
                    {
                        Id = f.Id,
                        FileType = f.FileType.Text,
                        UploadDate = f.CreatedOn,
                        FileNote = f.Note,
                        FileUrl = f.Url
                    }).ToList()
                }).FirstOrDefaultAsync();
            return model;
        }

        // PUT: api/PatientDetails/PutRay/5
        [HttpPut("PutRay/{id}")]
        public async Task<IActionResult> PutRay(Guid id, PutRayDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patientRay = _context.PatientRays.Find(model.Id);
            patientRay.ResultText = model.ResultText;
            patientRay.ResultGradeId = model.ResultGradeId;
            patientRay.ResultDate = DateTime.Now.ToEgyptTime();
            patientRay.IsHasResult = true;
            patientRay.UpdatedBy = id;
            patientRay.UpdatedOn = DateTime.Now.ToEgyptTime();
            _context.Entry(patientRay).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return NoContent();
        }

        // POST: api/PatientDetails/PostRayFile/5 
        [HttpPost("PostRayFile/{id}")]
        public async Task<IActionResult> PostRayFile(Guid id, [FromForm] PostRayFileDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
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
                        Transformation = new Transformation()
                    };
                    uploadResult = _cloudinary.Upload(uploadParams);
                }
            }
            var rayFile = new PatientRayFile
            {
                PatientRayId = model.RayId,
                FileTypeId = model.FileTypeId,
                Note = model.Note,
                Url = uploadResult.Uri.ToString(),
                UrlPublicId = uploadResult.PublicId,
                CreatedBy = id,
                CreatedOn = DateTime.Now.ToEgyptTime(),
                UpdatedBy = id,
                UpdatedOn = DateTime.Now.ToEgyptTime()
            };
            _context.PatientRayFiles.Add(rayFile);

            await _context.SaveChangesAsync();
            RayFileList newFile = new RayFileList
            {
                Id = rayFile.Id,
                FileType = _context.SysRayFileTypesValues.Find(rayFile.FileTypeId).Text,
                FileNote = rayFile.Note,
                UploadDate = rayFile.CreatedOn,
                FileUrl = rayFile.Url
            };

            return Ok(newFile);
        }

        // GET: api/PatientDetails/GetPatientAnalysis/5
        [HttpGet("GetPatientAnalysis/{id}/{patientId}")]
        public async Task<ActionResult<IEnumerable<AnalysisListDTO>>> GetPatientAnalysis(Guid id, Guid patientId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = await _context.PatientAnalysis.Include(d => d.Analysis).Include(g => g.ResultGrade).Where(p => p.PatientId == patientId && p.IsDeleted != true).Select(r => new AnalysisListDTO
            {
                Id = r.Id,
                AnalysisName = r.Analysis.AnalysisName,
                RequestDate = r.CreatedOn,
                IsHasResult = r.IsHasResult,
                ResultDate = r.ResultDate,
                ResultGrade = r.ResultGrade.Text
            }).ToListAsync();
            return model;
        }

        // GET: api/PatientDetails/GetAnalysis/5
        [HttpGet("GetAnalysis/{id}/{analysisId}")]
        public async Task<ActionResult<AnalysisDetailsDTO>> GetAnalysis(Guid id, int analysisId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = await _context.PatientAnalysis.Where(i => i.Id == analysisId && i.IsDeleted != true).Include(r => r.Analysis)
                .Include(r => r.PatientAnalysisFiles).Include("PatientAnalysisFiles.FileType").Select(a => new AnalysisDetailsDTO
                {
                    Id = a.Id,
                    AnalysisName = a.Analysis.AnalysisName,
                    RequestDate = a.CreatedOn,
                    IsHasResult = a.IsHasResult,
                    ResultDate = a.ResultDate,
                    ResultText = a.ResultText,
                    ResultNote = a.ResultNote,
                    AnalysisFileTypes = _context.SysAnalysisFileTypesValues.Select(t => new AnalysisFileTypeValue
                    {
                        Id = t.Id,
                        Text = t.Text
                    }).ToList(),
                    AnalysisFiles = a.PatientAnalysisFiles.Select(f => new AnalysisFileList
                    {
                        Id = f.Id,
                        FileType = f.FileType.Text,
                        UploadDate = f.CreatedOn,
                        FileNote = f.Note,
                        FileUrl = f.Url
                    }).ToList()
                }).FirstOrDefaultAsync();
            return model;
        }

        // PUT: api/PatientDetails/PutAnalysis/5
        [HttpPut("PutAnalysis/{id}")]
        public async Task<IActionResult> PutAnalysis(Guid id, PutAnalysisDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patientAnalysis = _context.PatientAnalysis.Find(model.Id);
            patientAnalysis.ResultText = model.ResultText;
            patientAnalysis.ResultNote = model.resultNote;
            patientAnalysis.ResultDate = DateTime.Now.ToEgyptTime();
            patientAnalysis.IsHasResult = true;
            patientAnalysis.UpdatedBy = id;
            patientAnalysis.UpdatedOn = DateTime.Now.ToEgyptTime();
            _context.Entry(patientAnalysis).State = EntityState.Modified;

            await _context.SaveChangesAsync();

            return NoContent();
        }

        // POST: api/PatientDetails/PostAnalysisFile/5 
        [HttpPost("PostAnalysisFile/{id}")]
        public async Task<IActionResult> PostAnalysisFile(Guid id, [FromForm] PostAnalysisFileDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
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
                        Transformation = new Transformation()
                    };
                    uploadResult = _cloudinary.Upload(uploadParams);
                }
            }
            var analysisFile = new PatientAnalysisFile
            {
                PatientAnalysisId = model.AnalysisId,
                FileTypeId = model.FileTypeId,
                Note = model.Note,
                Url = uploadResult.Uri.ToString(),
                UrlPublicId = uploadResult.PublicId,
                CreatedBy = id,
                CreatedOn = DateTime.Now.ToEgyptTime(),
                UpdatedBy = id,
                UpdatedOn = DateTime.Now.ToEgyptTime()
            };
            _context.PatientAnalysisFiles.Add(analysisFile);

            await _context.SaveChangesAsync();
            AnalysisFileList newFile = new AnalysisFileList
            {
                Id = analysisFile.Id,
                FileType = _context.SysRayFileTypesValues.Find(analysisFile.FileTypeId).Text,
                FileNote = analysisFile.Note,
                UploadDate = analysisFile.CreatedOn,
                FileUrl = analysisFile.Url
            };

            return Ok(newFile);
        }

        // GET: api/PatientDetails/GetPatientReferral/5
        [HttpGet("GetPatientReferral/{id}/{patientId}/{doctorId}")]
        public async Task<ActionResult<GetPatientReferralsDTO>> GetPatientReferral(Guid id, Guid patientId, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            GetPatientReferralsDTO model = new GetPatientReferralsDTO
            {
                SpecialtyValues = await _context.SysDoctorsSpecialties.Include(d => d.Doctors).Select(s => new SpecialtyValue
                {
                    SpecialtyId = s.Id,
                    SpecialtyName = s.Text,
                    Doctors = s.Doctors.Where(d => d.Id != doctorId).Select(d => new DoctorValue
                    {
                        DoctorId = d.Id,
                        DoctorName = d.FullName
                    }).ToList()
                }).ToListAsync(),
                PatientDiagnosis = await _context.PatientDiagnosis.Include(d => d.Diagnosis).Where(p => p.PatientId == patientId).Select(d => new PatientDiagnosisRef
                {
                    Id = d.Id,
                    Text = d.Diagnosis.Diagnosis
                }).ToListAsync(),
                PrevPatientReferrals = await _context.PatientReferrals.Where(p => p.PatientId == patientId)
                .Include(d => d.ReferralToDoctor).ThenInclude(s => s.Specialty).Include(d => d.PatientDiagnosis).ThenInclude(d => d.Diagnosis).Select(r => new PatientReferralListDTO
                {
                    Id = r.Id,
                    DoctorName = r.ReferralToDoctor.FullName,
                    SpecialtyName = r.ReferralToDoctor.Specialty.Text,
                    DiagnosisName = r.PatientDiagnosis.Diagnosis.Diagnosis,
                    Note = r.Note,
                    CreatedOn = r.CreatedOn
                }).ToListAsync()
            };
            model.SpecialtyValues = model.SpecialtyValues.Where(s => s.Doctors.Count() > 0).ToList();
            return model;
        }

        // POST: api/PatientDetails/PostPatientReferral/5
        [HttpPost("PostPatientReferral/{id}/{patientId}")]
        public async Task<IActionResult> PostPatientReferral(Guid id, Guid patientId, PostPatientReferralDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            _context.PatientReferrals.Add(new PatientReferral
            {
                PatientId = patientId,
                ReferralToDoctorId = model.DoctorId,
                PatientDiagnosisId = model.DiagnosisId,
                Note = model.Note,
                CreatedBy = id,
                CreatedOn = DateTime.Now.ToEgyptTime(),
                UpdatedBy = id,
                UpdatedOn = DateTime.Now.ToEgyptTime()
            });
            await _context.SaveChangesAsync();

            var clinicOfDoctor = _context.DoctorClinics.FirstOrDefault(d => d.DoctorId == model.DoctorId);
            var usersInClinic = _context.Clinics.Where(i => i.Id == clinicOfDoctor.ClinicId).Include(u => u.ClinicUsers).FirstOrDefault().ClinicUsers.Select(u => u.UserId).ToArray();
            foreach (var userId in usersInClinic)
            {
                var count = _context.PatientReferrals.Where(r => r.ReferralToDoctorId == model.DoctorId && r.IsRead != true).Count();
                await _hub.Clients.User(userId.ToString()).SendAsync("UpdateExternalCount", count);
            }

            return NoContent();
        }

        // GET: api/PatientDetails/GetExternals/5
        [HttpGet("GetExtens/{id}/{doctorId}")]
        public async Task<ActionResult<IEnumerable<DoctorExternalListDTO>>> GetExtens(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = await _context.PatientReferrals.Where(d => d.ReferralToDoctorId == doctorId && d.IsApproved != true && d.IsCanceled != true)
                .Include(p => p.Patient).ThenInclude(g => g.Governorate).Include(p => p.Patient).ThenInclude(d => d.Doctor).Include(d => d.PatientDiagnosis)
                .Select(e => new DoctorExternalListDTO
                {
                    Id = e.Id,
                    PatientId = e.PatientId,
                    PatientName = e.Patient.FullName,
                    PatientMobile = e.Patient.Phone,
                    PatientGovernorateEN = e.Patient.Governorate.TextEN,
                    PatientGovernorateAR = e.Patient.Governorate.TextAR,
                    CreatedOn = e.CreatedOn,
                    Note = e.PatientDiagnosis.Diagnosis.Diagnosis,
                    RequestType = "referral",
                    ReferralFromDoctor = e.Patient.Doctor.FullName
                }).ToListAsync();
            return model;
        }

        // GET: api/PatientDetails/ConfirmExternal/5
        [HttpGet("ConfirmExternal/{id}/{referralId}/{clinicId}")]
        public async Task<IActionResult> ConfirmExternal(Guid id, int referralId, Guid clinicId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            // check if this patient not exist in current doctor create new patient and return patientId:
            var referral = _context.PatientReferrals.Find(referralId);
            var oldPatient = _context.Patients.Find(referral.PatientId);
            var checkPatient = await _context.Patients.FirstOrDefaultAsync(p => p.DoctorId == referral.ReferralToDoctorId && p.FullName.Trim().Contains(oldPatient.FullName.Trim().Normalize_AR()) && p.Phone.Trim() == oldPatient.Phone.Trim());
            if (checkPatient == null)
            {
                int seqNo = _context.Patients.Where(p => p.ClinicId == clinicId).Count() + 1;
                var newPatient = new Patient
                {
                    Id = Guid.NewGuid(),
                    DoctorId = referral.ReferralToDoctorId,
                    ClinicId = clinicId,
                    SeqNo = seqNo,
                    FullName = referral.Patient.FullName.Trim().Normalize_AR(),
                    Phone = referral.Patient.Phone.Trim(),
                    Age = referral.Patient.Age,
                    Gender = referral.Patient.Gender,
                    SocialStatusId = referral.Patient.SocialStatusId,
                    Career = referral.Patient.Career,
                    GovernorateId = referral.Patient.GovernorateId,
                    CityId = referral.Patient.CityId,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = id,
                    CreatedOn = DateTime.Now.ToEgyptTime(),
                    UpdatedBy = id,
                    UpdatedOn = DateTime.Now.ToEgyptTime()
                };
                _context.Patients.Add(newPatient);
                referral.IsRead = true;
                referral.ReadOn = DateTime.Now.ToEgyptTime();
                referral.IsApproved = true;
                referral.ApprovedOn = DateTime.Now.ToEgyptTime();
                referral.IsCanceled = false;
                _context.Entry(referral).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return Ok(new { patientId = newPatient.Id });
            }
            else
            {
                referral.IsApproved = true;
                referral.ApprovedOn = DateTime.Now.ToEgyptTime();
                referral.IsCanceled = false;
                _context.Entry(referral).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return Ok(new { patientId = checkPatient.Id });
            }
        }

        // DELETE: api/PatientDetails/DeleteExternal/5
        [HttpDelete("DeleteExternal/{id}/{referralId}")]
        public async Task<IActionResult> DeleteExternal(Guid id, int referralId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var referral = _context.PatientReferrals.Find(referralId);
            referral.IsRead = true;
            referral.ReadOn = DateTime.Now.ToEgyptTime();
            referral.IsApproved = false;
            referral.IsCanceled = true;
            referral.CanceledOn = DateTime.Now.ToEgyptTime();
            _context.Entry(referral).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}