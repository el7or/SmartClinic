using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class SpecialtyIndexDTO
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public int DoctorsCount { get; set; }
    }
    public class SpecialtyCreateDTO
    {
        public string Value { get; set; }
    }
}