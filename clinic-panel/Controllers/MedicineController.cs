using clinic_panel.DTOs;
using clinic_panel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Net;

namespace clinic_panel.Controllers
{
    public class MedicineController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Medicine
        public ActionResult Index()
        {
            var model = new MedicineIndexDTO
            {
                //MedicineNames = db.SysMedicinesValues.OrderBy(t => t.Text).Select(r => new MedicineName
                //{
                //    Id = r.Id,
                //    Text = r.Text,
                //}).ToList(),
                MedicineDoses = db.SysMedicineDosesValues.Select(r => new MedicineDose
                {
                    Id = r.Id,
                    Text = r.Text,
                }).ToList(),
                MedicineQuantities = db.SysMedicineQuantityValues.Select(r => new MedicineQuantity
                {
                    Id = r.Id,
                    Text = r.Text,
                }).ToList(),
                MedicineTimings = db.SysMedicineTimingsValues.Select(r => new MedicineTiming
                {
                    Id = r.Id,
                    Text = r.Text,
                }).ToList(),
                MedicinePeriods = db.SysMedicinePeriodsValues.Select(r => new MedicinePeriod
                {
                    Id = r.Id,
                    Text = r.Text,
                }).ToList()
            };
            return View(model);
        }

        // GET: Medicine/CreateMedicineQuantity
        public ActionResult CreateMedicineQuantity()
        {
            return View();
        }

