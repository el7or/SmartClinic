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
}
