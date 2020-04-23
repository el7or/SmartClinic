using clinic_panel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class GradesIndexDTO
    {
        public List<SysBloodPressureValue> BloodPressureValues { get; set; }
        public List<SysDiseaseGradesValue> DiseaseGradesValues { get; set; }
    }
}