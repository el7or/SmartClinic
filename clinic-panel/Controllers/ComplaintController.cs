using clinic_panel.DTOs;
using clinic_panel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace clinic_panel.Controllers
{
    public class ComplaintController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Complaint/DoctorComplaints/5
        public ActionResult DoctorComplaints(Guid id)
        {
            var model = new ComplaintDoctorDTO
            {
                DoctorId = id,
                GeneralComplaints = db.DoctorGeneralComplaintsValues.Where(d => d.DoctorId == id).Select(c => new GeneralComplaint
                {
                    Id = c.Id,
                    Complaint = c.Complaint
                }).ToList(),
                DetailedComplaints = db.DoctorDetailedComplaintsValues.Where(d => d.DoctorId == id).Select(c => new DetailedComplaint
                {
                    Id = c.Id,
                    Complaint = c.Complaint,
                    ChoicesCount = c.DoctorComplaintChoicesValues.Count()
                }).ToList()
            };
            ViewBag.DoctorName = db.Doctors.Find(id).FullName;
            return View(model);
        }

        // GET: Complaint/CreateGeneralComplaint/5
        public ActionResult CreateGeneralComplaint(Guid id)
        {
            var doctor = db.Doctors.Find(id);
            var model = new ComplaintCreateDTO
            {
                DoctorId = doctor.Id
            };
            ViewBag.DoctorName = doctor.FullName;
            return View(model);
        }

        // POST: Complaint/CreateGeneralComplaint
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateGeneralComplaint(ComplaintCreateDTO model)
        {
            if (ModelState.IsValid)
            {
                db.DoctorGeneralComplaintsValues.Add(new DoctorGeneralComplaintsValue
                {
                    DoctorId = model.DoctorId,
                    Complaint = model.Complaint,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("DoctorComplaints", new { id = model.DoctorId });
            }
            return View();
        }

        // GET: Complaint/CreateDetailedComplaint/5
        public ActionResult CreateDetailedComplaint(Guid id)
        {
            var doctor = db.Doctors.Find(id);
            var model = new ComplaintCreateDTO
            {
                DoctorId = doctor.Id
            };
            ViewBag.DoctorName = doctor.FullName;
            return View(model);
        }

        // POST: Complaint/CreateDetailedComplaint
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateDetailedComplaint(ComplaintCreateDTO model)
        {
            if (ModelState.IsValid)
            {
                db.DoctorDetailedComplaintsValues.Add(new DoctorDetailedComplaintsValue
                {
                    DoctorId = model.DoctorId,
                    Complaint = model.Complaint,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("DoctorComplaints", new { id = model.DoctorId });
            }
            return View();
        }

        // GET: Complaint/CreateChoice/5
        public ActionResult CreateChoice(int id)
        {
            var complaint = db.DoctorDetailedComplaintsValues.Find(id);
            var model = new ComplaintCreateChoiceDTO
            {
                DoctorId = complaint.DoctorId,
                DetailedComplaintId = complaint.Id
            };
            ViewBag.ComplaintName = complaint.Complaint;
            return View(model);
        }

        // POST: Complaint/CreateDetailedComplaint
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateChoice(ComplaintCreateChoiceDTO model)
        {
            if (ModelState.IsValid)
            {
                db.DoctorComplaintChoicesValues.Add(new DoctorComplaintChoicesValue
                {
                    DetailedComplaintId = model.DetailedComplaintId,
                    Choice = model.Choice,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                });
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("DoctorComplaints", new { id = model.DoctorId });
            }
            return View();
        }

        // GET: Complaint/ChoiceDetails/5
        public ActionResult ChoiceDetails(int id)
        {
            var complaint = db.DoctorDetailedComplaintsValues.Find(id);
            ViewBag.Choices = complaint.DoctorComplaintChoicesValues.Select(c => c.Choice).ToArray();
            ViewBag.ComplaintName = complaint.Complaint;
            ViewBag.DoctorId = complaint.DoctorId;
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