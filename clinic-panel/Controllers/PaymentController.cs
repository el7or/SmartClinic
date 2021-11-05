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
    public class PaymentController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Payment
        public ActionResult Index()
        {
            var allPayments = db.SubscriptionPayments.Select(p => p.Paid).DefaultIfEmpty(0).Sum();
            var spentExpenses = db.Expenses.Where(t => t.ExpenseTypeId == 1).Select(e => e.ExpenseCost).DefaultIfEmpty(0).Sum();
            var model = new PaymentDTOs
            {
                AllPayments = allPayments,
                //ExpensesBalance = allPayments / 3,
                SpentExpenses = spentExpenses,
                //RemainingExpenses = (allPayments / 3) - spentExpenses,
            };
            return View(model);
        }

        // GET: Payment/Expenses
        public ActionResult Expenses()
        {
            var model = db.Expenses.Where(t => t.ExpenseTypeId == 1).Select(e => new ExpenseDTO
            {
                ExpenseCost = e.ExpenseCost,
                ExpenseDate = e.ExpenseDate,
                Note = e.Note,
                CreatedBy = db.AspNetUsers.FirstOrDefault(n => n.Id == e.CreatedBy).FullName,
                CreatedOn = e.CreatedOn
            }).ToList();
            return View(model);
        }

        // GET: Payment/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Payment/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CreateExpenseDTO model)
        {
            if (ModelState.IsValid)
            {
                var expens = new Expens
                {
                    ExpenseCost = model.ExpenseCost,
                    ExpenseDate = model.ExpenseDate,
                    Note =  model.Note,
                    ExpenseTypeId = 1,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                };
                db.Expenses.Add(expens);
                db.SaveChanges();
                return RedirectToAction("Expenses");
            }

            return View(model);
        }

        // GET: Payment/CreateWithdrawal
        public ActionResult CreateWithdrawal(int typeId)
        {
            ViewBag.ExpenseTypeId = typeId;
            return View();
        }

        // POST: Payment/CreateWithdrawal
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateWithdrawal(CreateWithdrawalDTO model)
        {
            if (ModelState.IsValid)
            {
                var expens = new Expens
                {
                    ExpenseCost = model.ExpenseCost,
                    ExpenseDate = model.ExpenseDate,
                    ExpenseTypeId = model.ExpenseTypeId,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                };
                db.Expenses.Add(expens);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(model);
        }

        //// GET: Payment/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Expens expens = db.Expenses.Find(id);
        //    if (expens == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.ExpenseTypeId = new SelectList(db.SysExpenseTypes, "Id", "Value", expens.ExpenseTypeId);
        //    return View(expens);
        //}

        //// POST: Payment/Edit/5
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,ExpenseTypeId,ExpenseCost,ExpenseDate,Note,IsDeleted,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy")] Expens expens)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(expens).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.ExpenseTypeId = new SelectList(db.SysExpenseTypes, "Id", "Value", expens.ExpenseTypeId);
        //    return View(expens);
        //}

        //// GET: Payment/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Expens expens = db.Expenses.Find(id);
        //    if (expens == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(expens);
        //}

        //// POST: Payment/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Expens expens = db.Expenses.Find(id);
        //    db.Expenses.Remove(expens);
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
