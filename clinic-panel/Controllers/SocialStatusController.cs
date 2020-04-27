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
    public class SocialStatusController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: SocialStatus
        public ActionResult Index()
        {
            return View(db.SysSocialStatusValues.ToList());
        }

        //// GET: SocialStatus/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysSocialStatusValue sysSocialStatusValue = db.SysSocialStatusValues.Find(id);
        //    if (sysSocialStatusValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysSocialStatusValue);
        //}

        //// GET: SocialStatus/Create
        //public ActionResult Create()
        //{
        //    return View();
        //}

        //// POST: SocialStatus/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "Id,Value,Text")] SysSocialStatusValue sysSocialStatusValue)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.SysSocialStatusValues.Add(sysSocialStatusValue);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(sysSocialStatusValue);
        //}

        //// GET: SocialStatus/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysSocialStatusValue sysSocialStatusValue = db.SysSocialStatusValues.Find(id);
        //    if (sysSocialStatusValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysSocialStatusValue);
        //}

        //// POST: SocialStatus/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,Value,Text")] SysSocialStatusValue sysSocialStatusValue)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(sysSocialStatusValue).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(sysSocialStatusValue);
        //}

        //// GET: SocialStatus/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysSocialStatusValue sysSocialStatusValue = db.SysSocialStatusValues.Find(id);
        //    if (sysSocialStatusValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysSocialStatusValue);
        //}

        //// POST: SocialStatus/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    SysSocialStatusValue sysSocialStatusValue = db.SysSocialStatusValues.Find(id);
        //    db.SysSocialStatusValues.Remove(sysSocialStatusValue);
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
