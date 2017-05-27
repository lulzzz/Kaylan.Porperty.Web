namespace Kalyan.Property.Infrastructure.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Contact
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        public long Phone { get; set; }

        public DateTime CreatedDate { get; set; }

        [StringLength(10)]
        public string CreatedBy { get; set; }

        [Required]
        public string Message { get; set; }

    }
}
