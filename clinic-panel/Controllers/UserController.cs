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

namespace clinic_panel.Controllers
{
    public class UserController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: User
        public ActionResult Index()
        {
            var users = db.AspNetUsers.Where(d => d.IsDeleted != true).Include(r => r.AspNetRoles)
                .OrderBy(u => u.CreatedOn).Select(u => new UserIndexDTO
                {
                    Id = u.Id,
                    UserName = u.UserName,
                    FullName = u.FullName,
                    RoleName = u.AspNetRoles.FirstOrDefault().Title,
                    ClinicName = db.Clinics.FirstOrDefault(c => c.AspNetUsers.Any(i => i.Id == u.Id)).ClinicName,
                    IsActive = u.IsActive == false ? "معطل" : "مفعل",
                    CreatedBy = db.AspNetUsers.FirstOrDefault(n => n.Id == u.CreatedBy).FullName,
                    CreatedOn = u.CreatedOn,
                    EditedBy = db.AspNetUsers.FirstOrDefault(n => n.Id == u.EditedBy).FullName,
                    EditedOn = u.EditedOn,
                }).OrderBy(u => u.CreatedOn);
            return View(users.ToList());
        }

        // GET: User/Roles
        public ActionResult Roles()
        {
            var roles = db.AspNetRoles.OrderBy(t => t.Title).Select(r => new UserRolesDTO
            {
                Id = r.Id,
                Title = r.Title,
                Description = r.Description,
                UsersCount = r.AspNetUsers.Count()
            });
            return View(roles.ToList());
        }

        // GET: User/ResetPassword
        public ActionResult ResetPassword(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser user = db.AspNetUsers.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            var model = new UserResetPasswordDTO
            {
                Id = user.Id
            };
            ViewBag.UserName = user.FullName;
            return View(model);
        }

        // POST: User/ResetPassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPassword(UserResetPasswordDTO model)
        {
            if (ModelState.IsValid)
            {
                string currentUserId = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id.ToString();
                string apiUrl = ConfigurationManager.AppSettings["apiurl"];
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(apiUrl);
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", Session["token"].ToString());
                    HttpResponseMessage result = client.PostAsJsonAsync("account/ResetPassword?id=" + currentUserId, model).Result;

                    if (result.IsSuccessStatusCode)
                    {
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

        // GET: User/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser user = db.AspNetUsers.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: User/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            AspNetUser user = db.AspNetUsers.Find(id);
            user.IsDeleted = true;
            user.IsActive = false;
            user.EditedBy = db.AspNetUsers.FirstOrDefault(u => u.UserName == HttpContext.User.Identity.Name).Id;
            user.EditedOn = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "Egypt Standard Time");
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
            TempData["alert"] = "<script>Swal.fire({icon: 'success', title: 'تم الحفظ بنجاح', showConfirmButton: false, timer: 1500})</script>";
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
