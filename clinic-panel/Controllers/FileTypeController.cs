using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using clinic_panel.DTOs;
using clinic_panel.Models;

namespace clinic_panel.Controllers
{
    public class FileTypeController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();

        // GET: FileType
        public ActionResult Index()
        {
            var model = new FileTypeIndexDTO
            {
                RayFileTypes = db.SysRayFileTypesValues.OrderBy(t => t.Text).Select(r => new RayFileType
                {
                    Id = r.Id,
                    Text  = r.Text,
                    FilesCount = r.PatientRayFiles.Count()
                }).ToList(),
                AnalysisFileTypes = db.SysAnalysisFileTypesValues.OrderBy(t => t.Text).Select(a => new AnalysisFileType
                {
                    Id = a.Id,
                    Text = a.Text,
                    FilesCount = a.PatientAnalysisFiles.Count()
                }).ToList()
            };
            return View(model);
        }

        // GET: FileType/CreateRayFileType
        public ActionResult CreateRayFileType()
        {
            return View();
        }

        // POST: FileType/CreateRayFileType
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateRayFileType(string value)
        {
            if (value == "" || value == null) ModelState.AddModelError("Value", "لا بد من إدخال نوع الملف !");
            if (ModelState.IsValid)
            {
                db.SysRayFileTypesValues.Add(new SysRayFileTypesValue { Value = value, Text = value });
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View();
        }

        // GET: FileType/CreateAnalysisFileType
        public ActionResult CreateAnalysisFileType()
        {
            return View();
        }

        // POST: FileType/CreateAnalysisFileType
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateAnalysisFileType(string value)
        {
            if (value == "" || value == null) ModelState.AddModelError("Value", "لا بد من إدخال نوع الملف !");
            if (ModelState.IsValid)
            {
                db.SysAnalysisFileTypesValues.Add(new SysAnalysisFileTypesValue { Value = value, Text = value });
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View();
        }

        //// GET: FileType/Edit/5
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysRayFileTypeValue sysRayFileTypeValue = db.SysRayFileTypeValues.Find(id);
        //    if (sysRayFileTypeValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysRayFileTypeValue);
        //}

        //// POST: FileType/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Id,Value,Text")] SysRayFileTypeValue sysRayFileTypeValue)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(sysRayFileTypeValue).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(sysRayFileTypeValue);
        //}

        //// GET: FileType/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysRayFileTypeValue sysRayFileTypeValue = db.SysRayFileTypeValues.Find(id);
        //    if (sysRayFileTypeValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysRayFileTypeValue);
        //}

        //// GET: FileType/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SysRayFileTypeValue sysRayFileTypeValue = db.SysRayFileTypeValues.Find(id);
        //    if (sysRayFileTypeValue == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(sysRayFileTypeValue);
        //}

        //// POST: FileType/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    SysRayFileTypeValue sysRayFileTypeValue = db.SysRayFileTypeValues.Find(id);
        //    db.SysRayFileTypeValues.Remove(sysRayFileTypeValue);
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
