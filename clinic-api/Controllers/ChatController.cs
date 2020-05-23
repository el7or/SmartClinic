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
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace clinic_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ChatController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IHubContext<ChatHub> _hub;

        public ChatController(ApplicationDbContext context, IHubContext<ChatHub> hub)
        {
            _context = context;
            _hub = hub;
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
                }).Where(i => i.Id != id).ToListAsync();

            await _hub.Clients.User(id.ToString()).SendAsync("UpdateUnreadChatCount", 0);
            return model;
        }

        // GET: api/Chat/GetChatMessages/5
        [HttpGet("GetChatMessages/{id}/{chatUserId}")]
        public async Task<ActionResult<IEnumerable<ChatMessageDTO>>> GetChatMessages(Guid id, Guid chatUserId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var messages = _context.ChatMessages
            .Where(m => (m.SenderId == id && m.ReceiverId == chatUserId) || (m.SenderId == chatUserId && m.ReceiverId == id))
            .Include(u => u.Sender).ThenInclude(r => r.UserRoles).Include("Sender.UserRoles.Role")
            .OrderBy(m => m.SentOn);

            var model = messages.Select(m => new ChatMessageDTO
            {
                Text = m.MessageText,
                Date = m.SentOn,
                Reply = m.SenderId == id,
                User = new MessageUser
                {
                    Name = m.Sender.FullName,
                    Avatar = m.Sender.UserRoles.FirstOrDefault().Role.Name == "doctor" ? "assets/images/doctor.png" : "assets/images/employee.png"
                }
            }).ToList();

            var messagesForCurrentUser = messages.Where(m => m.ReceiverId == id && m.IsRead != true);
            messagesForCurrentUser.ToList().ForEach(m =>
            {
                m.ReadOn = DateTime.Now;
                m.IsRead = true;
                _context.Entry(m).State = EntityState.Modified;
            });
            await _context.SaveChangesAsync();

            await _hub.Clients.User(id.ToString()).SendAsync("UpdateUnreadChatCount", messagesForCurrentUser.Count());
            return model;
        }

        // POST: api/Chat/PostChatMessage/5
        [HttpPost("PostChatMessage/{id}")]
        public async Task<IActionResult> PostChatMessage(Guid id, NewMessageDTO model)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            _context.ChatMessages.Add(new Models.ChatMessage
            {
                SenderId = id,
                ReceiverId = model.ReceiverId,
                MessageText = model.MessageText,
                SentOn = DateTime.Now
            });
            await _context.SaveChangesAsync();

            await _hub.Clients.User(model.ReceiverId.ToString()).SendAsync("NewMessageReceived", new MessageReceivedDTO
            {
                SenderId = id,
                MessageText = model.MessageText
            });
            await _hub.Clients.User(model.ReceiverId.ToString()).SendAsync("UpdateUnreadChatCount",
                _context.ChatMessages.Where(m => m.ReceiverId == model.ReceiverId && m.IsRead != true).Count());

            return NoContent();
        }

        // GET: api/Chat/GetUnreadCount/5
        [HttpGet("GetUnreadCount/{id}/{doctorId}")]
        public ActionResult<UnreadCountDTO> GetUnreadCount(Guid id, Guid doctorId)
        {
            if (id.ToString() != User.FindFirst(JwtRegisteredClaimNames.Jti).Value.ToString())
            {
                return Unauthorized();
            }
            var unReadExternals = _context.PatientReferrals.Where(r => r.ReferralToDoctorId == doctorId && r.IsRead != true).Count();
            var unReadMessages = _context.ChatMessages.Where(m => m.ReceiverId == id && m.ReadOn == null).Count();
            return new UnreadCountDTO
            {
                UnreadExternals = unReadExternals,
                UnreadMessages = unReadMessages
            };
        }
    }
}