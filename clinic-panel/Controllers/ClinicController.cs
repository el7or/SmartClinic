using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;
using clinic_panel.DTOs;
using clinic_panel.Models;
using Newtonsoft.Json;

namespace clinic_panel.Controllers
{
    public class ClinicController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Clinic
        public ActionResult Index()
        {
            var model = db.Clinics.Where(c => c.IsActive == true && c.IsDeleted == false)
                .Include(u => u.AspNetUsers)
                .Include(u => u.AspNetUsers.Select(r => r.AspNetRoles))
                .OrderBy(c => c.CreatedOn)
                .Select(c => new ClinicIndexDTO
                {
                    Id = c.Id,
                    ClinicName = c.ClinicName,
                    Doctors = c.AspNetUsers.Where(u => u.AspNetRoles.Any(r => r.Name == "doctor")).Select(u => u.FullName).ToList(),
                    Employees = c.AspNetUsers.Where(u => u.AspNetRoles.Any(r => r.Name == "employee")).Select(u => u.FullName).ToList()
                }).ToList();
            return View(model);
        }

        // GET: Clinic/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Clinic/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ClinicName")] Clinic clinic)
        {
            if (ModelState.IsValid)
            {
                clinic.Id = Guid.NewGuid();
                clinic.IsActive = true;
                clinic.IsDeleted = false;
                clinic.CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id;
                clinic.CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time");
                clinic.UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id;
                clinic.UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time");
                db.Clinics.Add(clinic);
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }

            return View(clinic);
        }

