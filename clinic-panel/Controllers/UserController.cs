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

namespace clinic_panel.Controllers
{
    public class UserController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: User
        public ActionResult Index()
        {
            var users = db.AspNetUsers.Where(d => d.IsDeleted != true).Include(r => r.AspNetRoles).Select(u => new UserIndexDTO
            {
                Id = u.Id,
                UserName = u.UserName,
                FullName = u.FullName,
                RoleName = u.AspNetRoles.FirstOrDefault().Title,
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

        //// GET: User/Details/5
        //public ActionResult Details(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    AspNetUser aspNetUser = db.AspNetUsers.Find(id);
        //    if (aspNetUser == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(aspNetUser);
        //}

        //// GET: User/Create
        //public ActionResult Create()
        //{
        //    return View();
        //}

        //// POST: User/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "Id,UserName,NormalizedUserName,Email,NormalizedEmail,EmailConfirmed,PasswordHash,SecurityStamp,ConcurrencyStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEnd,LockoutEnabled,AccessFailedCount,FullName,IsActive,IsDeleted,CreatedOn,CreatedBy,EditedOn,EditedBy")] AspNetUser aspNetUser)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        aspNetUser.Id = Guid.NewGuid();
        //        db.AspNetUsers.Add(aspNetUser);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(aspNetUser);
        //}

        //// GET: User/Edit/5
        //public ActionResult Edit(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    AspNetUser aspNetUser = db.AspNetUsers.Find(id);
        //    if (aspNetUser == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(aspNetUser);
        //}

        //// POST: User/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,UserName,NormalizedUserName,Email,NormalizedEmail,EmailConfirmed,PasswordHash,SecurityStamp,ConcurrencyStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEnd,LockoutEnabled,AccessFailedCount,FullName,IsActive,IsDeleted,CreatedOn,CreatedBy,EditedOn,EditedBy")] AspNetUser aspNetUser)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(aspNetUser).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(aspNetUser);
        //}

        //// GET: User/Delete/5
        //public ActionResult Delete(Guid? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    AspNetUser aspNetUser = db.AspNetUsers.Find(id);
        //    if (aspNetUser == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(aspNetUser);
        //}

        //// POST: User/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(Guid id)
        //{
        //    AspNetUser aspNetUser = db.AspNetUsers.Find(id);
        //    db.AspNetUsers.Remove(aspNetUser);
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
