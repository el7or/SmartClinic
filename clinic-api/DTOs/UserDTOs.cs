using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class UserPutDTO
    {
        public Guid UserId { get; set; }
        public string FullName { get; set; }
    }
    public class UserGetClinicUser
    {
        public Guid Id { get; set; }
        public string FullName { get; set; }
        public string RoleTitle { get; set; }
        public bool? IsActive { get; set; }
    }
}
