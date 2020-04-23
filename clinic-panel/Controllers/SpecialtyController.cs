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
    public class SpecialtyController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Specialty
        public ActionResult Index()
        {
            var Specialties = db.SysDoctorsSpecialties.Select(s => new SpecialtyIndexDTO
            {
                Id = s.Id,
                Text = s.Text,
                DoctorsCount = s.Doctors.Count()
            });
            return View(Specialties.ToList());
        }

        // GET: Specialty/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Specialty/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(string value)
        {
            if (value == "" || value == null) ModelState.AddModelError("Value", "لا بد من إدخال التخصص !");
            if (ModelState.IsValid)
            {
                db.SysDoctorsSpecialties.Add(new SysDoctorsSpecialty {Value = value, Text = value });
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View();
        }

        //// GET: Specialty/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysDoctorsSpecialty sysDoctorsSpecialty = db.SysDoctorsSpecialties.Find(id);
        //    if (sysDoctorsSpecialty == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysDoctorsSpecialty);
        //}

        //// POST: Specialty/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,Value,Text")] SysDoctorsSpecialty sysDoctorsSpecialty)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(sysDoctorsSpecialty).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(sysDoctorsSpecialty);
        //}

        //// GET: Specialty/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysDoctorsSpecialty sysDoctorsSpecialty = db.SysDoctorsSpecialties.Find(id);
        //    if (sysDoctorsSpecialty == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysDoctorsSpecialty);
        //}

        //// GET: Specialty/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysDoctorsSpecialty sysDoctorsSpecialty = db.SysDoctorsSpecialties.Find(id);
        //    if (sysDoctorsSpecialty == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysDoctorsSpecialty);
        //}

        //// POST: Specialty/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    SysDoctorsSpecialty sysDoctorsSpecialty = db.SysDoctorsSpecialties.Find(id);
        //    db.SysDoctorsSpecialties.Remove(sysDoctorsSpecialty);
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
