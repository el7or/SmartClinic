﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace clinic_api.Models
{
    public partial class DoctorService
    {
        public DoctorService()
        {
            BookingServices = new HashSet<BookingService>();
        }

        public int Id { get; set; }
        public Guid DoctorId { get; set; }

        [StringLength(256)]
        public string Service { get; set; }
        public decimal? Price { get; set; }
        public bool? IsActive { get; set; }
        public bool? IsDeleted { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime UpdatedOn { get; set; }
        public Guid UpdatedBy { get; set; }

        public virtual Doctor Doctor { get; set; }
        public virtual ICollection<BookingService> BookingServices { get; set; }
    }
}