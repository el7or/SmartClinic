using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;
using clinic_api.Data;
using clinic_api.DTOs;
using clinic_api.Helper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ContactController(ApplicationDbContext context)
        {
            _context = context;
        }
        // POST: api/Contact/5
        [HttpPost("{id}")]
        public async Task<IActionResult> PostChatMessage(Guid id, ContactMessageDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var userName = _context.Users.Find(id).FullName;
            var clinicName = _context.Clinics.Find(model.ClinicId).ClinicName;
            var mailText = "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\"><body class=\"body\" style=\"text-align:center;direction: rtl !important;padding:0 !important; margin:0 !important; display:block !important; min-width:100% !important; width:100% !important; background-color: lightblue; -webkit-text-size-adjust:none;\"><h1>رسالة من المستخدم: " + userName + "</h1><h2>من عيادة: " + clinicName + "</h2><h3>نص الرسالة:</h3><p>" + model.Message + "</p></body></html>";
            await EmailSender.SendEmailAsync(model.Subject, mailText);

            return NoContent();
        }
    }
}