using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace clinic_api.DTOs
{
    public class AccountLoginDTO
    {
        [Required]
        public string UserName { get; set; }

        [Required]
        public string Password { get; set; }
    }

    public class AccountDetailsDTO
    {
        public string RoleName { get; set; }
        public string ClinicId { get; set; }
    }

    public class AccountRegisterDTO
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string RoleName { get; set; }
        public string FullName { get; set; }
    }
}
