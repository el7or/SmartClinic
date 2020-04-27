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
    public class GradesController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Grades
        public ActionResult Index()
        {
            var model = new GradesIndexDTO
            {
                BloodPressureValues = db.SysBloodPressureValues.ToList(),
                DiseaseGradesValues = db.SysDiseaseGradesValues.ToList()
            };
            return View(model);
        }

        //// GET: Grades/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysDiseaseGradesValue sysDiseaseGradesValue = db.SysDiseaseGradesValues.Find(id);
        //    if (sysDiseaseGradesValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysDiseaseGradesValue);
        //}

        //// GET: Grades/Create
        //public ActionResult Create()
        //{
        //    return View();
        //}

        //// POST: Grades/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "Id,Value,Text")] SysDiseaseGradesValue sysDiseaseGradesValue)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.SysDiseaseGradesValues.Add(sysDiseaseGradesValue);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(sysDiseaseGradesValue);
        //}

        //// GET: Grades/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysDiseaseGradesValue sysDiseaseGradesValue = db.SysDiseaseGradesValues.Find(id);
        //    if (sysDiseaseGradesValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysDiseaseGradesValue);
        //}

        //// POST: Grades/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,Value,Text")] SysDiseaseGradesValue sysDiseaseGradesValue)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(sysDiseaseGradesValue).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(sysDiseaseGradesValue);
        //}

        //// GET: Grades/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysDiseaseGradesValue sysDiseaseGradesValue = db.SysDiseaseGradesValues.Find(id);
        //    if (sysDiseaseGradesValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysDiseaseGradesValue);
        //}

        //// POST: Grades/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    SysDiseaseGradesValue sysDiseaseGradesValue = db.SysDiseaseGradesValues.Find(id);
        //    db.SysDiseaseGradesValues.Remove(sysDiseaseGradesValue);
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
