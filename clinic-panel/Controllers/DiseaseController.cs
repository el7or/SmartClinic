using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using clinic_panel.Models;

namespace clinic_panel.Controllers
{
    public class DiseaseController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Disease
        public ActionResult Index()
        {
            return View(db.SysDiseasesQuestionsValues.ToList());
        }

        // GET: Disease/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Disease/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Value,Text")] SysDiseasesQuestionsValue sysDiseasesQuestionsValue)
        {
            if (ModelState.IsValid)
            {
                db.SysDiseasesQuestionsValues.Add(sysDiseasesQuestionsValue);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(sysDiseasesQuestionsValue);
        }

        // GET: Disease/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SysDiseasesQuestionsValue sysDiseasesQuestionsValue = db.SysDiseasesQuestionsValues.Find(id);
            if (sysDiseasesQuestionsValue == null)
            {
                return HttpNotFound();
            }
            return View(sysDiseasesQuestionsValue);
        }

        // POST: Disease/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Value,Text")] SysDiseasesQuestionsValue sysDiseasesQuestionsValue)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sysDiseasesQuestionsValue).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sysDiseasesQuestionsValue);
        }

        //// GET: Disease/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysDiseasesQuestionsValue sysDiseasesQuestionsValue = db.SysDiseasesQuestionsValues.Find(id);
        //    if (sysDiseasesQuestionsValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysDiseasesQuestionsValue);
        //}

        //// GET: Disease/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysDiseasesQuestionsValue sysDiseasesQuestionsValue = db.SysDiseasesQuestionsValues.Find(id);
        //    if (sysDiseasesQuestionsValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysDiseasesQuestionsValue);
        //}

        //// POST: Disease/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    SysDiseasesQuestionsValue sysDiseasesQuestionsValue = db.SysDiseasesQuestionsValues.Find(id);
        //    db.SysDiseasesQuestionsValues.Remove(sysDiseasesQuestionsValue);
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
