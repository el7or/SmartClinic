using clinic_panel.DTOs;
using clinic_panel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
                MedicineNames = db.SysMedicinesValues.OrderBy(t => t.Text).Select(r => new MedicineName
                {
                    Id = r.Id,
                    Text = r.Text,
                }).ToList(),
                MedicineConcentrations = db.SysMedicineConcentrationsValues.OrderBy(t => t.Text).Select(r => new MedicineConcentration
                {
                    Id = r.Id,
                    Text = r.Text,
                }).ToList(),
                MedicineDoses = db.SysMedicineDosesValues.OrderBy(t => t.Text).Select(r => new MedicineDose
                {
                    Id = r.Id,
                    Text = r.Text,
                }).ToList(),
                MedicineForms = db.SysMedicineFormsValues.OrderBy(t => t.Text).Select(r => new MedicineForm
                {
                    Id = r.Id,
                    Text = r.Text,
                }).ToList(),
                MedicineTimings = db.SysMedicineTimingsValues.OrderBy(t => t.Text).Select(r => new MedicineTiming
                {
                    Id = r.Id,
                    Text = r.Text,
                }).ToList(),
                MedicinePeriods = db.SysMedicinePeriodsValues.OrderBy(t => t.Text).Select(r => new MedicinePeriod
                {
                    Id = r.Id,
                    Text = r.Text,
                }).ToList()
            };
            return View(model);
        }

        // GET: Medicine/CreateMedicineName
        public ActionResult CreateMedicineName()
        {
            return View();
        }

        // POST: Medicine/CreateMedicineName
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateMedicineName(string value)
        {
            if (value == "" || value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                db.SysMedicinesValues.Add(new SysMedicinesValue { Value = value, Text = value });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: Medicine/CreateMedicineConcentration
        public ActionResult CreateMedicineConcentration()
        {
            return View();
        }

        // POST: Medicine/CreateMedicineConcentration
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateMedicineConcentration(string value)
        {
            if (value == "" || value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                db.SysMedicineConcentrationsValues.Add(new SysMedicineConcentrationsValue { Value = value, Text = value });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: Medicine/CreateMedicineForm
        public ActionResult CreateMedicineForm()
        {
            return View();
        }

        // POST: Medicine/CreateMedicineForm
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateMedicineForm(string value)
        {
            if (value == "" || value == null) ModelState.AddModelError("Value", "لا بد من إدخال قيمة !");
            if (ModelState.IsValid)
            {
                db.SysMedicineFormsValues.Add(new SysMedicineFormsValue { Value = value, Text = value });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
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
                db.SysMedicineDosesValues.Add(new SysMedicineDosesValue { Value = value, Text = value });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
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
                db.SysMedicineTimingsValues.Add(new SysMedicineTimingsValue { Value = value, Text = value });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
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
                db.SysMedicinePeriodsValues.Add(new SysMedicinePeriodsValue { Value = value, Text = value });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View();
        }

        // GET: Medicine/DoctorMedicines
        public ActionResult DoctorMedicines(Guid id)
        {
            var model = new MedicinesDoctorDTO
            {
                DoctorId = id,
                Medicines = db.SysMedicinesValues.OrderBy(t => t.Text).Select(m => new MedicineDoctor
                {
                    Id = m.Id,
                    Text = m.Text,
                    IsChecked = m.DoctorMedicinesValues.Any(d => d.DoctorId == id)
                }).ToList()
            };
            ViewBag.DoctorName = db.Doctors.Find(id).FullName;
            return View(model);
        }

        // POST: Medicine/CreateMedicinePeriod
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DoctorMedicines(MedicinesDoctorDTO model)
        {
            db.DoctorMedicinesValues.RemoveRange(db.DoctorMedicinesValues.Where(d => d.DoctorId == model.DoctorId));
            foreach (var item in model.Medicines)
            {
                if (item.IsChecked)
                {
                    var doctorMedicine = new DoctorMedicinesValue
                    {
                        DoctorId = model.DoctorId,
                        MedicineId = item.Id,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                        UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                    };
                    db.DoctorMedicinesValues.Add(doctorMedicine);
                }
            }
            db.SaveChanges();
            TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
            return RedirectToAction("Index","Doctor");
        }

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