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
    public class CityController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: City
        public ActionResult Index()
        {
            return View(db.SysGovernoratesValues.OrderBy(n => n.Text_ar).ToList());
        }

        // GET: City/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SysGovernoratesValue sysGovernoratesValue = db.SysGovernoratesValues.Find(id);
            if (sysGovernoratesValue == null)
            {
                return HttpNotFound();
            }
            ViewBag.Gov = sysGovernoratesValue.Text_ar;
            return View(db.SysCitiesValues.Where(g => g.GovId==id).OrderBy(n => n.Text_ar).ToList());
        }

        //// GET: City/Create
        //public ActionResult Create()
        //{
        //    return View();
        //}

        //// POST: City/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "Id,Text_ar,Text_en")] SysGovernoratesValue sysGovernoratesValue)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.SysGovernoratesValues.Add(sysGovernoratesValue);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(sysGovernoratesValue);
        //}

        //// GET: City/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysGovernoratesValue sysGovernoratesValue = db.SysGovernoratesValues.Find(id);
        //    if (sysGovernoratesValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysGovernoratesValue);
        //}

        //// POST: City/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,Text_ar,Text_en")] SysGovernoratesValue sysGovernoratesValue)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(sysGovernoratesValue).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(sysGovernoratesValue);
        //}

        //// GET: City/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysGovernoratesValue sysGovernoratesValue = db.SysGovernoratesValues.Find(id);
        //    if (sysGovernoratesValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysGovernoratesValue);
        //}

        //// POST: City/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    SysGovernoratesValue sysGovernoratesValue = db.SysGovernoratesValues.Find(id);
        //    db.SysGovernoratesValues.Remove(sysGovernoratesValue);
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
