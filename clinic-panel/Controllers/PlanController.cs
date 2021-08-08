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
    public class PlanController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Plan
        public ActionResult Index()
        {
            var plans = db.Plans.Where(d => d.IsDeleted != true).Include(p => p.SysRenewalTypeValue).Select(p => new PlanIndexDTO {
                Id = p.Id,
                RenewalType = p.SysRenewalTypeValue.Text,
                RenewalFee = p.SysRenewalTypeValue.Text== "سنوي" ? p.AnnualRenewalFee: p.MonthlyRenewalFee,
                IsActive = p.IsActive == true ? "مفعل" : "معطل",
                MaxBookingsMonthly = p.MaxBookingsMonthly,
                MaxUsers = p.MaxUsers,
                SignUpFee = p.SignUpFee,
                Title = p.Title,
                SubscriptionsCount = p.Subscriptions.Select(s => s.SubscriberId).Distinct().Count()
            });
            return View(plans.ToList());
        }

        // GET: Plan/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Plan p = db.Plans.Find(id);
            if (p == null)
            {
                return HttpNotFound();
            }
            var model = new PlanDetailsDTO
            {
                Id = p.Id,
                RenewalFee = p.SysRenewalTypeValue.Text == "سنوي" ? p.AnnualRenewalFee : p.MonthlyRenewalFee,
                IsActive = p.IsActive == true ? "مفعل" : "معطل",
                MaxBookingsMonthly = p.MaxBookingsMonthly,
                MaxUsers = p.MaxUsers,
                SignUpFee = p.SignUpFee,
                Title = p.Title,
                CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.Id == p.CreatedBy).FullName,
                UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.Id == p.CreatedBy).FullName,
                CreatedOn = p.CreatedOn,
                GracePeriodDays = p.GracePeriodDays,
                MaxFileSizeMB = p.MaxFileSizeMB,
                MaxFilesMonthlyMB = p.MaxFilesMonthlyMB,
                RenewalType = p.SysRenewalTypeValue.Text,
                UpdatedOn = p.UpdatedOn                
            };
            return View(model);
        }

        //// GET: Plan/Create
        //public ActionResult Create()
        //{
        //    ViewBag.RenewalTypeId = new SelectList(db.SysRenewalTypeValues, "Id", "Value");
        //    return View();
        //}

        //// POST: Plan/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "Id,Title,Description,IsActive,IsDeleted,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,SignUpFee,RenewalTypeId,AnnualRenewalFee,MonthlyRenewalFee,GracePeriodDays,MaxUsers,MaxBookingsMonthly,MaxFilesMonthlyMB,MaxFileSizeMB")] Plan plan)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Plans.Add(plan);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.RenewalTypeId = new SelectList(db.SysRenewalTypeValues, "Id", "Value", plan.RenewalTypeId);
        //    return View(plan);
        //}

        //// GET: Plan/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Plan plan = db.Plans.Find(id);
        //    if (plan == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.RenewalTypeId = new SelectList(db.SysRenewalTypeValues, "Id", "Value", plan.RenewalTypeId);
        //    return View(plan);
        //}

        //// POST: Plan/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,Title,Description,IsActive,IsDeleted,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,SignUpFee,RenewalTypeId,AnnualRenewalFee,MonthlyRenewalFee,GracePeriodDays,MaxUsers,MaxBookingsMonthly,MaxFilesMonthlyMB,MaxFileSizeMB")] Plan plan)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(plan).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.RenewalTypeId = new SelectList(db.SysRenewalTypeValues, "Id", "Value", plan.RenewalTypeId);
        //    return View(plan);
        //}

        //// GET: Plan/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Plan plan = db.Plans.Find(id);
        //    if (plan == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(plan);
        //}

        //// POST: Plan/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Plan plan = db.Plans.Find(id);
        //    db.Plans.Remove(plan);
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
