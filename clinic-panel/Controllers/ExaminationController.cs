using clinic_panel.DTOs;
using clinic_panel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace clinic_panel.Controllers
{
    public class ExaminationController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Examination/DoctorExamination/5
        public ActionResult DoctorExamination(Guid id)
        {
            var model = new ExaminationDoctorDTO
            {
                DoctorId = id,
                ExaminationTypes = db.DoctorExaminationsValues.Where(d => d.DoctorId == id).Select(e => new ExaminationType
                {
                    Id = e.Id,
                    Examination = e.Examination
                }).ToList(),
                ExaminationAreas = db.DoctorExaminationAreasValues.Where(d => d.DoctorId == id).Select(e => new ExaminationArea
                {
                    Id = e.Id,
                    Area = e.ExaminationArea
                }).ToList()
            };
            ViewBag.DoctorName = db.Doctors.Find(id).FullName;
            return View(model);
        }

        // GET: Examination/CreateExaminationType/5
        public ActionResult CreateExaminationType(Guid id)
        {
            var doctor = db.Doctors.Find(id);
            var model = new ExaminationCreateTypeDTO
            {
                DoctorId = doctor.Id
            };
            ViewBag.DoctorName = doctor.FullName;
            return View(model);
        }

        // POST: Examination/CreateExaminationType
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateExaminationType(ExaminationCreateTypeDTO model)
        {
            if (ModelState.IsValid)
            {
                db.DoctorExaminationsValues.Add(new DoctorExaminationsValue
                {
                    DoctorId = model.DoctorId,
                    Examination = model.Examination,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("DoctorExamination", new { id = model.DoctorId });
            }
            return View();
        }

        // GET: Examination/CreateExaminationArea/5
        public ActionResult CreateExaminationArea(Guid id)
        {
            var doctor = db.Doctors.Find(id);
            var model = new ExaminationCreateTypeDTO
            {
                DoctorId = doctor.Id
            };
            ViewBag.DoctorName = doctor.FullName;
            return View(model);
        }

        // POST: Examination/CreateExaminationArea
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateExaminationArea(ExaminationCreateTypeDTO model)
        {
            if (ModelState.IsValid)
            {
                db.DoctorExaminationAreasValues.Add(new  DoctorExaminationAreasValue
                {
                    DoctorId = model.DoctorId,
                    ExaminationArea = model.Examination,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("DoctorExamination", new { id = model.DoctorId });
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