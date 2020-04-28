using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class RayDoctorDTO
    {
        public Guid DoctorId { get; set; }
        public List<RayName> RayNames { get; set; }
        public List<RayArea> RayAreas { get; set; }
    }
    public class RayName
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
    public class RayArea
    {
        public int Id { get; set; }
        public string Area { get; set; }
    }

    public class RayCreateNameDTO
    {
        public Guid DoctorId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Name { get; set; }
    }

    public class RayCreateAreaDTO
    {
        public Guid DoctorId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Area { get; set; }
    }
}