using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;
using clinic_api.Data;
using clinic_api.DTOs;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ChatController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ChatController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Chat/GetChatUsers/5
        [HttpGet("GetChatUsers/{id}/{clinicId}")]
        public async Task<ActionResult<IEnumerable<UserChatDTO>>> GetChatUsers(Guid id, Guid clinicId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var model = await _context.ClinicUsers.Where(c => c.ClinicId == clinicId)
                .Include(u => u.User).ThenInclude(m => m.MessagesSent)
                .Include(u => u.User).ThenInclude(r => r.UserRoles)
                .Include("User.UserRoles.Role")
                .Select(u => new UserChatDTO
            {
                Id = u.User.Id,
                Name = u.User.FullName,
                Title = u.User.LastActive,
                Unread = u.User.MessagesSent.Where(m => m.IsRead != true).Count(),
                Picture = u.User.UserRoles.FirstOrDefault().Role.Name == "doctor" ? "assets/images/doctor.png" : "assets/images/employee.png"
                }).ToListAsync();
            return model;
        }

        // GET: api/Chat/GetExternalCount/5
        [HttpGet("GetExternalCount/{id}/{doctorId}")]
        public ActionResult<int> GetExternalCount(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            return _context.PatientReferrals.Where(r => r.ReferralToDoctorId == doctorId && r.IsRead != true).Count();
        }
    }
}