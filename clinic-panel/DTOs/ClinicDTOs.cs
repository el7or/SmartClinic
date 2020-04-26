using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace clinic_panel.DTOs
{
    public class ClinicPriceDTO
    {
        public Guid? Id { get; set; }
        public List<BookingTypePrice> BookingTypePrices { get; set; }
        public List<ServicePrice> ServicePrices { get; set; }
        public List<DiscountPrice> DiscountPrices { get; set; }
    }
    public class BookingTypePrice
    {
        public int Id { get; set; }
        public string Type { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        public decimal? Price { get; set; }
    }
    public class ServicePrice
    {
        public int Id { get; set; }
        public string Service { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        public decimal? Price { get; set; }
    }
    public class DiscountPrice
    {
        public int Id { get; set; }
        public string Discount { get; set; }

        [DisplayFormat(DataFormatString = "{0:N0}", ApplyFormatInEditMode = true)]
        public decimal? Price { get; set; }
        public bool? IsPercent { get; set; }
    }

    public class ClinicCreateBookingTypeDTO
    {
        public Guid ClinicId { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        public string Type { get; set; }

        [Required(ErrorMessage = "لابد من إدخال قيمة !")]
        [RegularExpression(@"^[0-9]+(\.[0-9][0-9]?)?", ErrorMessage = "لابد من إدخال صيغة رقمية صحيحة !")]
        public decimal? Price { get; set; }
    }
}