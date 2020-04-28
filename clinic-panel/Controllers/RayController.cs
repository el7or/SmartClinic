using clinic_panel.DTOs;
using clinic_panel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace clinic_panel.Controllers
{
    public class RayController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Ray/DoctorRays/5
        public ActionResult DoctorRays(Guid id)
        {
            var model = new RayDoctorDTO
            {
                DoctorId = id,
                RayNames = db.DoctorRaysValues.Where(d => d.DoctorId == id).Select(e => new RayName
                {
                    Id = e.Id,
                    Name = e.RayName
                }).ToList(),
                RayAreas = db.DoctorRayAreasValues.Where(d => d.DoctorId == id).Select(e => new RayArea
                {
                    Id = e.Id,
                    Area = e.RayArea
                }).ToList()
            };
            ViewBag.DoctorName = db.Doctors.Find(id).FullName;
            return View(model);
        }

        // GET: Ray/CreateRayName/5
        public ActionResult CreateRayName(Guid id)
        {
            var doctor = db.Doctors.Find(id);
            var model = new RayCreateNameDTO
            {
                DoctorId = doctor.Id
            };
            ViewBag.DoctorName = doctor.FullName;
            return View(model);
        }

        // POST: Ray/CreateRayName
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateRayName(RayCreateNameDTO model)
        {
            if (ModelState.IsValid)
            {
                db.DoctorRaysValues.Add(new DoctorRaysValue
                {
                    DoctorId = model.DoctorId,
                    RayName = model.Name,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                });
                db.SaveChanges();
                return RedirectToAction("DoctorRays", new { id = model.DoctorId });
            }
            return View();
        }

        // GET: Ray/CreateRayArea/5
        public ActionResult CreateRayArea(Guid id)
        {
            var doctor = db.Doctors.Find(id);
            var model = new RayCreateAreaDTO
            {
                DoctorId = doctor.Id
            };
            ViewBag.DoctorName = doctor.FullName;
            return View(model);
        }

        // POST: Ray/CreateRayArea
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateRayArea(RayCreateAreaDTO model)
        {
            if (ModelState.IsValid)
            {
                db.DoctorRayAreasValues.Add(new DoctorRayAreasValue
                {
                    DoctorId = model.DoctorId,
                    RayArea = model.Area,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                });
                db.SaveChanges();
                return RedirectToAction("DoctorRays", new { id = model.DoctorId });
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