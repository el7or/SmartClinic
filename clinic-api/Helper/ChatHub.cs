using clinic_api.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.Helper
{
    [Authorize]
    public class ChatHub : Hub
    {
        private readonly ApplicationDbContext _context;
        public ChatHub(ApplicationDbContext context)
        {
            _context = context;
        }

        // update externals count
        public async Task UpdateExternalCount(string doctorId)
        {
            var clinicOfDoctor = _context.DoctorClinics.FirstOrDefault(d => d.DoctorId == Guid.Parse(doctorId));
            var usersInClinic = _context.Clinics.Where(i => i.Id == clinicOfDoctor.ClinicId).Include(u => u.ClinicUsers).FirstOrDefault().ClinicUsers.Select(u => u.UserId).ToArray();
            foreach (var userId in usersInClinic)
            {
                var count = _context.PatientReferrals.Where(r => r.ReferralToDoctorId == Guid.Parse(doctorId) && r.IsRead != true).Count();
                await Clients.User(userId.ToString()).SendAsync("UpdateExternalCount", count);
            }            
        }
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }

    public class NameUserIdProvider : IUserIdProvider
    {
        public virtual string GetUserId(HubConnectionContext connection)
        {
            return connection.User?.FindFirst(JwtRegisteredClaimNames.Jti)?.Value;
        }
    }
}