        // GET: Clinic/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clinic clinic = db.Clinics.Find(id);
            if (clinic == null)
            {
                return HttpNotFound();
            }
            return View(clinic);
        }

        // POST: Clinic/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ClinicName")] Clinic model)
        {
            if (ModelState.IsValid)
            {
                var clinic = db.Clinics.Find(model.Id);
                clinic.ClinicName = model.ClinicName;
                clinic.UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id;
                clinic.UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time");
                db.Entry(clinic).State = EntityState.Modified;
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View(model);
        }

        // GET: Clinic/AddDoctor/5
        public ActionResult AddDoctor(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clinic clinic = db.Clinics.Find(id);
            if (clinic == null)
            {
                return HttpNotFound();
            }
            ClinicAddDoctorDTO model = new ClinicAddDoctorDTO();
            model.ClinicId = clinic.Id;
            model.Paid = 5000;

            ViewBag.ClinicName = clinic.ClinicName;
            ViewData["SpecialtyId"] = new SelectList(db.SysDoctorsSpecialties, "Id", "Value");
            ViewData["PharmacyId"] = new SelectList(db.Pharmacies, "Id", "PharmacyName");
            ViewData["PlanId"] = new SelectList(db.Plans.Where(p => p.SubscriberTypeId == 1), "Id", "Title", 1);
            ViewData["EntryOrderId"] = new SelectList(db.SysEntryOrderValues, "Id", "Text", 2);
            var allPeriods = new List<SelectListItem>() {
                    new SelectListItem{Value = "5", Text = "5"},
                    new SelectListItem{Value = "10", Text = "10"},
                    new SelectListItem{Value = "15", Text = "15"},
                    new SelectListItem{Value = "20", Text = "20"},
                    new SelectListItem{Value = "30", Text = "30"},
                    new SelectListItem{Value = "45", Text = "45"},
                    new SelectListItem{Value = "60", Text = "60"},
                };
            ViewData["BookingPeriod"] = new SelectList(allPeriods, "Value", "Text", 15);
            return View(model);
        }

        // POST: Clinic/AddDoctor/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddDoctor(ClinicAddDoctorDTO model)
        {
            if (db.AspNetUsers.FirstOrDefault(u => u.UserName.ToLower().Trim() == model.UserName.ToLower().Trim()) != null)
            {
                ModelState.AddModelError("UserName", "اسم المستخدم هذا مسجل قبل ذلك !");
            }
            if (db.AspNetUsers.FirstOrDefault(u => u.FullName.ToLower().Trim() == model.FullName.ToLower().Trim()) != null)
            {
                ModelState.AddModelError("FullName", "اسم الطبيب هذا مسجل قبل ذلك !");
            }
            if (Session["token"] == null || Session["token"].ToString() == "")
            {
                return RedirectToAction("Login", "Account");
            }
            if (ModelState.IsValid)
            {
                // add user:
                model.RoleName = "doctor";
                string currentUserId = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id.ToString();
                string apiUrl = ConfigurationManager.AppSettings["apiurl"];
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(apiUrl);
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", Session["token"].ToString());
                    HttpResponseMessage result = client.PostAsJsonAsync("account/Register?id=" + currentUserId, model).Result;

                    if (result.IsSuccessStatusCode)
                    {
                        var responseData = result.Content.ReadAsStringAsync().Result;
                        model.UserId = Guid.Parse(JsonConvert.DeserializeObject<string>(responseData));
                    }
                    else
                    {
                        ModelState.AddModelError("", "حدث خطأ ما !");
                        return View(model);
                    }
                }

                // add doctor:
                var clinic = db.Clinics.Find(model.ClinicId);
                var user = db.AspNetUsers.Find(model.UserId);
                var doctor = new Doctor
                {
                    Id = Guid.NewGuid(),
                    UserId = model.UserId,
                    FullName = model.FullName,
                    SpecialtyId = model.SpecialtyId,
                    Phone1 = model.Phone1,
                    Phone2 = model.Phone2,
                    Phone3 = model.Phone3,
                    WhatsApp = model.WhatsApp,
                    Email1 = model.Email1,
                    Email2 = model.Email2,
                    Facebook = model.Facebook,
                    Twitter = model.Twitter,
                    LinkedIn = model.LinkedIn,
                    Instagram = model.Instagram,
                    PatientRecordSections = "All",
                    DiseasesQuestions = "All",
                    EntryOrderId = model.EntryOrderId,
                    BookingPeriod = model.BookingPeriod,
                    ConsultExpiration = model.ConsultExpiration,
                    WorkDays = "6,0,1,2,3,4,5",
                    IsAllDaysOn = true,
                    IsAllDaysSameTime = true,
                    AllDaysTimeFrom = new DateTime(2020, 1, 1, 9, 0, 0),
                    AllDaysTimeTo = new DateTime(2020, 1, 1, 22, 0, 0),
                    SaturdayTimeFrom = new DateTime(2020, 1, 1, 9, 0, 0),
                    FridayTimeFrom = new DateTime(2020, 1, 1, 9, 0, 0),
                    MondayTimeFrom = new DateTime(2020, 1, 1, 9, 0, 0),
                    SundayTimeFrom = new DateTime(2020, 1, 1, 9, 0, 0),
                    ThursdayTimeFrom = new DateTime(2020, 1, 1, 9, 0, 0),
                    TuesdayTimeFrom = new DateTime(2020, 1, 1, 9, 0, 0),
                    WednesdayTimeFrom = new DateTime(2020, 1, 1, 9, 0, 0),
                    SaturdayTimeTo = new DateTime(2020, 1, 1, 22, 0, 0),
                    FridayTimeTo = new DateTime(2020, 1, 1, 22, 0, 0),
                    MondayTimeTo = new DateTime(2020, 1, 1, 22, 0, 0),
                    SundayTimeTo = new DateTime(2020, 1, 1, 22, 0, 0),
                    ThursdayTimeTo = new DateTime(2020, 1, 1, 22, 0, 0),
                    TuesdayTimeTo = new DateTime(2020, 1, 1, 22, 0, 0),
                    WednesdayTimeTo = new DateTime(2020, 1, 1, 22, 0, 0),
                    PrintAddress1 = model.PrintAddress1,
                    PrintAddress2 = model.PrintAddress2,
                    PrintAddress3 = model.PrintAddress3,
                    PrintClinicName = model.PrintClinicName,
                    PrintDoctorDegree = model.PrintDoctorDegree,
                    PrintDoctorName = model.PrintDoctorName,
                    PrintPhone1 = model.PrintPhone1,
                    PrintPhone2 = model.PrintPhone2,
                    PrintPhone3 = model.PrintPhone3,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                };
                db.Doctors.Add(doctor);
                db.DoctorPharmacies.Add(new DoctorPharmacy { DoctorId = doctor.Id, PharmacyId = model.PharmacyId, IsDefault = true });
                clinic.Doctors.Add(doctor);
                clinic.AspNetUsers.Add(user);
                var newBookingTypes = new List<DoctorBookingType>() {
                    new DoctorBookingType
                    {
                        Doctor = doctor,
                        Type = "diagnose",
                        Text = "كشف",
                        Price = model.DiagnosePrice,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                        UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                    },
                    new DoctorBookingType
                    {
                        Doctor = doctor,
                        Type = "consult",
                        Text = "استشارة",
                        Price = model.ConsultPrice,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                        UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                    },
                    new DoctorBookingType
                    {
                        Doctor = doctor,
                        Type = "justService",
                        Text = "خدمة فقط",
                        Price = 0,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                        UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                    }
                };
                db.DoctorBookingTypes.AddRange(newBookingTypes);

                // add subscription:
                var plan = db.Plans.Find(model.PlanId);
                var subscription = new Subscription
                {
                    SubscriberId = doctor.Id,
                    UserId = model.UserId,
                    SubscriberTypeId = 1, // Doctor
                    Plan = plan,
                    SubscriptionTypeId = 1, // First Time
                    StartDate = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    EndDate = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time").AddYears(1),
                    Note = model.SubsNote,
                    SignUpFee = plan.SignUpFee,
                    AnnualRenewalFee = plan.AnnualRenewalFee,
                    MonthlyRenewalFee = plan.MonthlyRenewalFee,
                    GracePeriodDays = plan.GracePeriodDays,
                    MaxUsers = plan.MaxUsers,
                    MaxBookingsMonthly = plan.MaxBookingsMonthly,
                    MaxFilesMonthlyMB = plan.MaxFilesMonthlyMB,
                    MaxFileSizeMB = plan.MaxFileSizeMB,
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                };
                db.Subscriptions.Add(subscription);
                var payment = new SubscriptionPayment
                {
                    Subscription = subscription,
                    Paid = (decimal)plan.SignUpFee,
                    Note = model.PayNote,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                };
                db.SubscriptionPayments.Add(payment);

                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View(model);
        }

        // GET: Clinic/AddEmployee/5
        public ActionResult AddEmployee(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clinic clinic = db.Clinics.Find(id);
            if (clinic == null)
            {
                return HttpNotFound();
            }
            var model = new ClinicAddEmployeeDTO
            {
                ClinicId = clinic.Id
            };
            ViewBag.ClinicName = clinic.ClinicName;
            return View(model);
        }

        // POST: Clinic/AddEmployee
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddEmployee(ClinicAddEmployeeDTO model)
        {
            if (ModelState.IsValid)
            {
                model.RoleName = "employee";
                string currentUserId = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id.ToString();
                string apiUrl = ConfigurationManager.AppSettings["apiurl"];
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(apiUrl);
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", Session["token"].ToString());
                    HttpResponseMessage result = client.PostAsJsonAsync("account/Register?id=" + currentUserId, model).Result;

                    if (result.IsSuccessStatusCode)
                    {
                        var responseData = result.Content.ReadAsStringAsync().Result;
                        var userId = Guid.Parse(JsonConvert.DeserializeObject<string>(responseData));
                        var user = db.AspNetUsers.Find(userId);
                        var clinic = db.Clinics.Find(model.ClinicId);
                        clinic.AspNetUsers.Add(user);
                        db.SaveChanges();
                        TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ModelState.AddModelError("", "حدث خطأ ما !");
                        return View(model);
                    }
                }
            }
            return View(model);
        }


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
