using clinic_panel.DTOs;
using clinic_panel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace clinic_panel.Controllers
{
    public class OperationController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Operation/DoctorOperations/5
        public ActionResult DoctorOperations(Guid id)
        {
            var model = new OperationsDoctorDTO
            {
                DoctorId = id,
                Operations = db.DoctorOperationTypesValues.Where(d => d.DoctorId == id).Select(d => new Operation
                {
                    Id = d.Id,
                    OperationType = d.OperationType
                }).ToList()
            };
            ViewBag.DoctorName = db.Doctors.Find(id).FullName;
            return View(model);
        }

        // GET: Operation/CreateDoctorOperation/5
        public ActionResult CreateDoctorOperation(Guid id)
        {
            var doctor = db.Doctors.Find(id);
            var model = new OperationCreateDTO
            {
                DoctorId = doctor.Id
            };
            ViewBag.DoctorName = doctor.FullName;
            return View(model);
        }

        // POST: Operation/CreateDoctorOperation
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateDoctorOperation(OperationCreateDTO model)
        {
            if (ModelState.IsValid)
            {
                db.DoctorOperationTypesValues.Add(new DoctorOperationTypesValue
                {
                    DoctorId = model.DoctorId,
                    OperationType = model.OperationType,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                });
                db.SaveChanges();
                return RedirectToAction("DoctorOperations", new { id = model.DoctorId });
            }
            return View();
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