        // POST: Medicine/CreateMedicineQuantity
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateMedicineQuantity(string value)
        {
            if (value == "" || value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                db.SysMedicineQuantityValues.Add(new SysMedicineQuantityValue { Value = value.Trim(), Text = value.Trim() });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: Medicine/EditMedicineQuantity
        public ActionResult EditMedicineQuantity(int id)
        {
            var medicine = db.SysMedicineQuantityValues.Find(id);
            return View(medicine);
        }

        // POST: Medicine/EditMedicineQuantity
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMedicineQuantity(SysMedicineQuantityValue medicine)
        {
            if (medicine.Value == "" || medicine.Value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                medicine.Text = medicine.Value.Trim();
                db.Entry(medicine).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: User/DeleteMedicineQuantity/5
        public ActionResult DeleteMedicineQuantity(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var item = db.SysMedicineQuantityValues.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }
            return View(item);
        }

        // POST: User/DeleteMedicineQuantity/5
        [HttpPost, ActionName("DeleteMedicineQuantity")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteMedicineQuantity(int id)
        {
            var item = db.SysMedicineQuantityValues.Find(id);
            db.SysMedicineQuantityValues.Remove(item);
            db.SaveChanges();
            TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
            return RedirectToAction("Index");
        }

        // GET: Medicine/CreateMedicineDose
        public ActionResult CreateMedicineDose()
        {
            return View();
        }

        // POST: Medicine/CreateMedicineDose
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateMedicineDose(string value)
        {
            if (value == "" || value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                db.SysMedicineDosesValues.Add(new SysMedicineDosesValue { Value = value.Trim(), Text = value.Trim() });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: Medicine/EditMedicineName
        public ActionResult EditMedicineDose(int id)
        {
            var medicine = db.SysMedicineDosesValues.Find(id);
            return View(medicine);
        }

        // POST: Medicine/EditMedicineName
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMedicineDose(SysMedicineDosesValue medicine)
        {
            if (medicine.Value == "" || medicine.Value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                medicine.Text = medicine.Value.Trim();
                db.Entry(medicine).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: User/DeleteMedicineDose/5
        public ActionResult DeleteMedicineDose(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var item = db.SysMedicineDosesValues.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }
            return View(item);
        }

        // POST: User/DeleteMedicineDose/5
        [HttpPost, ActionName("DeleteMedicineDose")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteMedicineDose(int id)
        {
            var item = db.SysMedicineDosesValues.Find(id);
            db.SysMedicineDosesValues.Remove(item);
            db.SaveChanges();
            TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
            return RedirectToAction("Index");
        }

        // GET: Medicine/CreateMedicineTiming
        public ActionResult CreateMedicineTiming()
        {
            return View();
        }

        // POST: Medicine/CreateMedicineTiming
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateMedicineTiming(string value)
        {
            if (value == "" || value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                db.SysMedicineTimingsValues.Add(new SysMedicineTimingsValue { Value = value.Trim(), Text = value.Trim() });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: Medicine/EditMedicineName
        public ActionResult EditMedicineTiming(int id)
        {
            var medicine = db.SysMedicineTimingsValues.Find(id);
            return View(medicine);
        }

        // POST: Medicine/EditMedicineName
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMedicineTiming(SysMedicineTimingsValue medicine)
        {
            if (medicine.Value == "" || medicine.Value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                medicine.Text = medicine.Value.Trim();
                db.Entry(medicine).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: User/DeleteMedicineTiming/5
        public ActionResult DeleteMedicineTiming(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var item = db.SysMedicineTimingsValues.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }
            return View(item);
        }

        // POST: User/DeleteMedicineTiming/5
        [HttpPost, ActionName("DeleteMedicineTiming")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteMedicineTiming(int id)
        {
            var item = db.SysMedicineTimingsValues.Find(id);
            db.SysMedicineTimingsValues.Remove(item);
            db.SaveChanges();
            TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
            return RedirectToAction("Index");
        }

        // GET: Medicine/CreateMedicinePeriod
        public ActionResult CreateMedicinePeriod()
        {
            return View();
        }

        // POST: Medicine/CreateMedicinePeriod
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateMedicinePeriod(string value)
        {
            if (value == "" || value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                db.SysMedicinePeriodsValues.Add(new SysMedicinePeriodsValue { Value = value.Trim(), Text = value.Trim() });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: Medicine/EditMedicineName
        public ActionResult EditMedicinePeriod(int id)
        {
            var medicine = db.SysMedicinePeriodsValues.Find(id);
            return View(medicine);
        }

        // POST: Medicine/EditMedicineName
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditMedicinePeriod(SysMedicinePeriodsValue medicine)
        {
            if (medicine.Value == "" || medicine.Value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                medicine.Text = medicine.Value.Trim();
                db.Entry(medicine).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: User/DeleteMedicinePeriod/5
        public ActionResult DeleteMedicinePeriod(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var item = db.SysMedicinePeriodsValues.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }
            return View(item);
        }

        // POST: User/DeleteMedicinePeriod/5
        [HttpPost, ActionName("DeleteMedicinePeriod")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteMedicinePeriod(int id)
        {
            var item = db.SysMedicinePeriodsValues.Find(id);
            db.SysMedicinePeriodsValues.Remove(item);
            db.SaveChanges();
            TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
            return RedirectToAction("Index");
        }

        //// GET: Medicine/DoctorMedicines
        //public ActionResult DoctorMedicines(Guid id)
        //{
        //    var model = new MedicinesDoctorDTO
        //    {
        //        DoctorId = id,
        //        Medicines = db.SysMedicinesValues.OrderBy(t => t.Text).Select(m => new MedicineDoctor
        //        {
        //            Id = m.Id,
        //            Text = m.Text,
        //            IsChecked = m.DoctorMedicinesValues.Any(d => d.DoctorId == id)
        //        }).ToList()
        //    };
        //    ViewBag.DoctorName = db.Doctors.Find(id).FullName;
        //    return View(model);
        //}

        //// POST: Medicine/DoctorMedicines
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult DoctorMedicines(MedicinesDoctorDTO model)
        //{
        //    db.DoctorMedicinesValues.RemoveRange(db.DoctorMedicinesValues.Where(d => d.DoctorId == model.DoctorId));
        //    foreach (var item in model.Medicines)
        //    {
        //        if (item.IsChecked)
        //        {
        //            var doctorMedicine = new DoctorMedicinesValue
        //            {
        //                DoctorId = model.DoctorId,
        //                MedicineId = item.Id,
        //                IsActive = true,
        //                IsDeleted = false,
        //                CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
        //                CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
        //                UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
        //                UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
        //            };
        //            db.DoctorMedicinesValues.Add(doctorMedicine);
        //        }
        //    }
        //    db.SaveChanges();
        //    TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
        //    return RedirectToAction("Index","Doctor");
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