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
    public class ClinicController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Clinic/Prices/5
        public ActionResult Prices(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var prices = new ClinicPriceDTO
            {
                Id = id,
                BookingTypePrices = db.ClinicBookingTypes.Where(c => c.ClinicId == id && c.IsDeleted != true && c.Type != "justService").OrderBy(c => c.CreatedOn).Select(t => new BookingTypePrice
                {
                    Id = t.Id,
                    Type = t.Text,
                    Price = t.Price
                }).ToList(),
                ServicePrices = db.ClinicServices.Where(c => c.ClinicId == id && c.IsDeleted != true).OrderBy(c => c.CreatedOn).Select(t => new ServicePrice
                {
                    Id = t.Id,
                    Service = t.Service,
                    Price = t.Price
                }).ToList(),
                DiscountPrices = db.ClinicDiscounts.Where(c => c.ClinicId == id && c.IsDeleted != true).OrderBy(c => c.CreatedOn).Select(t => new DiscountPrice
                {
                    Id = t.Id,
                    Discount = t.Discount,
                    Price = t.Price,
                    IsPercent = t.IsPercent
                }).ToList(),
            };
            ViewBag.ClinicName = db.Clinics.Find(id).ClinicName;
            return View(prices);
        }

        // GET: Clinic/CreateBookingType/5
        public ActionResult CreateBookingType(Guid id)
        {
            var model = new ClinicCreateBookingTypeDTO
            {
                ClinicId = id
            };
            ViewBag.ClinicName = db.Clinics.Find(id).ClinicName;
            return View(model);
        }

        // POST: Clinic/CreateBookingType
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateBookingType(ClinicCreateBookingTypeDTO model)
        {
            if (ModelState.IsValid)
            {
                var type = new ClinicBookingType
                {
                    ClinicId = model.ClinicId,
                    Type = model.Type,
                    Text = model.Type,
                    Price = model.Price,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                };
                db.ClinicBookingTypes.Add(type);
                db.SaveChanges();
                return RedirectToAction("Prices", new { id = model.ClinicId });
            }
            return View(model);
        }

        // GET: Clinic/CreateService/5
        public ActionResult CreateService(Guid id)
        {
            var model = new ClinicCreateServiceDTO
            {
                ClinicId = id
            };
            ViewBag.ClinicName = db.Clinics.Find(id).ClinicName;
            return View(model);
        }

        // POST: Clinic/CreateService
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateService(ClinicCreateServiceDTO model)
        {
            if (ModelState.IsValid)
            {
                var service = new ClinicService
                {
                    ClinicId = model.ClinicId,
                    Service = model.Service,
                    Price = model.Price,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                };
                db.ClinicServices.Add(service);
                db.SaveChanges();
                return RedirectToAction("Prices", new { id = model.ClinicId });
            }
            return View(model);
        }

        // GET: Clinic/CreateDiscount/5
        public ActionResult CreateDiscount(Guid id)
        {
            var model = new ClinicCreateDiscountDTO
            {
                ClinicId = id,
                IsPercent = false
            };
            ViewBag.ClinicName = db.Clinics.Find(id).ClinicName;
            return View(model);
        }

        // POST: Clinic/CreateDiscount
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateDiscount(ClinicCreateDiscountDTO model)
        {
            if (ModelState.IsValid)
            {
                var discount = new ClinicDiscount
                {
                    ClinicId = model.ClinicId,
                    Discount = model.Discount,
                    Price = model.Price,
                    IsPercent = model.IsPercent,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                };
                db.ClinicDiscounts.Add(discount);
                db.SaveChanges();
                return RedirectToAction("Prices", new { id = model.ClinicId });
            }
            return View(model);
        }

        //// GET: Clinic
        //public ActionResult Index()
        //{
        //    var clinics = db.Clinics.Include(c => c.SysEntryOrderValue);
        //    return View(clinics.ToList());
        //}

        //// GET: Clinic/Details/5
        //public ActionResult Details(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Clinic clinic = db.Clinics.Find(id);
        //    if (clinic == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(clinic);
        //}

        //// GET: Clinic/Create
        //public ActionResult Create()
        //{
        //    ViewBag.EntryOrderId = new SelectList(db.SysEntryOrderValues, "Id", "Value");
        //    return View();
        //}

        //// POST: Clinic/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "Id,ClinicName,IsActive,IsDeleted,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,EntryOrderId,BookingPeriod,ConsultExpiration,PrintDoctorName,PrintDoctorDegree,PrintClinicName,PrintLogoUrl,PrintAddress1,PrintAddress2,PrintAddress3,PrintPhone1,PrintPhone2,PrintPhone3,IsAllDaysOn,WorkDays,IsAllDaysSameTime,AllDaysTimeFrom,AllDaysTimeTo,SaturdayTimeFrom,SundayTimeFrom,MondayTimeFrom,TuesdayTimeFrom,WednesdayTimeFrom,ThursdayTimeFrom,FridayTimeFrom,SaturdayTimeTo,SundayTimeTo,MondayTimeTo,TuesdayTimeTo,WednesdayTimeTo,ThursdayTimeTo,FridayTimeTo")] Clinic clinic)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        clinic.Id = Guid.NewGuid();
        //        db.Clinics.Add(clinic);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.EntryOrderId = new SelectList(db.SysEntryOrderValues, "Id", "Value", clinic.EntryOrderId);
        //    return View(clinic);
        //}

        //// GET: Clinic/Edit/5
        //public ActionResult Edit(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Clinic clinic = db.Clinics.Find(id);
        //    if (clinic == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.EntryOrderId = new SelectList(db.SysEntryOrderValues, "Id", "Value", clinic.EntryOrderId);
        //    return View(clinic);
        //}

        //// POST: Clinic/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,ClinicName,IsActive,IsDeleted,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,EntryOrderId,BookingPeriod,ConsultExpiration,PrintDoctorName,PrintDoctorDegree,PrintClinicName,PrintLogoUrl,PrintAddress1,PrintAddress2,PrintAddress3,PrintPhone1,PrintPhone2,PrintPhone3,IsAllDaysOn,WorkDays,IsAllDaysSameTime,AllDaysTimeFrom,AllDaysTimeTo,SaturdayTimeFrom,SundayTimeFrom,MondayTimeFrom,TuesdayTimeFrom,WednesdayTimeFrom,ThursdayTimeFrom,FridayTimeFrom,SaturdayTimeTo,SundayTimeTo,MondayTimeTo,TuesdayTimeTo,WednesdayTimeTo,ThursdayTimeTo,FridayTimeTo")] Clinic clinic)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(clinic).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.EntryOrderId = new SelectList(db.SysEntryOrderValues, "Id", "Value", clinic.EntryOrderId);
        //    return View(clinic);
        //}

        //// GET: Clinic/Delete/5
        //public ActionResult Delete(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Clinic clinic = db.Clinics.Find(id);
        //    if (clinic == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(clinic);
        //}

        //// POST: Clinic/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(Guid id)
        //{
        //    Clinic clinic = db.Clinics.Find(id);
        //    db.Clinics.Remove(clinic);
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
