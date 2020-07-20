using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using clinic_api.Data;
using clinic_api.Models;
using clinic_api.DTOs;
using clinic_api.Helper;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PharmacyController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public PharmacyController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Pharmacy/GetNewPresc
        [HttpGet("GetNewPresc/{id}/{pharmacyId}")]
        public async Task<ActionResult<IEnumerable<PharmacyNewPrescriptionDTO>>> GetPatientPrescriptions(Guid id, Guid pharmacyId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = _context.PatientPrescriptions.Where(p => p.PharmacyId == pharmacyId && p.IsPharmacyDone != true && p.IsPharmacyDelete != true)
               .Include(p => p.Patient).ThenInclude(p => p.Doctor)
               .Include(p => p.Patient).ThenInclude(p => p.Governorate)
               .Include(p => p.Patient).ThenInclude(p => p.City)
               .Include(m => m.PrescriptionMedicines).ThenInclude(m => m.Medicine)
               .Include(m => m.PrescriptionMedicines).ThenInclude(m => m.Quantity)
               .Include(m => m.PrescriptionMedicines).ThenInclude(m => m.Dose)
               .Include(m => m.PrescriptionMedicines).ThenInclude(m => m.Timing)
               .Include(m => m.PrescriptionMedicines).ThenInclude(m => m.Period)
               .OrderByDescending(d => d.UpdatedOn)
               .Select(p => new PharmacyNewPrescriptionDTO
               {
                   Id = p.Id,
                   DoctorFullName = p.Patient.Doctor.FullName,
                   PatientFullName = p.Patient.FullName,
                   Phone = p.Patient.Phone,
                   Phone2 = p.Patient.Phone2,
                   Career = p.Patient.Career,
                   City = p.Patient.Governorate.TextAR + " - " + p.Patient.City.TextAR,
                   CreatedOn = p.UpdatedOn,
                   Note = p.Note,
                   MedicinesPresc = p.PrescriptionMedicines.Select(m => new MedicinesPresc
                   {
                       Medicine = m.Medicine.MedicineName,
                       Quantity = m.Quantity.Text,
                       Dose = m.Dose.Text,
                       Period = m.Period.Text,
                       Timing = m.Timing.Text
                   }).ToList()
               });
            return await model.ToListAsync();
        }

        // GET: api/Pharmacy/GetPrevPresc
        [HttpGet("GetPrevPresc/{id}/{pharmacyId}")]
        public async Task<ActionResult<IEnumerable<PharmacyPrevPrescriptionDTO>>> GetPrevPrescriptions(Guid id, Guid pharmacyId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = _context.PatientPrescriptions.Where(p => p.PharmacyId == pharmacyId && (p.IsPharmacyDone == true || p.IsPharmacyDelete == true))
               .Include(p => p.Patient).ThenInclude(p => p.Doctor)
               .Include(p => p.Patient).ThenInclude(p => p.Governorate)
               .Include(p => p.Patient).ThenInclude(p => p.City)
               .Include(m => m.PrescriptionMedicines).ThenInclude(m => m.Medicine)
               .Include(m => m.PrescriptionMedicines).ThenInclude(m => m.Quantity)
               .Include(m => m.PrescriptionMedicines).ThenInclude(m => m.Dose)
               .Include(m => m.PrescriptionMedicines).ThenInclude(m => m.Timing)
               .Include(m => m.PrescriptionMedicines).ThenInclude(m => m.Period)
               .OrderByDescending(d => d.UpdatedOn)
               .Select(p => new PharmacyPrevPrescriptionDTO
               {
                   Id = p.Id,
                   DoctorFullName = p.Patient.Doctor.FullName,
                   PatientFullName = p.Patient.FullName,
                   Phone = p.Patient.Phone,
                   Phone2 = p.Patient.Phone2,
                   Career = p.Patient.Career,
                   City = p.Patient.Governorate.TextAR + " - " + p.Patient.City.TextAR,
                   CreatedOn = p.UpdatedOn,
                   Note = p.Note,
                   Status = (p.IsPharmacyDone==true ? "Done" : "Canceled"),
                   MedicinesPresc = p.PrescriptionMedicines.Select(m => new MedicinesPresc
                   {
                       Medicine = m.Medicine.MedicineName,
                       Quantity = m.Quantity.Text,
                       Dose = m.Dose.Text,
                       Period = m.Period.Text,
                       Timing = m.Timing.Text
                   }).ToList()
               });
            return await model.ToListAsync();
        }

        // PUT: api/Pharmacy/PutPresc
        [HttpPut("PutPresc/{id}")]
        public async Task<IActionResult> PutPatientPrescription(Guid id, PutPrescriptionDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var patientPrescription = _context.PatientPrescriptions.Find(model.Id);
            patientPrescription.IsPharmacyDone = model.IsPharmacyDone;
            patientPrescription.IsPharmacyDelete = model.IsPharmacyDelete;
            patientPrescription.UpdatedBy = id;
            patientPrescription.UpdatedOn = DateTime.Now.ToEgyptTime();
            _context.Entry(patientPrescription).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PatientPrescriptionExists(model.Id))
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

        //// GET: api/Pharmacy/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<PatientPrescription>> GetPatientPrescription(int id)
        //{
        //    var patientPrescription = await _context.PatientPrescriptions.FindAsync(id);

        //    if (patientPrescription == null)
        //    {
        //        return NotFound();
        //    }

        //    return patientPrescription;
        //}

        //// PUT: api/Pharmacy/5
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutPatientPrescription(int id, PatientPrescription patientPrescription)
        //{
        //    if (id != patientPrescription.Id)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(patientPrescription).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!PatientPrescriptionExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}

        //// POST: api/Pharmacy
        //[HttpPost]
        //public async Task<ActionResult<PatientPrescription>> PostPatientPrescription(PatientPrescription patientPrescription)
        //{
        //    _context.PatientPrescriptions.Add(patientPrescription);
        //    await _context.SaveChangesAsync();

        //    return CreatedAtAction("GetPatientPrescription", new { id = patientPrescription.Id }, patientPrescription);
        //}

        //// DELETE: api/Pharmacy/5
        //[HttpDelete("{id}")]
        //public async Task<ActionResult<PatientPrescription>> DeletePatientPrescription(int id)
        //{
        //    var patientPrescription = await _context.PatientPrescriptions.FindAsync(id);
        //    if (patientPrescription == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.PatientPrescriptions.Remove(patientPrescription);
        //    await _context.SaveChangesAsync();

        //    return patientPrescription;
        //}

        private bool PatientPrescriptionExists(int id)
        {
            return _context.PatientPrescriptions.Any(e => e.Id == id);
        }
    }
}
