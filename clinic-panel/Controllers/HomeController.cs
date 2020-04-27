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
            ViewBag.UsersCount = db.AspNetUsers.Where(c => c.IsActive == true && c.IsDeleted == false).Count();
            var totalFees = db.Subscriptions.Sum(s => s.SignUpFee);
            var totalPaid = db.SubscriptionPayments.Sum(p => (decimal?) p.Paid);
            ViewBag.TotalDue = (totalFees==null?0:totalFees) - (totalPaid == null ? 0 : totalPaid);
            return View();
        }
        public ActionResult Error()
        {
            return View();
        }
    }
}