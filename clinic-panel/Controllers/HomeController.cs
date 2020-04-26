using clinic_panel.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace clinic_panel.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private SmartClinicDBContext db = new SmartClinicDBContext();
        public ActionResult Index()
        {
            ViewBag.DoctorsCount = db.Doctors.Where(d => d.IsActive == true && d.IsDeleted == false).Count();
            ViewBag.ClinicsCount = db.Clinics.Where(c => c.IsActive == true && c.IsDeleted == false).Count();
            ViewBag.VisitsCount = db.Bookings.Where(b => b.IsActive == true && b.IsDeleted == false).Count();
            return View();
        }
        public ActionResult Error()
        {
            return View();
        }
    }
}