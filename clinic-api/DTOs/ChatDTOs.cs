using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class UserChatDTO
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public DateTime Title { get; set; }
        public string Picture { get; set; }
        public int Unread { get; set; }
    }

    public class ChatMessageDTO
    {
        public string Text { get; set; }
        public bool Reply { get; set; }
        public DateTime Date { get; set; }
        public MessageUser User { get; set; }
    }
    public class MessageUser
    {
        public string Name { get; set; }
        public string Avatar { get; set; }
    }
    public class NewMessageDTO
    {
        public Guid ReceiverId { get; set; }
        public string MessageText { get; set; }
    }
    public class MessageReceivedDTO
    {
        public int Id { get; set; }
        public Guid SenderId { get; set; }
        public string MessageText { get; set; }
    }

    public class UnreadCountDTO
    {
        public int UnreadMessages{ get; set; }
        public int UnreadExternals { get; set; }
    }
}
