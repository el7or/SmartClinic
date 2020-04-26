﻿using System;
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
    public class DoctorController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Doctor
        public ActionResult Index()
        {
            var doctors = db.Doctors.Include(s => s.SysDoctorsSpecialty).Include(c => c.Clinics).Include(p => p.Patients)
                .Select(d => new DoctorIndexDTO
                {
                    Id = d.Id,
                    FullName = d.FullName,
                    Specialty = d.SysDoctorsSpecialty.Text,
                    Plan = db.Subscriptions.FirstOrDefault(p => p.SubscriberId == d.Id).Plan.Title,
                    StartPlanDate = db.Subscriptions.FirstOrDefault(p => p.SubscriberId == d.Id).StartDate,
                    EndPlanDate = db.Subscriptions.FirstOrDefault(p => p.SubscriberId == d.Id).EndDate,
                    SubscriptionDue = ( (int) db.Subscriptions.FirstOrDefault(s => s.SubscriberId == d.Id).SignUpFee) - ((int)db.Subscriptions.FirstOrDefault(s => s.SubscriberId == d.Id).SubscriptionPayments.Sum(p => p.Paid)),
                    UsersCount = d.Clinics.Sum(c => c.AspNetUsers.Count()),
                    ClinicsCount = d.Clinics.Count(),
                    PatientsCount = d.Patients.Count(),
                    IsActive = d.IsActive == false ? "معطل" : "مفعل",
                });
            return View(doctors.ToList());
        }

        // GET: Doctor/Create
        public ActionResult Create()
        {
            ViewBag.Tab = 0;
            return View();
        }

        // POST: Doctor/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DoctorCreateUserDTO model)
        {
            if (db.AspNetUsers.FirstOrDefault(u => u.UserName.ToLower().Trim() == model.UserName.ToLower().Trim()) != null)
            {
                ModelState.AddModelError("UserName", "اسم المستخدم هذا مسجل قبل ذلك !");
            }
            if (db.AspNetUsers.FirstOrDefault(u => u.FullName.ToLower().Trim() == model.FullName.ToLower().Trim()) != null)
            {
                ModelState.AddModelError("FullName", "اسم الطبيب هذا مسجل قبل ذلك !");
            }
            if (ModelState.IsValid)
            {
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
                        var userId = JsonConvert.DeserializeObject<string>(responseData);
                        ViewData["Tab1Model"] = new DoctorCreateDTO
                        {
                            UserId = Guid.Parse(userId),
                            FullName = model.FullName
                        };
                        TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                        ViewData["SpecialtyId"] = new SelectList(db.SysDoctorsSpecialties, "Id", "Value");
                        ViewBag.Tab = 1;
                        return View();
                    }
                    else
                    {
                        ModelState.AddModelError("", "حدث خطأ ما !");
                        ViewBag.Tab = 0;
                        return View(model);
                    }
                }
            }
            ViewBag.Tab = 0;
            return View(model);
        }

        // POST: Doctor/CreateDoctor
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateDoctor(DoctorCreateDTO model)
        {
            if (ModelState.IsValid)
            {
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
                    IsActive = true,
                    IsDeleted = false,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                };
                db.Doctors.Add(doctor);
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                ViewData["Tab2Model"] = new DoctorCreateSubsDTO
                {
                    UserId = model.UserId,
                    DoctorId = doctor.Id,
                    PlanId = 2,
                    SignUpFee = 3000
                };
                ViewData["PlanId"] = new SelectList(db.Plans, "Id", "Title", 2);
                ViewBag.Tab = 2;
                return View("Create");
            }
            ViewData["Tab1Model"] = model;
            ViewData["SpecialtyId"] = new SelectList(db.SysDoctorsSpecialties, "Id", "Value", model.SpecialtyId);
            ViewBag.Tab = 1;
            return View("Create");
        }

        // POST: Doctor/CreateSubs
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateSubs(DoctorCreateSubsDTO model)
        {
            if (ModelState.IsValid)
            {
                var plan = db.Plans.Find(model.PlanId);
                var subscription = new Subscription
                {
                    SubscriberId = model.DoctorId,
                    SubscriberTypeId = 1, // Doctor
                    Plan = plan,
                    SubscriptionTypeId = 1, // First Time
                    StartDate = DateTime.Now,
                    EndDate = DateTime.Now.AddYears(1),
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
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                };
                db.Subscriptions.Add(subscription);
                var payment = new SubscriptionPayment
                {
                    Subscription = subscription,
                    Paid = model.Paid,
                    NextPaymentDate = model.NextPaymentDate,
                    Note = model.PayNote,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                };
                db.SubscriptionPayments.Add(payment);
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                ViewData["Tab3Model"] = new DoctorCreateClinicDTO
                {
                    UserId = model.UserId,
                    DoctorId = model.DoctorId,
                    BookingPeriod = 15,
                    EntryOrderId = 3,
                    ConsultExpiration = 15
                };
                ViewData["EntryOrderId"] = new SelectList(db.SysEntryOrderValues, "Id", "Text", 3);
                ViewBag.Tab = 3;
                return View("Create");
            }
            ViewData["Tab2Model"] = model;
            ViewData["PlanId"] = new SelectList(db.Plans, "Id", "Title", model.PlanId);
            ViewBag.Tab = 2;
            return View("Create");
        }

        // POST: Doctor/CreateClinic
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateClinic(DoctorCreateClinicDTO model)
        {
            if (ModelState.IsValid)
            {
                var doctor = db.Doctors.Find(model.DoctorId);
                var user = db.AspNetUsers.Find(model.UserId);
                var clinic = new Clinic
                {
                    Id = Guid.NewGuid(),
                    ClinicName = model.ClinicName,
                    EntryOrderId = model.EntryOrderId,
                    BookingPeriod = model.BookingPeriod,
                    ConsultExpiration = model.ConsultExpiration,
                    IsAllDaysOn = true,
                    WorkDays = "6, 0, 1, 2, 3, 4, 5",
                    IsAllDaysSameTime = true,
                    AllDaysTimeFrom = new DateTime(2020, 1, 1, 9, 0, 0),
                    AllDaysTimeTo = new DateTime(2020, 1, 1, 22, 0, 0),
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
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                };
                clinic.Doctors.Add(doctor);
                clinic.AspNetUsers.Add(user);
                db.Clinics.Add(clinic);
                var newBookingTypes = new List<ClinicBookingType>() {
                    new ClinicBookingType
                    {
                        Clinic = clinic,
                        Type = "diagnose",
                        Text = "كشف",
                        Price = 0,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        CreatedOn = DateTime.Now,
                        UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        UpdatedOn = DateTime.Now
                    },
                    new ClinicBookingType
                    {
                        Clinic = clinic,
                        Type = "consult",
                        Text = "استشارة",
                        Price = 0,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        CreatedOn = DateTime.Now,
                        UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        UpdatedOn = DateTime.Now
                    },
                    new ClinicBookingType
                    {
                        Clinic = clinic,
                        Type = "justService",
                        Text = "خدمة فقط",
                        Price = 0,
                        IsActive = true,
                        IsDeleted = false,
                        CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        CreatedOn = DateTime.Now,
                        UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                        UpdatedOn = DateTime.Now
                    }
                };
                db.ClinicBookingTypes.AddRange(newBookingTypes);
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            ViewData["Tab3Model"] = model;
            ViewData["EntryOrderId"] = new SelectList(db.SysEntryOrderValues, "Id", "Text", model.EntryOrderId);
            ViewBag.Tab = 3;
            return View("Create");
        }

        // GET: Doctor/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Doctor doctor = db.Doctors.Include(c => c.Clinics).FirstOrDefault(d => d.Id == id);
            Subscription subscription = db.Subscriptions.Include(p => p.SubscriptionPayments).FirstOrDefault(s => s.SubscriberId == id);
            Clinic clinic = doctor.Clinics.FirstOrDefault();
            if (doctor == null)
            {
                return HttpNotFound();
            }
            var model = new DoctorDetailsDTO
            {
                FullName = doctor.FullName,
                Specialty = doctor.SysDoctorsSpecialty.Text,
                Phone1 = doctor.Phone1,
                Phone2 = doctor.Phone2,
                Phone3 = doctor.Phone3,
                WhatsApp = doctor.WhatsApp,
                Email1 = doctor.Email1,
                Email2 = doctor.Email2,
                Facebook = doctor.Facebook,
                Twitter = doctor.Twitter,
                Instagram = doctor.Instagram,
                LinkedIn = doctor.LinkedIn,
                Plan = subscription.Plan.Title,
                SubsNote = subscription.Note,
                SignUpFee = (int)subscription.SignUpFee,
                Paid = (int)subscription.SubscriptionPayments.Sum(p => p.Paid),
                NextPaymentDate = subscription.SubscriptionPayments.FirstOrDefault().NextPaymentDate,
                PayNote = subscription.SubscriptionPayments.FirstOrDefault().Note,
                ClinicName = clinic.ClinicName,
                BookingPeriod = clinic.BookingPeriod,
                ConsultExpiration = clinic.ConsultExpiration,
                EntryOrder = clinic.SysEntryOrderValue.Text,
                PrintAddress1 = clinic.PrintAddress1,
                PrintAddress2 = clinic.PrintAddress2,
                PrintAddress3 = clinic.PrintAddress3,
                PrintClinicName = clinic.PrintClinicName,
                PrintDoctorDegree = clinic.PrintDoctorDegree,
                PrintDoctorName = clinic.PrintDoctorName,
                PrintPhone1 = clinic.PrintPhone1,
                PrintPhone2 = clinic.PrintPhone2,
                PrintPhone3 = clinic.PrintPhone3
            };
            return View(model);
        }

        // GET: Doctor/AddUser/5
        public ActionResult AddUser(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clinic clinic = db.Doctors.Include(c => c.Clinics).FirstOrDefault(d => d.Id == id).Clinics.FirstOrDefault();
            if (clinic == null)
            {
                return HttpNotFound();
            }
            var model = new DoctorAddUserDTO
            {
                ClinicId = clinic.Id
            };
            ViewBag.ClinicName = clinic.ClinicName;
            return View(model);
        }

        // POST: Doctor/AddUser
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddUser(DoctorAddUserDTO model)
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

        // GET: Doctor/AddPayment/5
        public ActionResult AddPayment(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Doctor doctor = db.Doctors.Find(id);
            if (doctor == null)
            {
                return HttpNotFound();
            }
            Subscription subscription = db.Subscriptions.FirstOrDefault(s => s.SubscriberId == id);
            var model = new DoctorAddPaymentDTO
            {
                SubscriptionId = subscription.Id,
                Due = ((int)subscription.SignUpFee) - ((int)subscription.SubscriptionPayments.Sum(p => p.Paid)),
            };
            ViewBag.DoctorName = doctor.FullName;
            return View(model);
        }

        // POST: Doctor/AddPayment
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddPayment(DoctorAddPaymentDTO model)
        {
            if (ModelState.IsValid)
            {
                var payment = new SubscriptionPayment
                {
                    SubscriptionId = model.SubscriptionId,
                    Paid = model.Paid,
                    NextPaymentDate = model.NextPaymentDate,
                    Note = model.Note,
                    CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    CreatedOn = DateTime.Now,
                    UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                    UpdatedOn = DateTime.Now
                };
                db.SubscriptionPayments.Add(payment);
                db.SaveChanges();
                TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
                return RedirectToAction("Index");
            }
            return View(model);
        }


        //// GET: Doctor/Edit/5
        //public ActionResult Edit(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Doctor doctor = db.Doctors.Find(id);
        //    if (doctor == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.SpecialtyId = new SelectList(db.SysDoctorsSpecialties, "Id", "Value", doctor.SpecialtyId);
        //    return View(doctor);
        //}

        //// POST: Doctor/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,UserId,SpecialtyId,FullName,IsActive,IsDeleted,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,PatientRecordSections,DiseasesQuestions,Phone1,Phone2,Phone3,WhatsApp,Email1,Email2,Facebook,Twitter,LinkedIn,Instagram")] Doctor doctor)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(doctor).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.SpecialtyId = new SelectList(db.SysDoctorsSpecialties, "Id", "Value", doctor.SpecialtyId);
        //    return View(doctor);
        //}

        //// GET: Doctor/Delete/5
        //public ActionResult Delete(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Doctor doctor = db.Doctors.Find(id);
        //    if (doctor == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(doctor);
        //}

        //// POST: Doctor/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(Guid id)
        //{
        //    Doctor doctor = db.Doctors.Find(id);
        //    db.Doctors.Remove(doctor);
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
