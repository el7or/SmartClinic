using clinic_panel.DTOs;
using clinic_panel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace clinic_panel.Controllers
{
    public class DiagnosisController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Diagnosis/DoctorDiagnosis/5
        public ActionResult DoctorDiagnosis(Guid id)
        {
            var model = new DiagnosisDoctorDTO
            {
                DoctorId = id,
                DiagnosisNames = db.DoctorDiagnosisValues.Where(d => d.DoctorId == id).Select(d => new DiagnosisName
                {
                    Id = d.Id,
                    Diagnosis = d.Diagnosis
                }).ToList()
            };
            ViewBag.DoctorName = db.Doctors.Find(id).FullName;
            return View(model);
        }

        // GET: Diagnosis/CreateDoctorDiagnosis/5
        public ActionResult CreateDoctorDiagnosis(Guid id)
        {
            var doctor = db.Doctors.Find(id);
            var model = new DiagnosisCreateDTO
            {
                DoctorId = doctor.Id
            };
            ViewBag.DoctorName = doctor.FullName;
            return View(model);
        }

        // POST: Diagnosis/CreateDoctorDiagnosis
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateDoctorDiagnosis(DiagnosisCreateDTO model)
        {
            if (ModelState.IsValid)
            {
                db.DoctorDiagnosisValues.Add(new DoctorDiagnosisValue
                {
                    DoctorId = model.DoctorId,
                    Diagnosis = model.Diagnosis,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                });
                db.SaveChanges();
                return RedirectToAction("DoctorDiagnosis", new { id = model.DoctorId });
            }
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}