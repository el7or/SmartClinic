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
            return View(db.SysGovernoratesValues.OrderBy(n => n.TextAR).ToList());
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
            ViewBag.Gov = sysGovernoratesValue.TextAR;
            ViewBag.GovId = sysGovernoratesValue.Id;
            return View(db.SysCitiesValues.Where(g => g.GovId==id).OrderBy(n => n.TextAR).ToList());
        }

        // GET: City/Create
        public ActionResult Create(int id)
        {
            SysCitiesValue city = new SysCitiesValue
            {
                GovId = id
            };
            return View(city);
        }

        // POST: City/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(SysCitiesValue city)
        {
            if (city.TextAR == "" || city.TextAR == null || city.TextEN == "" || city.TextEN == null) ModelState.AddModelError("TextEN", "لا بد من إدخال قيم في الحقلين !");
            if (ModelState.IsValid)
            {
                db.SysCitiesValues.Add(city);
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Details",new { id = city.GovId });
            }

            return View(city);
        }

        // GET: City/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SysCitiesValue city = db.SysCitiesValues.Find(id);
            if (city == null)
            {
                return HttpNotFound();
            }
            return View(city);
        }

        // POST: City/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(SysCitiesValue city)
        {
            if (city.TextAR == "" || city.TextAR == null || city.TextEN == "" || city.TextEN == null) ModelState.AddModelError("TextEN", "لا بد من إدخال قيم في الحقلين !");
            if (ModelState.IsValid)
            {
                db.Entry(city).State = EntityState.Modified;
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Details", new { id = city.GovId });
            }
            return View(city);
        }

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
