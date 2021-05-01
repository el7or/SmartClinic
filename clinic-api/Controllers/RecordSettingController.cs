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
    public class RecordSettingController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public RecordSettingController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/RecordSetting
        [HttpGet("{id}/{doctorId}/{type}")]
        public async Task<ActionResult<IEnumerable<DoctorAnyValueDTO>>> GetRecordSettings(Guid id, Guid doctorId, ItemsType type)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            IQueryable<DoctorAnyValueDTO> model = null;
            switch (type)
            {
                case ItemsType.Complaint:
                    model = _context.DoctorGeneralComplaintsValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.Complaint).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.Complaint
                        });
                    break;
                case ItemsType.Examination:
                    model = _context.DoctorExaminationsValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.Examination).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.Examination
                        });
                    break;
                case ItemsType.Diagnosis:
                    model = _context.DoctorDiagnosisValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.Diagnosis).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.Diagnosis
                        });
                    break;
                case ItemsType.Ray:
                    model = _context.DoctorRaysValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.RayName).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.RayName
                        });
                    break;
                case ItemsType.Analysis:
                    model = _context.DoctorAnalysisValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.AnalysisName).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.AnalysisName
                        });
                    break;
                case ItemsType.PhysicalTherapy:
                    model = _context.DoctorPhysicalTherapyValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.PhysicalTherapyName).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.PhysicalTherapyName
                        });
                    break;
                case ItemsType.Operation:
                    model = _context.DoctorOperationTypesValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.OperationType).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.OperationType
                        });
                    break;
                case ItemsType.ExaminationArea:
                    model = _context.DoctorExaminationAreasValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.ExaminationArea).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.ExaminationArea
                        });
                    break;
                case ItemsType.RayArea:
                    model = _context.DoctorRayAreasValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.RayArea).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.RayArea
                        });
                    break;
                case ItemsType.PhysicalTherapyArea:
                    model = _context.DoctorPhysicalTherapyAreaValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.PhysicalTherapyArea).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.PhysicalTherapyArea
                        });
                    break;
                case ItemsType.Medicine:
                    model = _context.DoctorMedicinesValues.Where(e => e.DoctorId == doctorId && e.IsDeleted != true)
                        .OrderBy(e => e.MedicineName).Select(e => new DoctorAnyValueDTO
                        {
                            Id = e.Id,
                            Text = e.MedicineName,
                            DefaultDoseId = e.DefaultDoseId,
                            DefaultQuantityId = e.DefaultQuantityId,
                            DefaultPeriodId = e.DefaultPeriodId,
                            DefaultTimingId = e.DefaultTimingId,
                            DefaultQuantityText = e.DefaultQuantity.Text,
                            DefaultDoseText = e.DefaultDose.Text,
                            DefaultTimingText = e.DefaultTiming.Text,
                            DefaultPeriodText = e.DefaultPeriod.Text
                        });
                    break;
                default:
                    break;
            }
            return await model.ToListAsync();
        }

        // PUT: api/RecordSetting/5
        [HttpPut("{id}/{type}")]
        public async Task<IActionResult> PutRecordSetting(Guid id, ItemsType type, DoctorAnyValueDTO item)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            dynamic itemValue = null;
            switch (type)
            {
                case ItemsType.Complaint:
                    itemValue = _context.DoctorGeneralComplaintsValues.Find(item.Id);
                    itemValue.Complaint = item.Text;
                    break;
                case ItemsType.Examination:
                    itemValue = _context.DoctorExaminationsValues.Find(item.Id);
                    itemValue.Examination = item.Text;
                    break;
                case ItemsType.Diagnosis:
                    itemValue = _context.DoctorDiagnosisValues.Find(item.Id);
                    itemValue.Diagnosis = item.Text;
                    break;
                case ItemsType.Ray:
                    itemValue = _context.DoctorRaysValues.Find(item.Id);
                    itemValue.RayName = item.Text;
                    break;
                case ItemsType.Analysis:
                    itemValue = _context.DoctorAnalysisValues.Find(item.Id);
                    itemValue.AnalysisName = item.Text;
                    break;
                case ItemsType.PhysicalTherapy:
                    itemValue = _context.DoctorPhysicalTherapyValues.Find(item.Id);
                    itemValue.PhysicalTherapyName = item.Text;
                    break;
                case ItemsType.Operation:
                    itemValue = _context.DoctorOperationTypesValues.Find(item.Id);
                    itemValue.OperationType = item.Text;
                    break;
                case ItemsType.ExaminationArea:
                    itemValue = _context.DoctorExaminationAreasValues.Find(item.Id);
                    itemValue.ExaminationArea = item.Text;
                    break;
                case ItemsType.RayArea:
                    itemValue = _context.DoctorRayAreasValues.Find(item.Id);
                    itemValue.RayArea = item.Text;
                    break;
                case ItemsType.PhysicalTherapyArea:
                    itemValue = _context.DoctorPhysicalTherapyAreaValues.Find(item.Id);
                    itemValue.PhysicalTherapyArea = item.Text;
                    break;
                case ItemsType.Medicine:
                    itemValue = _context.DoctorMedicinesValues.Find(item.Id);
                    itemValue.MedicineName = item.Text;
                    itemValue.DefaultQuantityId = item.DefaultQuantityId;
                    itemValue.DefaultDoseId = item.DefaultDoseId;
                    itemValue.DefaultTimingId = item.DefaultTimingId;
                    itemValue.DefaultPeriodId = item.DefaultPeriodId;
                    break;
                default:
                    break;
            }
            itemValue.UpdatedBy = id;
            itemValue.UpdatedOn = DateTime.Now.ToEgyptTime();
            _context.Entry(itemValue).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        // POST: api/RecordSetting
        [HttpPost("{id}/{doctorId}/{type}")]
        public async Task<ActionResult<DoctorAnyValueDTO>> PostRecordSetting(Guid id, Guid doctorId, ItemsType type, DoctorAnyValueDTO item)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            dynamic newItem = null;
            switch (type)
            {
                case ItemsType.Complaint:
                    newItem = new DoctorGeneralComplaintsValue
                    {
                        DoctorId = doctorId,
                        Complaint = item.Text
                    };
                    _context.DoctorGeneralComplaintsValues.Add(newItem);
                    break;
                case ItemsType.Examination:
                    newItem = new DoctorExaminationsValue
                    {
                        DoctorId = doctorId,
                        Examination = item.Text
                    };
                    _context.DoctorExaminationsValues.Add(newItem);
                    break;
                case ItemsType.Diagnosis:
                    newItem = new DoctorDiagnosisValue
                    {
                        DoctorId = doctorId,
                        Diagnosis = item.Text
                    };
                    _context.DoctorDiagnosisValues.Add(newItem);
                    break;
                case ItemsType.Ray:
                    newItem = new DoctorRaysValue
                    {
                        DoctorId = doctorId,
                        RayName = item.Text
                    };
                    _context.DoctorRaysValues.Add(newItem);
                    break;
                case ItemsType.Analysis:
                    newItem = new DoctorAnalysisValue
                    {
                        DoctorId = doctorId,
                        AnalysisName = item.Text
                    };
                    _context.DoctorAnalysisValues.Add(newItem);
                    break;
                case ItemsType.PhysicalTherapy:
                    newItem = new DoctorPhysicalTherapyValue
                    {
                        DoctorId = doctorId,
                        PhysicalTherapyName = item.Text
                    };
                    _context.DoctorPhysicalTherapyValues.Add(newItem);
                    break;
                case ItemsType.Operation:
                    newItem = new DoctorOperationTypesValue
                    {
                        DoctorId = doctorId,
                        OperationType = item.Text
                    };
                    _context.DoctorOperationTypesValues.Add(newItem);
                    break;
                case ItemsType.ExaminationArea:
                    newItem = new DoctorExaminationAreasValue
                    {
                        DoctorId = doctorId,
                        ExaminationArea = item.Text
                    };
                    _context.DoctorExaminationAreasValues.Add(newItem);
                    break;
                case ItemsType.RayArea:
                    newItem = new DoctorRayAreasValue
                    {
                        DoctorId = doctorId,
                        RayArea = item.Text
                    };
                    _context.DoctorRayAreasValues.Add(newItem);
                    break;
                case ItemsType.PhysicalTherapyArea:
                    newItem = new DoctorPhysicalTherapyAreaValue
                    {
                        DoctorId = doctorId,
                        PhysicalTherapyArea = item.Text
                    };
                    _context.DoctorPhysicalTherapyAreaValues.Add(newItem);
                    break;
                case ItemsType.Medicine:
                    newItem = new DoctorMedicinesValue
                    {
                        DoctorId = doctorId,
                        MedicineName = item.Text,
                        DefaultQuantityId = item.DefaultQuantityId,
                        DefaultDoseId = item.DefaultDoseId,
                        DefaultTimingId = item.DefaultTimingId,
                        DefaultPeriodId = item.DefaultPeriodId
                    };
                    _context.DoctorMedicinesValues.Add(newItem);
                    break;
                default:
                    break;
            }
            newItem.IsActive = true;
            newItem.IsDeleted = false;
            newItem.CreatedBy = id;
            newItem.CreatedOn = DateTime.Now.ToEgyptTime();
            newItem.UpdatedBy = id;
            newItem.UpdatedOn = DateTime.Now.ToEgyptTime();
            await _context.SaveChangesAsync();
            item.Id = newItem.Id;
            return item;
        }

        // DELETE: api/RecordSetting/5
        [HttpDelete("{id}/{type}/{itemId}")]
        public async Task<ActionResult<SysPatientRecordSectionsValue>> DeleteRecordSetting(Guid id, ItemsType type, int itemId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }

            dynamic itemValue = null;
            switch (type)
            {
                case ItemsType.Complaint:
                    itemValue = _context.DoctorGeneralComplaintsValues.Find(itemId);
                    break;
                case ItemsType.Examination:
                    itemValue = _context.DoctorExaminationsValues.Find(itemId);
                    break;
                case ItemsType.Diagnosis:
                    itemValue = _context.DoctorDiagnosisValues.Find(itemId);
                    break;
                case ItemsType.Ray:
                    itemValue = _context.DoctorRaysValues.Find(itemId);
                    break;
                case ItemsType.Analysis:
                    itemValue = _context.DoctorAnalysisValues.Find(itemId);
                    break;
                case ItemsType.PhysicalTherapy:
                    itemValue = _context.DoctorPhysicalTherapyValues.Find(itemId);
                    break;
                case ItemsType.Operation:
                    itemValue = _context.DoctorOperationTypesValues.Find(itemId);
                    break;
                case ItemsType.ExaminationArea:
                    itemValue = _context.DoctorExaminationAreasValues.Find(itemId);
                    break;
                case ItemsType.RayArea:
                    itemValue = _context.DoctorRayAreasValues.Find(itemId);
                    break;
                case ItemsType.PhysicalTherapyArea:
                    itemValue = _context.DoctorPhysicalTherapyAreaValues.Find(itemId);
                    break;
                case ItemsType.Medicine:
                    itemValue = _context.DoctorMedicinesValues.Find(itemId);
                    break;
                default:
                    break;
            }
            itemValue.IsDeleted = true;
            itemValue.IsActive = false;
            itemValue.UpdatedBy = id;
            itemValue.UpdatedOn = DateTime.Now.ToEgyptTime();
            _context.Entry(itemValue).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        // GET: api/RecordSetting/GetMedicineDefaults/5
        [HttpGet("GetMedicineDefaults/{id}")]
        public async Task<ActionResult<GetPatientPrescriptionsDTO>> GetMedicineDefaults(Guid id)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            GetPatientPrescriptionsDTO model = new GetPatientPrescriptionsDTO
            {
                QuantityValues = await _context.SysMedicineQuantityValues.Select(v => new QuantityValue
                {
                    Id = v.Id,
                    Text = v.Text
                }).ToListAsync(),
                DoseValues = await _context.SysMedicineDosesValues.Select(v => new DoseValue
                {
                    Id = v.Id,
                    Text = v.Text
                }).ToListAsync(),
                TimingValues = await _context.SysMedicineTimingsValues.Select(v => new TimingValue
                {
                    Id = v.Id,
                    Text = v.Text
                }).ToListAsync(),
                PeriodValues = await _context.SysMedicinePeriodsValues.Select(v => new PeriodValue
                {
                    Id = v.Id,
                    Text = v.Text
                }).ToListAsync()
            };

            return model;
        }
    }
}
