using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using clinic_panel.DTOs;
using clinic_panel.Models;

namespace clinic_panel.Controllers
{
    public class DoctorController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Doctor
        public ActionResult Index()
        {
            var doctors = db.Doctors.Include(s => s.SysDoctorsSpecialty).Include(c => c.Clinics).Include(p => p.Patients)
                .Select(d => new DoctorIndexDTO
                {
                    Id = d.Id,
                    FullName = d.FullName,
                    Specialty = d.SysDoctorsSpecialty.Text,
                    Plan = db.Subscriptions.FirstOrDefault(p => p.SubscriberId == d.Id).Plan.Title,
                    StartPlanDate = db.Subscriptions.FirstOrDefault(p => p.SubscriberId == d.Id).StartDate,
                    EndPlanDate = db.Subscriptions.FirstOrDefault(p => p.SubscriberId == d.Id).EndDate,
                    UsersCount = d.Clinics.Sum(c => c.AspNetUsers.Count()),
                    ClinicsCount = d.Clinics.Count(),
                    PatientsCount = d.Patients.Count(),
                    IsActive = d.IsActive == false ? "معطل" : "مفعل",
                });
            return View(doctors.ToList());
        }

        // GET: Doctor/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Doctor doctor = db.Doctors.Find(id);
            if (doctor == null)
            {
                return HttpNotFound();
            }
            return View(doctor);
        }

        // GET: Doctor/Create
        public ActionResult Create()
        {
            ViewBag.SpecialtyId = new SelectList(db.SysDoctorsSpecialties, "Id", "Value");
            return View();
        }

        // POST: Doctor/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,UserId,SpecialtyId,FullName,IsActive,IsDeleted,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,PatientRecordSections,DiseasesQuestions,Phone1,Phone2,Phone3,WhatsApp,Email1,Email2,Facebook,Twitter,LinkedIn,Instagram")] Doctor doctor)
        {
            if (ModelState.IsValid)
            {
                doctor.Id = Guid.NewGuid();
                db.Doctors.Add(doctor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SpecialtyId = new SelectList(db.SysDoctorsSpecialties, "Id", "Value", doctor.SpecialtyId);
            return View(doctor);
        }

        //// GET: Doctor/Edit/5
        //public ActionResult Edit(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Doctor doctor = db.Doctors.Find(id);
        //    if (doctor == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.SpecialtyId = new SelectList(db.SysDoctorsSpecialties, "Id", "Value", doctor.SpecialtyId);
        //    return View(doctor);
        //}

        //// POST: Doctor/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,UserId,SpecialtyId,FullName,IsActive,IsDeleted,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,PatientRecordSections,DiseasesQuestions,Phone1,Phone2,Phone3,WhatsApp,Email1,Email2,Facebook,Twitter,LinkedIn,Instagram")] Doctor doctor)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(doctor).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.SpecialtyId = new SelectList(db.SysDoctorsSpecialties, "Id", "Value", doctor.SpecialtyId);
        //    return View(doctor);
        //}

        //// GET: Doctor/Delete/5
        //public ActionResult Delete(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Doctor doctor = db.Doctors.Find(id);
        //    if (doctor == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(doctor);
        //}

        //// POST: Doctor/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(Guid id)
        //{
        //    Doctor doctor = db.Doctors.Find(id);
        //    db.Doctors.Remove(doctor);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

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
