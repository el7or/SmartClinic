using clinic_panel.DTOs;
using clinic_panel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace clinic_panel.Controllers
{
    public class AnalysisController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Analysis/DoctorAnalysis/5
        public ActionResult DoctorAnalysis(Guid id)
        {
            var model = new AnalysisDoctorDTO
            {
                DoctorId = id,
                AnalysisNames = db.DoctorAnalysisValues.Where(d => d.DoctorId == id).Select(d => new AnalysisName
                {
                    Id = d.Id,
                    Analysis = d.AnalysisName
                }).ToList()
            };
            ViewBag.DoctorName = db.Doctors.Find(id).FullName;
            return View(model);
        }

        // GET: Analysis/CreateDoctorAnalysis/5
        public ActionResult CreateDoctorAnalysis(Guid id)
        {
            var doctor = db.Doctors.Find(id);
            var model = new AnalysisCreateDTO
            {
                DoctorId = doctor.Id
            };
            ViewBag.DoctorName = doctor.FullName;
            return View(model);
        }

        // POST: Analysis/CreateDoctorAnalysis
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateDoctorAnalysis(AnalysisCreateDTO model)
        {
            if (ModelState.IsValid)
            {
                db.DoctorAnalysisValues.Add(new DoctorAnalysisValue
                {
                    DoctorId = model.DoctorId,
                    AnalysisName = model.Analysis,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                });
                db.SaveChanges();
                return RedirectToAction("DoctorAnalysis", new { id = model.DoctorId });
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