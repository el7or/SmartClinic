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
        private readonly static ConnectionMapping<string> _connections = new ConnectionMapping<string>();
        public ChatHub(ApplicationDbContext context)
        {
            _context = context;
        }
        public override async Task OnConnectedAsync()
        {
            string userId = Context.User.FindFirst(JwtRegisteredClaimNames.Jti).Value;
            _connections.Add(userId, Context.ConnectionId);
            await base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception exception)
        {
            string userId = Context.User.FindFirst(JwtRegisteredClaimNames.Jti).Value;
            _connections.Remove(userId, Context.ConnectionId);
            return base.OnDisconnectedAsync(exception);
        }

        // update externals count
        public async Task UpdateExternalCount(string doctorId)
        {
            var clinicOfDoctor = _context.DoctorClinics.FirstOrDefault(d => d.DoctorId == Guid.Parse(doctorId));
            var usersInClinic = _context.Clinics.Where(i => i.Id == clinicOfDoctor.ClinicId).Include(u => u.ClinicUsers).FirstOrDefault().ClinicUsers.Select(u => u.UserId).ToArray();
            foreach (var userId in usersInClinic)
            {
                foreach (var connectionId in _connections.GetConnections(userId.ToString()))
                {
                    var count = _context.PatientReferrals.Where(r => r.ReferralToDoctorId == Guid.Parse(doctorId) && r.IsRead != true).Count();
                    await Clients.Client(connectionId).SendAsync("UpdateExternalCount", count);
                }
            }            
        }
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }

    public class ConnectionMapping<T>
    {
        private readonly Dictionary<T, HashSet<string>> _connections =
            new Dictionary<T, HashSet<string>>();
        public int Count
        {
            get
            {
                return _connections.Count;
            }
        }
        public void Add(T key, string connectionId)
        {
            lock (_connections)
            {
                HashSet<string> connections;
                if (!_connections.TryGetValue(key, out connections))
                {
                    connections = new HashSet<string>();
                    _connections.Add(key, connections);
                }

                lock (connections)
                {
                    connections.Add(connectionId);
                }
            }
        }
        public IEnumerable<string> GetConnections(T key)
        {
            HashSet<string> connections;
            if (_connections.TryGetValue(key, out connections))
            {
                return connections;
            }
            return Enumerable.Empty<string>();
        }

        public void Remove(T key, string connectionId)
        {
            lock (_connections)
            {
                HashSet<string> connections;
                if (!_connections.TryGetValue(key, out connections))
                {
                    return;
                }
                lock (connections)
                {
                    connections.Remove(connectionId);

                    if (connections.Count == 0)
                    {
                        _connections.Remove(key);
                    }
                }
            }
        }
    }
}
