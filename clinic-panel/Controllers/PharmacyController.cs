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
    public class PharmacyController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: Pharmacy
        public ActionResult Index()
        {
            var pharmacies = db.Pharmacies.Select(p => new PharmacyIndexDTO
            {
                Id = p.Id,
                PharmacistName = p.PharmacistName,
                PharmacyName = p.PharmacyName,
                Phone1 = p.Phone1,
                StartSubscriptionDate = db.Subscriptions.Where(s => s.SubscriberId == p.Id).OrderBy(d => d.StartDate).FirstOrDefault().StartDate,
                EndSubscriptionDate = db.Subscriptions.Where(s => s.SubscriberId == p.Id).OrderByDescending(d => d.EndDate).FirstOrDefault().EndDate,
                SubscriptionsCount = db.Subscriptions.Where(s => s.SubscriberId == p.Id).Count(),
                SubscriptionsPaid = (int) db.Subscriptions.Where(s => s.SubscriberId == p.Id).Sum(s => s.SubscriptionPayments.Sum(y => y.Paid)),
                IsActive = p.IsActive == false ? "معطل" : "مفعل"
            });
            return View(pharmacies.ToList());
        }

        // GET: Pharmacy/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pharmacy pharmacy = db.Pharmacies.Find(id);
            if (pharmacy == null)
            {
                return HttpNotFound();
            }
            return View(pharmacy);
        }

        // GET: Pharmacy/Create
        public ActionResult Create()
        {
            var pharmacyPlan = db.Plans.FirstOrDefault(p => p.Id==4);
            var model = new PharmacyCreateDTO
            {
                Plan = pharmacyPlan.Title,
                SignUpFee =(int) pharmacyPlan.SignUpFee,
                SubsStartDate  = new DateTime(DateTime.Now.AddMonths(1).Year, DateTime.Now.AddMonths(1).Month, 1)
        };
            return View(model);
        }

        // POST: Pharmacy/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PharmacyCreateDTO model)
        {
            if (db.AspNetUsers.FirstOrDefault(u => u.UserName.ToLower().Trim() == model.UserName.ToLower().Trim()) != null)
            {
                ModelState.AddModelError("UserName", "اسم المستخدم هذا مسجل قبل ذلك !");
            }
            if (db.AspNetUsers.FirstOrDefault(u => u.FullName.ToLower().Trim() == model.PharmacyName.ToLower().Trim()) != null)
            {
                ModelState.AddModelError("PharmacyName", "اسم الصيدلية هذا مسجل قبل ذلك !");
            }
            if (Session["token"] == null || Session["token"].ToString() == "")
            {
                return RedirectToAction("Login", "Account");
            }
            if (ModelState.IsValid)
            {
                var accountModel = new PharmacyAccountDTO
                {
                    UserName = model.UserName,
                    Password = model.Password,
                    FullName = model.PharmacyName,
                    RoleName = "pharmacy"
                };
                string currentUserId = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id.ToString();
                string apiUrl = ConfigurationManager.AppSettings["apiurl"];
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(apiUrl);
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", Session["token"].ToString());
                    HttpResponseMessage result = client.PostAsJsonAsync("account/Register?id=" + currentUserId, accountModel).Result;

                    if (result.IsSuccessStatusCode)
                    {
                        var responseData = result.Content.ReadAsStringAsync().Result;
                        var userId = JsonConvert.DeserializeObject<string>(responseData);
                        var pharmacy = new Pharmacy
                        {
                            Id = Guid.NewGuid(),
                            UserId = Guid.Parse(userId),
                            PharmacyName = model.PharmacyName,
                            PharmacistName = model.PharmacistName,
                            Email = model.Email,
                            Phone1 = model.Phone1,
                            Phone2 = model.Phone2,
                            WhatsApp = model.WhatsApp,
                            Address = model.Address,
                            IsActive = true,
                            IsDeleted = false,
                            CreatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                            CreatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time"),
                            UpdatedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id,
                            UpdatedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time")
                        };
                        db.Pharmacies.Add(pharmacy);
                        var plan = db.Plans.Find(4); // باقة الصيدليات
                        var subscription = new Subscription
                        {
                            SubscriberId = pharmacy.Id,
                            SubscriberTypeId = 2, // Pharmacy
                            Plan = plan, 
                            SubscriptionTypeId = 1, // First Time
                            StartDate = model.SubsStartDate,
                            EndDate = new DateTime(model.SubsStartDate.Year, model.SubsStartDate.Month, DateTime.DaysInMonth(model.SubsStartDate.Year, model.SubsStartDate.Month)),
                            Note = model.SubsNote,
                            SignUpFee = plan.SignUpFee,
                            MonthlyRenewalFee = plan.MonthlyRenewalFee,
                            GracePeriodDays = plan.GracePeriodDays,
                            MaxUsers = plan.MaxUsers,
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
                            Paid = (decimal) plan.SignUpFee,
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
                    else
                    {
                        ModelState.AddModelError("", "حدث خطأ ما !");
                        return View(model);
                    }
                }                
            }
            return View(model);
        }

        // GET: Pharmacy/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pharmacy pharmacy = db.Pharmacies.Find(id);
            if (pharmacy == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(db.AspNetUsers, "Id", "UserName", pharmacy.UserId);
            return View(pharmacy);
        }

        // POST: Pharmacy/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,UserId,PharmacyName,PharmacistName,IsActive,IsDeleted,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy,Phone1,Phone2,WhatsApp,Email,Address")] Pharmacy pharmacy)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pharmacy).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.AspNetUsers, "Id", "UserName", pharmacy.UserId);
            return View(pharmacy);
        }

        // GET: Pharmacy/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pharmacy pharmacy = db.Pharmacies.Find(id);
            if (pharmacy == null)
            {
                return HttpNotFound();
            }
            return View(pharmacy);
        }

        // POST: Pharmacy/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Pharmacy pharmacy = db.Pharmacies.Find(id);
            db.Pharmacies.Remove(pharmacy);
            db.SaveChanges();
            return RedirectToAction("Index");
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
