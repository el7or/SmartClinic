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
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public async Task<ActionResult> Contact()
        {
            //Hosted web API REST Service base url 
            string apiUrl = ConfigurationManager.AppSettings["baseurl"] + "/api/weatherforecast";

            using (var client = new HttpClient())
            {
                //Passing service base url  
                client.BaseAddress = new Uri(apiUrl);
                client.DefaultRequestHeaders.Clear();

                //Define request data format  
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                //Sending request to find web api REST service resource using HttpClient  
                HttpResponseMessage result = await client.GetAsync(apiUrl);

                //If success received   
                if (result.IsSuccessStatusCode)
                {
                    var responseData = result.Content.ReadAsStringAsync().Result;
                    ViewBag.Message = responseData;
                }
                else
                {
                    //Error response received
                    ViewBag.Message = "Server error try after some time.";
                }
            }
            return View();
        }
    }
}